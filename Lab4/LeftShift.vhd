----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:15:22 10/14/2016 
-- Design Name: 
-- Module Name:    LeftShift - Behavioral 
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

entity LeftShift is
	port (
			Din : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			Qout : out std_logic_vector(3 downto 0)
			);
end LeftShift;

architecture Behavioral of LeftShift is
signal temp : std_logic_vector(3 downto 0);

begin

process (CLK)
begin
	if CLK'event and CLK='1' then  --CLK rising edge
		if RST ='1' then --synchronous RESET active High
			Qout <= "0000";
		else
			Qout <= Din(2 downto 0) & '0';
		end if;
	end if;	
end process;

end Behavioral;

