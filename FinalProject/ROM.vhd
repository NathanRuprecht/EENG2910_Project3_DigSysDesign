----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Nathan Ruprecht
--						Yang Qi
--						Ayodele Ojo
--						Maher Alsanwi
-- 
-- Create Date:    09:57:40 10/18/2016 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity ROM is
	Port ( 
		clk 	: in	STD_LOGIC;
		I_addr 	: in  STD_LOGIC_VECTOR (3 downto 0);
		O_data 	: out	STD_LOGIC_VECTOR (7 downto 0)
		);
end ROM;

architecture Behavioral of ROM is
	type store_t is array (0 to 10) of std_logic_vector(7 downto 0);
	
   signal ROM_SIG : store_t := (
		"01000000", --instr 0		begin	clear R1
		"01000101", --instr 1				clear R2
		"00010100", --instr 2				add 5 + R1 -> R1
		"10100001", --instr 3				shift R1 left -> R2
		"01001010", --instr 4				clear R3
		"01001111", --instr 5				clear R4
		"00100110", --instr 6		loop	add R2 + R3 -> R3
		"00000111", --instr 7				add 1 + R4 -> R4
		"10000011", --instr 8				compare 4 > R4
		"10000011", --instr 9				true jmp to loop
		"11100000" 	--instr 10				false jmp to begin
    );
	 
--	function			Op code
--	add const		000	xxx(const)	xx(DST)
--	add reg			001	uxx(SRC)	xx(DST)
--	sub reg			010	uxx	xx
--	sub const		011	xxx	xx
--	compare const	100	xxx	xx
--	shift left		101	uxx	xx
--	shift right		110	uxx	xx
--	jump to addr	111	u	xxxx(ADDR)
	
begin

	process (clk)
	begin
		if rising_edge(clk) then
				if to_integer(unsigned(I_addr(3 downto 0)))>16 then
					O_data <= "11111111";
				else
					O_data <= ROM_SIG(to_integer(unsigned(I_addr(3 downto 0))));
				end if;
		end if;
	end process;

end Behavioral;

