----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:36:38 10/18/2016 
-- Design Name: 
-- Module Name:    Program_Counter - Behavioral 
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

entity Program_Counter is
	Port ( 
		I_clk 	: in  STD_LOGIC;
		I_nPC 	: in  STD_LOGIC_VECTOR (3 downto 0);
		I_nPCop 	: in  STD_LOGIC_VECTOR (1 downto 0);	-- opcode PC runs
		O_PC 		: out STD_LOGIC_VECTOR (3 downto 0);	-- output current PC
		O_OP		: out	STD_LOGIC_VECTOR (7 downto 0)		-- output the value of RAM
		);
end Program_Counter;

architecture Behavioral of Program_Counter is
-- Component RAM
	component RAM_block
		Port ( 
			I_clk 	: in	STD_LOGIC;
			I_we 		: in  STD_LOGIC;
			I_addr 	: in  STD_LOGIC_VECTOR (3 downto 0);
			I_data 	: in  STD_LOGIC_VECTOR (7 downto 0);
			O_data 	: out	STD_LOGIC_VECTOR (7 downto 0)
			);
	end component;

--an internal signal to act as a register holding the current PC
	signal current_pc	: std_logic_vector(3 downto 0) := "0000";
	
-- PC unit opcodes
	constant PCU_OP_NOP		: std_logic_vector(1 downto 0):= "00";
	constant PCU_OP_INC		: std_logic_vector(1 downto 0):= "01";
	constant PCU_OP_ASSIGN	: std_logic_vector(1 downto 0):= "10";
	constant PCU_OP_RESET	: std_logic_vector(1 downto 0):= "11";
	
--signal
	signal	I_we 		:	STD_LOGIC:= '0';
	signal	I_data 	:	STD_LOGIC_VECTOR (7 downto 0) := x"FF";

begin
--instance of RAM
   RAM_inst : RAM_block
	PORT MAP (
          I_clk => I_clk,
          I_we => I_we,
          I_addr => current_pc,
          I_data => I_data,
          O_data => O_OP
        );

	process (I_clk)
	begin
		if rising_edge(I_clk) then
			case I_nPCop is
				when PCU_OP_NOP =>   -- NOP, keep PC the same/halt
				
				when PCU_OP_INC =>   -- increment
					current_pc <= std_logic_vector(unsigned(current_pc) + 1);
					
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

