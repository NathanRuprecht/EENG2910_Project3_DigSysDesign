----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Nathan Ruprecht
--						Yang Qi
--						Ayodele Ojo
--						Maher Alsanwi
-- 
-- Create Date:    15:00:41 09/28/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;

entity ALU is
    Port ( 	  A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0);
				I_we : out std_logic;
				rst : in std_logic;
				we_done: in std_logic
				);
end ALU;

architecture Behavioral of ALU is
--------------------------------------------------------------------------------
    component add_const
    port (
        A       :   in  std_logic_vector(7 downto 0);
        B       :   in  std_logic_vector(7 downto 0);
        Y       :   out std_logic_vector(7 downto 0);
        C_out   :   out std_logic
        );
    end component;
--------------------------------------------------------------------------------
    component add_reg
    port (
        A       :   in  std_logic_vector(7 downto 0);
        B       :   in  std_logic_vector(7 downto 0);
        Y       :   out std_logic_vector(7 downto 0);
        C_out   :   out std_logic
        );
    end component;
--------------------------------------------------------------------------------
    component sub_const
    port (
        A       :   in  std_logic_vector(7 downto 0);
        B       :   in  std_logic_vector(7 downto 0);
        Y       :   out std_logic_vector(7 downto 0);
        C_out   :   out std_logic
        );
    end component;
--------------------------------------------------------------------------------
    component sub_reg
    port (
        A       :   in  std_logic_vector(7 downto 0);
        B       :   in  std_logic_vector(7 downto 0);
        Y       :   out std_logic_vector(7 downto 0);
        C_out   :   out std_logic
        );
    end component;
--------------------------------------------------------------------------------
    component shift_left
        port (
            A   :   in  std_logic_vector(7 downto 0);
            B   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
    end component;
--------------------------------------------------------------------------------
    component shift_right
        port (
            A   :   in  std_logic_vector(7 downto 0);
            B   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
    end component;
--------------------------------------------------------------------------------
    component compare
        port (
            A   :   in  std_logic_vector(7 downto 0);
            B   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
    end component;
-------------------------------------------------------------------------------- 
     
    signal  s_Y0 :   std_logic_vector(7 downto 0);-- := (others => '0');
    signal  s_Y1 :   std_logic_vector(7 downto 0);
    signal  s_Y2 :   std_logic_vector(7 downto 0);
    signal  s_Y3 :   std_logic_vector(7 downto 0);
	 signal  s_Y4 :   std_logic_vector(7 downto 0);
	 signal  s_Y5 :   std_logic_vector(7 downto 0);
	 signal  s_Y6 :   std_logic_vector(7 downto 0);
	 signal c_out0 : std_logic;
	 signal c_out1 : std_logic;
	 signal c_out2 : std_logic;
	 signal c_out3 : std_logic;
	 
begin
 
    Adder_1 : add_const
    port map (
        A => A,
        B => B,
        Y => s_Y0,
        C_out => c_out0
        );
		  
	Adder_2 : add_reg
    port map (
        A => A,
        B => B,
        Y => s_Y1,
        C_out => c_out1
        );

    Subtractor_1 : sub_const
    port map(
        A => A,
        B => B,
        Y => s_Y2,
		  C_out => c_out2

        );

    Subtractor_2 : sub_reg
    port map(
        A => A,
        B => B,
        Y => s_Y3,
		  C_out => c_out3
        );
   
    Shifter_1 : shift_left
    port map(
        A => A,
        B => B,
        Y => s_Y5
        );

    Shifter_2 : shift_right
    port map(
        A => A,
        B => B,
        Y => s_Y6
        );
    Compare_1 : compare
    port map(
        A => A,
        B => B,
        Y => s_Y4
        );  
  
    process(Sel, A, B, rst,we_done, s_Y0, s_Y1, s_Y2, s_Y3, s_Y4, s_Y5, s_Y6)
    begin
      if (rst = '1') then
			I_we <= '0';
			Y <= "00000000";
		else
		   case Sel is
          when "000" => Y <= s_Y0;   		
          when "001" => Y <= s_Y1;     	
          when "010" => Y <= s_Y2;    		 
          when "011" => Y <= s_Y3;     	
			 when "100" => Y <= s_Y4;     	
          when "101" => Y <= s_Y5;     	
          when "110" => Y <= s_Y6;
          when others => Y <= (others => '0');
			end case;  
		  
		  if (we_done = '1') then
		   I_we <= '0';
			else
			case Sel is
          when "000" =>  		I_we <= '1';  --add_const
          when "001" =>     	I_we <= '1';--add_reg
          when "010" =>   		I_we <= '1'; --sub_const
          when "011" =>       I_we <= '1';--sub_reg
			 when "100" =>   		I_we <= '1';--compare
          when "101" =>    	I_we <= '1';--shift left
          when "110" => 		I_we <= '1';--shift right
          when others => Y <= (others => '0');
        end case;  
		  end if;
		end if;
    end process;

end Behavioral;