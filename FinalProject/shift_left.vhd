----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:35:12 11/28/2016 
-- Design Name: 
-- Module Name:    shift_left - Behavioral 
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

entity shift_left is
        port (
            A   :   in  std_logic_vector(7 downto 0);
            B   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
end shift_left;

architecture Behavioral of shift_left is

signal c : std_logic;

begin
	c <= A(7);
	Y(7 downto 1) <=  A(6 downto 0);
	Y(0) <= c;
end Behavioral;

