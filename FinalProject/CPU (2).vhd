----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:24 11/09/2016 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is
		PORT (
		I_clk 	: in	STD_LOGIC;
      rst : in  STD_LOGIC		);
end CPU;

architecture Behavioral of CPU is
--------------------------------------------------------------------------------
    component ALU
    port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0);
			  I_we : out std_logic;
			  we_done: in std_logic
		);
    end component;
--------------------------------------------------------------------------------
    component Register_file
    port (
		 I_clk 	: in	STD_LOGIC;
       I_dataD : in  STD_LOGIC_VECTOR (7 downto 0);
       O_dataA : out  STD_LOGIC_VECTOR (7 downto 0);
       O_dataB : out  STD_LOGIC_VECTOR (7 downto 0);
       I_selA : in  STD_LOGIC_VECTOR (1 downto 0);
       I_selB : in  STD_LOGIC_VECTOR (1 downto 0);
       I_we : in  STD_LOGIC;
		 we_done : out std_logic
        );
    end component;
--------------------------------------------------------------------------------
    component PC
    port (
		I_clk 	: in  STD_LOGIC;
		I_nPC 	: in  STD_LOGIC_VECTOR (3 downto 0);
		I_nPCop 	: in  STD_LOGIC_VECTOR (1 downto 0);	-- opcode PC runs
		O_PC 		: out STD_LOGIC_VECTOR (3 downto 0);	-- output current PC
		O_OP		: out	STD_LOGIC_VECTOR (7 downto 0)		-- output the value of RAM
        );
    end component;
--------------------------------------------------------------------------------

--define states - number of instructions x2 for no op, +1 for intial
	type STATE_TYPE is (
		state0,
		state1,
		state2,
		state3,
		state4,
		state5,
		state6,
		state7,
		state8,
		state9,
		state10
	);
	
--define current and next state signal
	signal	current_state 	: 	STATE_TYPE;
	signal	next_state		:	STATE_TYPE;
	signal sel_A :	std_logic_vector(1 downto 0);
	signal sel_A0 :	std_logic_vector(1 downto 0);
	signal sel_B :	std_logic_vector(1 downto 0);
	signal sel_B0 :	std_logic_vector(1 downto 0);
	signal sig_sel: std_logic_vector(2 downto 0);
	signal sig_sel0: std_logic_vector(2 downto 0);
	signal data_A : std_logic_vector(7 downto 0);
	signal data_A0 : std_logic_vector(7 downto 0);
	signal data_A1 : std_logic_vector(7 downto 0);
	signal data_B : std_logic_vector(7 downto 0);
	signal data_B1 : std_logic_vector(7 downto 0);
	signal data_D : std_logic_vector(7 downto 0);
	signal out_B : std_logic_vector(7 downto 0);
	signal I_we : STD_LOGIC;
	signal I_nPCop: std_logic_vector(1 downto 0);
	signal I_nPC: std_logic_vector(3 downto 0);
	signal I_nPCop_Reg: std_logic_vector(1 downto 0);
	signal I_nPC_Reg: std_logic_vector(3 downto 0);
	signal O_OP :  std_logic_vector(7 downto 0);
	signal O_PC : std_logic_vector(3 downto 0);
	signal en : std_logic;
	signal we_done: std_logic;
begin

	RF_inst : Register_file
	port map (
	    I_clk => I_clk,
       I_dataD => data_D,
       O_dataA => data_A,
       O_dataB => data_B,
       I_selA => sel_A,
       I_selB => sel_B,
       I_we => I_we,
		 we_done => we_done
		);
		
	data_A <= data_A0;
	data_A1 <= data_A0;
	data_B1 <= data_B;
	data_D <= out_B;
	sig_sel <= sig_sel0;
	sel_A <= sel_A0;
	sel_B <= sel_B0;
	
	ALU_inst : ALU
	port map (
		A => data_A1,
		B => data_B1,
		Sel => sig_sel,
		Y => out_B,
		I_we => I_we,
		we_done => we_done
		);
		
	PC_inst : PC
	port map (
		I_clk => I_clk,
		I_nPC => I_nPC,
		I_nPCop => I_nPCop,
		O_PC => O_PC,
		O_OP => O_OP
		);
		

	
	state_reg : process (rst, I_clk)
	begin
		if (rst = '1') then
			current_state <= state0;
			I_nPCop <= "11";
			I_nPC <= "0000";					
		elsif (I_clk'event and I_clk = '1') then
			current_state <= next_state;
			I_nPCop <= I_nPCop_Reg;
			I_nPC <= I_nPC_Reg;
		end if;
		sig_sel0 <= O_OP(7 downto 5);
		sel_A0 <= O_OP(3 downto 2);
		sel_B0 <= O_OP(1 downto 0);
	end process;
	
	state_trans : process (rst, current_state)
	begin
	
		if (en = '1') then
		data_A0 <= "00000" & O_OP(4 downto 2);
		else
      data_A0 <= data_A;
      end if;
		
		I_nPCop_Reg <= I_nPCOP;
		I_nPC_Reg <= I_nPC;
		
		case current_state is       
			when state0 =>
			I_nPCop_Reg <= "00";
			next_state <= state1;
				
			--instr 0
			when state1 =>
				if( O_PC = "0000" ) then
					I_nPCop_Reg <= "01";
					next_state <= state2;
				else
					next_state <= current_state;
				end if;
				
			--instr 1
			when state2 =>
				if( O_PC = "0001" ) then
					I_nPCop_Reg <= "01";
					next_state <= state3;
				else
					next_state <= current_state;
				end if;
				
			--instr 2
			when state3 =>
				if(O_PC = "0010" ) then
					I_nPCop_Reg <= "01";
					en <= '1';
					next_state <= state4;
				else
					next_state <= current_state;
				end if;
				
			--instr 3
			when state4 =>
				if( O_PC =  "0011" ) then
					I_nPCop_Reg <= "01";
					next_state <= state5;
				else
					next_state <= current_state;
				end if;

			--instr 4
			when state5 =>
				if( O_PC =  "0100" ) then
					I_nPCop_Reg <= "01";
					next_state <= state6;
				else
					next_state <= current_state;
				end if;

			--instr 5
			when state6 =>
				if( O_PC =  "0101" ) then
					I_nPCop_Reg <= "01";
					next_state <= state7;
				else
					next_state <= current_state;
				end if;
				
			--instr 6
			when state7 =>
				if( O_PC =  "0110" ) then
					I_nPCop_Reg <= "01";
					next_state <= state8;
				else
					next_state <= current_state;
				end if;
				
			--instr 7
			when state8 =>
				if( O_PC =  "0111" ) then
					I_nPCop_Reg <= "01";
					en <= '1';
					next_state <= state9;
				else
					next_state <= current_state;
				end if;
				
			--instr 8
			when state9 =>
				if( O_PC =  "1000" ) then
					I_nPCop_Reg <= "01";
					next_state <= state10;
				else
					next_state <= current_state;
				end if;

			--instr 9
			when state10 =>
				if( O_PC =  "1001" ) then
					I_nPCop_Reg <= "10";
					if( out_B = "00000001" ) then --jmp to loop
						I_nPC_Reg <= "0110"; --instr 6
						next_state <= state7;
					else --jmp to begin
						I_nPC_Reg <= "0000"; --instr 0
						next_state <= state1;
					end if;
				else
					next_state <= current_state;
				end if;

            when others =>
                next_state <= current_state;
            end case;
	end process;
end Behavioral;