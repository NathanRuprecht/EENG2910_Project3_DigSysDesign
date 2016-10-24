----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:15:33 10/14/2016 
-- Design Name: 
-- Module Name:    RightShift - Behavioral 
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

entity RightShift is
	port (
			Din : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			Qout : out std_logic_vector(3 downto 0)
			);
end RightShift;

architecture Behavioral of RightShift is
----------------------------------------------------------------------------------
component SISO is
	port (
			Din : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			Qout : out std_logic_vector(3 downto 0)
			);
end component;
----------------------------------------------------------------------------------
component PIPO is
	port (
			Din : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			Qout : out std_logic_vector(3 downto 0)
			);
end component;
----------------------------------------------------------------------------------
signal temp : std_logic_vector(3 downto 0) := Din;

begin

	shift_2: PIPO --works with tb
		port map (
			Din => Din,
			CLK => CLK,
			RST => RST,
			Qout => Qout
			);
			
	shift_3: SISO
		port map (
			Din => "0000",
			CLK => CLK,
			RST => RST,
			Qout => Qout
			);

end Behavioral;

