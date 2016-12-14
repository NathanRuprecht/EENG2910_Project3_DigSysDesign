----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:57:40 10/18/2016 
-- Design Name: 
-- Module Name:    RAM_block - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
	Port ( 
		I_clk 	: in	STD_LOGIC;
		I_we 		: in  STD_LOGIC;
		I_addr 	: in  STD_LOGIC_VECTOR (1 downto 0);
		I_data 	: in  STD_LOGIC_VECTOR (7 downto 0);
		O_data 	: out	STD_LOGIC_VECTOR (7 downto 0)
		);
end RAM;

architecture Behavioral of RAM is
	type store_t is array (0 to 3) of std_logic_vector(7 downto 0);
	
   signal RAM_SIG : store_t := (
    "11111111",		--Program Line 0
	 "11111110",		--Program Line 1
    "11110000",		--Program Line 2
    "00000011"		--Program Line 3
    );
begin

	process (I_clk)
	begin
		if rising_edge(I_clk) then
			if (I_we = '1') then
				RAM_SIG(to_integer(unsigned(I_addr(1 downto 0)))) <= I_data;
			else
				if to_integer(unsigned(I_addr(1 downto 0)))>4 then
					O_data <= "11111111";
				else
					O_data <= RAM_SIG(to_integer(unsigned(I_addr(1 downto 0))));
				end if;
			end if;
		end if;
	end process;

end Behavioral;

