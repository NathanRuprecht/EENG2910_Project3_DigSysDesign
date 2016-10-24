----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		 Nathan A Ruprecht
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is
--------------------------------------------------------------------------------
    component adder_eight_bit
    port (
        A       :   in  std_logic_vector(7 downto 0);
        B       :   in  std_logic_vector(7 downto 0);
        Y       :   out std_logic_vector(7 downto 0);
        C_out   :   out std_logic
        );
    end component;
--------------------------------------------------------------------------------
    component comparator
        port (
            A   :   in  std_logic_vector(7 downto 0);
            B   :   in  std_logic_vector(7 downto 0);
            Y   :   out  std_logic_vector(7 downto 0)
            );
    end component;
--------------------------------------------------------------------------------
    component ALU_xor
        port (
            A   :   in  std_logic_vector(7 downto 0);
            B   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
    end component;
--------------------------------------------------------------------------------
    component shifter
        port (
            A   :   in  std_logic_vector(7 downto 0);
            B   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
    end component;
-------------------------------------------------------------------------------- 
    component ALU_and
        port (
            A   :   in  std_logic_vector(7 downto 0);
            B   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
    end component;
--------------------------------------------------------------------------------
    component ALU_nand
        port (
            A   :   in  std_logic_vector(7 downto 0);
            B   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
    end component;
-------------------------------------------------------------------------------- 
    component twos_complement
        port (
            A   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
    end component;
--------------------------------------------------------------------------------
    component subtract_eight_bit
    port (
        A       :   in  std_logic_vector(7 downto 0);
        B       :   in  std_logic_vector(7 downto 0);
        Y       :   out std_logic_vector(7 downto 0);
        C_out   :   out std_logic
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
	 signal  s_Y7 :   std_logic_vector(7 downto 0);
	 
    signal	s_sig :	std_logic_vector(2 downto 0);
    signal  s_C_out : std_logic_vector(1 downto 0);
    
begin
s_sig<=Sel;
 
    Adder_1 : adder_eight_bit
    port map (
        A => A,
        B => B,
        Y => s_Y0,
        C_out => s_C_out(0)
        );

    Comparator_1 : comparator 
    port map(
        A => A,
        B => B,
        Y => s_Y1
        );
   
    XOR_1 : ALU_xor
    port map(
        A => A,
        B => B,
        Y => s_Y2
        );

    Shifter_1 : shifter
    port map(
        A => A,
        B => B,
        Y => s_Y3
        );  

    AND_1 : ALU_and
    port map(
        A => A,
        B => B,
        Y => s_Y4
        );  

    NAND_1 : ALU_nand
    port map(
        A => A,
        B => B,
        Y => s_Y5
        ); 

    TWOSCOMP_1 : twos_complement
    port map(
        A => A,
        Y => s_Y6
        );
		  
    Subtract_1 : subtract_eight_bit
    port map (
        A => A,
        B => B,
        Y => s_Y7,
        C_out => s_C_out(1)
        );
		  
    process(s_sig, A, B)
    begin
        case s_sig is
            when "000" => Y <= s_Y0;     --add
            when "001" => Y <= s_Y1;     --compare
            when "010" => Y <= s_Y2;     --XOR
            when "011" => Y <= s_Y3;     --shifter
				when "100" => Y <= s_Y4;     --AND
            when "101" => Y <= s_Y5;     --NAND
            when "110" => Y <= s_Y6;     --twos_complement
            when "111" => Y <= s_Y7;     --subtraction
            when others => Y <= (others => '0');
        end case;            
    end process;

end Behavioral;