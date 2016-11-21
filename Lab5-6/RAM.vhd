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

entity RAM_block is
	Port ( 
		I_clk 	: in	STD_LOGIC;
		I_we 		: in  STD_LOGIC;
		I_addr 	: in  STD_LOGIC_VECTOR (3 downto 0);
		I_data 	: in  STD_LOGIC_VECTOR (7 downto 0);
		O_data 	: out	STD_LOGIC_VECTOR (7 downto 0)
		);
end RAM_block;

architecture Behavioral of RAM_block is
	type store_t is array (0 to 15) of std_logic_vector(7 downto 0);
	
   signal RAM : store_t := (
    "00000000",		--Program Line 0
	 "00000001",		--Program Line 1
    "00000010",		--Program Line 2
    "00000011",		--Program Line 3
    "00000100",		--Program Line 4
	 "00000101",		--Program Line 5
    "00000110",		--Program Line 6
    "00000111",		--Program Line 7
    "00001000",		--Program Line 8
    "00001001",		--Program Line 9
    "00001010",		--Program Line 10
    "00001011",		--Program Line 11
    "00001100",		--Program Line 12
	 "00001101",		--Program Line 13
    "00001110",		--Program Line 14
    "00001111"			--Program Line 15
    );
begin

	process (I_clk)
	begin
		if rising_edge(I_clk) then
			if (I_we = '1') then
				ram(to_integer(unsigned(I_addr(3 downto 0)))) <= I_data;
			else
				if to_integer(unsigned(I_addr(3 downto 0)))>16 then
					O_data <= "11111111";
				else
					O_data <= ram(to_integer(unsigned(I_addr(3 downto 0))));
				end if;
			end if;
		end if;
	end process;

end Behavioral;

