----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:55 11/28/2016 
-- Design Name: 
-- Module Name:    sub_const - Behavioral 
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

entity sub_const is
	port (
        A       :   in  std_logic_vector(7 downto 0);
        B       :   in  std_logic_vector(7 downto 0);
        Y       :   out std_logic_vector(7 downto 0);
        C_out   :   out std_logic
        );
end sub_const;

architecture Behavioral of sub_const is

    component add_reg
    Port ( 
        A       :   in  std_logic_vector(7 downto 0);
        B       :   in  std_logic_vector(7 downto 0);
        Y       :   out std_logic_vector(7 downto 0);
        C_out   :   out std_logic
        );
    end component;
	
	signal B_sig : std_logic_vector (7 downto 0);
	signal Y_sig : std_logic_vector (7 downto 0);
	signal C_out0: std_logic;
begin
	B_sig <= not(B);
	Adder1: add_reg
	port map (
            A => B_sig,
            B => "00000001",
				Y => Y_sig,
				C_out => C_out0
            );
	
	Adder2: add_reg
	port map (
            A => A,
            B => Y_sig,
				Y => Y,
				C_out => C_out
            );
				
end Behavioral;

