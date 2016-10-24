----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Nathan A Ruprecht 
-- 
-- Create Date:    20:05:30 10/05/2016 
-- Design Name: 
-- Module Name:    SISO - Behavioral 
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

entity SISO is
	port (
			Din : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			Qout : out std_logic_vector(3 downto 0)
			);
end SISO;

architecture Behavioral of SISO is
----------------------------------------------------------------------------------
component dff is
	port(
			D : in std_logic;
			CLK : in std_logic;
			RST : in std_logic;
			Q : out std_logic
			);
end component;
----------------------------------------------------------------------------------
signal q0, q1, q2, q3 : std_logic;

begin

	ff1: dff
		port map (
			D => Din(0),
			CLK => CLK,
			RST => RST,
			Q => q0
			);
	ff2: dff
		port map (
			D => q0,
			CLK => CLK,
			RST => RST,
			Q => q1
			);
	ff3: dff
		port map (
			D => q1,
			CLK => CLK,
			RST => RST,
			Q => q2
			);
	ff4: dff
		port map (
			D => q2,
			CLK => CLK,
			RST => RST,
			Q => q3
			);

Qout <= "000" & q3;

end Behavioral;

