----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Nathan Ruprecht
--						Yang Qi
--						Ayodele Ojo
--						Maher Alsanwi
-- 
-- Create Date:    09:36:38 10/18/2016 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
	Port ( 
		clk 	: in  STD_LOGIC;
		I_nPC 	: in  STD_LOGIC_VECTOR (3 downto 0);
		I_nPCop 	: in  STD_LOGIC_VECTOR (1 downto 0);	-- opcode PC runs
		O_PC 		: out STD_LOGIC_VECTOR (3 downto 0);	-- output current PC
		O_OP		: out	STD_LOGIC_VECTOR (7 downto 0)		-- output the value of ROM
		);
end PC;

architecture Behavioral of PC is
--------------------------------------------------------------------------------
	component ROM
		Port ( 
			clk 	: in	STD_LOGIC;
			I_addr 	: in  STD_LOGIC_VECTOR (3 downto 0);
			O_data 	: out	STD_LOGIC_VECTOR (7 downto 0)
			);
	end component;
--------------------------------------------------------------------------------

--an internal signal to act as a register holding the current PC
	signal current_pc	: std_logic_vector(3 downto 0) := "0000";
	
-- PC unit opcodes
	constant PCU_OP_NOP		: std_logic_vector(1 downto 0):= "00";
	constant PCU_OP_INC		: std_logic_vector(1 downto 0):= "01";
	constant PCU_OP_ASSIGN	: std_logic_vector(1 downto 0):= "10";
	constant PCU_OP_RESET	: std_logic_vector(1 downto 0):= "11";
	
--signal

begin
--instance of ROM
   ROM_inst : ROM
	PORT MAP (
          clk => clk,
          I_addr => current_pc,
          O_data => O_OP
        );

	process (clk)
	begin
		if rising_edge(clk) then
			case I_nPCop is
				when PCU_OP_NOP =>   -- NOP, keep PC the same/halt
				
				when PCU_OP_INC =>   -- increment
					if (unsigned(current_pc) < 10) then
					current_pc <= std_logic_vector(unsigned(current_pc) + 1);
					else
					current_pc <= "0000";
					end if;
					
				when PCU_OP_ASSIGN =>    -- set from external input
					current_pc <= I_nPC;
					
				when PCU_OP_RESET =>     -- Reset
					current_pc <= "0000";
					
				when others =>
			end case;
		end if;
	end process;

	O_PC <= current_pc;

end Behavioral;

