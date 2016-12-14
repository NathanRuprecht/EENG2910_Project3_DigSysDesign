----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:54:13 11/28/2016 
-- Design Name: 
-- Module Name:    shift_right - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_right is
        port (
            A   :   in  std_logic_vector(7 downto 0);
            B   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
end shift_right;

architecture Behavioral of shift_right is

signal c : std_logic;

begin
	c <= B(0);
	Y(6 downto 0) <=  B(7 downto 1);
	Y(7) <= c;
	
end Behavioral;

