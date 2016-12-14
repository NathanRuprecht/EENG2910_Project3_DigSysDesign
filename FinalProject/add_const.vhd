----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:36 11/28/2016 
-- Design Name: 
-- Module Name:    add_const - Behavioral 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_const is
    port (
        A       :   in  std_logic_vector(7 downto 0);
        B       :   in  std_logic_vector(7 downto 0);
        Y       :   out std_logic_vector(7 downto 0);
        C_out   :   out std_logic
        );
end add_const;

architecture Behavioral of add_const is
    component adder_one_bit
    Port ( 
        A       :   in  std_logic;
        B       :   in  std_logic;
        C_in    :   in  std_logic;
        S       :   out std_logic;
        C_out   :   out std_logic
        );
    end component;
    
    signal  s_Cin  :   std_logic := '0';
    signal  s_Cout0 :   std_logic;
    signal  s_Cout1 :   std_logic;
    signal  s_Cout2 :   std_logic;
    signal  s_Cout3 :   std_logic;
	 signal  s_Cout4 :   std_logic;
    signal  s_Cout5 :   std_logic;
    signal  s_Cout6 :   std_logic;
    signal  s_Cout7 :   std_logic;
    signal  result  :   std_logic_vector(8 downto 0);
    signal  Y_reg  :   std_logic_vector(7 downto 0);
    
begin
    adder_0 :   adder_one_bit
    port map (
            A => A(0),
            B => B(0),
            C_in => s_Cin,
            S => Y_reg(0),
            C_out => s_Cout0
            );

    adder_1 :   adder_one_bit
    port map (
            A => A(1),
            B => B(1),
            C_in => s_Cout0,
            S => Y_reg(1),
            C_out => s_Cout1
            );
        
    adder_2 :   adder_one_bit
    port map (
            A => A(2),
            B => B(2),
            C_in => s_Cout1,
            S => Y_reg(2),
            C_out => s_Cout2
            );
        
    adder_3 :   adder_one_bit
    port map (
            A => A(3),
            B => B(3),
            C_in => s_Cout2,
            S => Y_reg(3),
            C_out => s_Cout3
            );
	
	 adder_4 :   adder_one_bit
    port map (
            A => A(4),
            B => B(4),
            C_in => s_Cout3,
            S => Y_reg(4),
            C_out => s_Cout4
            );

    adder_5 :   adder_one_bit
    port map (
            A => A(5),
            B => B(5),
            C_in => s_Cout4,
            S => Y_reg(5),
            C_out => s_Cout5
            );
        
    adder_6 :   adder_one_bit
    port map (
            A => A(6),
            B => B(6),
            C_in => s_Cout5,
            S => Y_reg(6),
            C_out => s_Cout6
            );
        
    adder_7 :   adder_one_bit
    port map (
            A => A(7),
            B => B(7),
            C_in => s_Cout6,
            S => Y_reg(7),
            C_out => s_Cout7
            );

    C_out <= s_Cout7;
    Y <= Y_reg;
    
    result <= s_Cout7 & Y_reg;

end Behavioral;