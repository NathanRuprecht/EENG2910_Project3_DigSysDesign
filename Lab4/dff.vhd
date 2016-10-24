----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:03 10/05/2016 
-- Design Name: 
-- Module Name:    dff - Behavioral 
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

entity dff is
	port(
		D : in std_logic;
		CLK : in std_logic;
		RST : in std_logic;
		Q : out std_logic
		);
end dff;

architecture Behavioral of dff is

begin

process (CLK)
begin
	if CLK'event and CLK='1' then  --CLK rising edge
		if RST ='1' then --synchronous RESET active High
			Q <= '0';
		else
			Q <= D;
		end if;
	end if;
end process;

end Behavioral;

