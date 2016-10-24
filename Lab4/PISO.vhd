----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:05:42 10/05/2016 
-- Design Name: 
-- Module Name:    PISO - Behavioral 
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

entity PISO is
	port (
			Din : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			Qout : out std_logic_vector(3 downto 0)
			);
end PISO;

architecture Behavioral of PISO is



begin

end Behavioral;

