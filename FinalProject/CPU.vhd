----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Nathan Ruprecht
--						Yang Qi
--						Ayodele Ojo
--						Maher Alsanwi
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CPU is
		PORT (
		clk 	: in	STD_LOGIC;
      rst : in  STD_LOGIC;
		switch0: in std_logic;
		switch1: in std_logic;
		Led7:out std_logic;
		Led6:out std_logic;
		Led5:out std_logic;
		Led4:out std_logic;
		Led3:out std_logic;
		Led2:out std_logic;
		Led1:out std_logic;
		Led0:out std_logic;
		topselDispA: out  STD_LOGIC;
		topselDispB: out  STD_LOGIC;
		topselDispC: out STD_LOGIC;
		topselDispD: out STD_LOGIC;
      topsegA : out  STD_LOGIC;
      topsegB : out  STD_LOGIC;
      topsegC : out  STD_LOGIC;
      topsegD : out  STD_LOGIC;
      topsegE : out  STD_LOGIC;
      topsegF : out  STD_LOGIC;
      topsegG : out  STD_LOGIC		);
end CPU;

architecture Behavioral of CPU is
--------------------------------------------------------------------------------
    component ALU
    port ( 
			  A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0);
			  I_we : out std_logic;
			  rst: in std_logic;
			  we_done: in std_logic
		);
    end component;
--------------------------------------------------------------------------------
    component Register_file
    port (
		 clk 	: in	STD_LOGIC;
       I_dataD : in  STD_LOGIC_VECTOR (7 downto 0);
       O_dataA : out  STD_LOGIC_VECTOR (7 downto 0);
       O_dataB : out  STD_LOGIC_VECTOR (7 downto 0);
		 O_dataC : out std_logic_vector (7 downto 0);
       I_selA : in  STD_LOGIC_VECTOR (1 downto 0);
       I_selB : in  STD_LOGIC_VECTOR (1 downto 0);
		 I_selC : in std_Logic_vector (1 downto 0);
       I_we : in  STD_LOGIC;
		 we_done : out std_logic
        );
    end component;
--------------------------------------------------------------------------------
    component PC
    port (
		clk 	: in  STD_LOGIC;
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
	signal sel_C : std_logic_vector (1 downto 0);
	signal sig_sel: std_logic_vector(2 downto 0);
	signal sig_sel0: std_logic_vector(2 downto 0);
	signal data_A : std_logic_vector(7 downto 0);
	signal data_A0 : std_logic_vector(7 downto 0);
	signal data_A1 : std_logic_vector(7 downto 0);
	signal data_B : std_logic_vector(7 downto 0);
	signal data_B1 : std_logic_vector(7 downto 0);
	signal data_D : std_logic_vector(7 downto 0);
	signal data_C : std_logic_vector(7 downto 0);
	signal out_B : std_logic_vector(7 downto 0);
	signal I_we : STD_LOGIC;
	signal I_nPCop: std_logic_vector(1 downto 0);
	signal I_nPC: std_logic_vector(3 downto 0);
	signal I_nPCop_Reg: std_logic_vector(1 downto 0);
	signal I_nPC_Reg: std_logic_vector(3 downto 0);
	signal O_OP :  std_logic_vector(7 downto 0);
	signal O_PC : std_logic_vector(3 downto 0);
	signal we_done: std_logic;
	signal led: std_logic_vector(3 downto 0);
	
	begin

	RF_inst : Register_file
	port map (
	    clk => clk,
       I_dataD => data_D,
       O_dataA => data_A,
       O_dataB => data_B,
		 O_dataC => data_C,
       I_selA => sel_A,
       I_selB => sel_B,
		 I_selC => sel_C,
       I_we => I_we,
		 we_done => we_done
		);

	data_A1 <= data_A0;
	data_B1 <= data_B;
	data_D <= out_B;
	sel_A <= sel_A0;
	sel_B <= sel_B0;
	sig_sel <= sig_sel0;
	
	
	ALU_inst : ALU
	port map (
		A => data_A1,
		B => data_B1,
		Sel => sig_sel,
		Y => out_B,
		I_we => I_we,
		rst => rst,
		we_done => we_done
		);
		
	PC_inst : PC
	port map (
		clk => clk,
		I_nPC => I_nPC,
		I_nPCop => I_nPCop,
		O_PC => O_PC,
		O_OP => O_OP
		);
		
		sel_C(0) <= switch0;
		sel_C(1) <= switch1;
		Led7 <= data_C(7);
		Led6 <= data_C(6);
		Led5 <= data_C(5);
		Led4 <= data_C(4);
		Led3 <= data_C(3);
		Led2 <= data_C(2);
		Led1 <= data_C(1);
		Led0 <= data_C(0);

		topselDispA <= '0';
		topselDispB <= '1';
		topselDispC <= '1';
		topselDispD <= '1';
		
		
	process(led)
		variable decode_data : std_logic_vector(6 downto 0);
	begin
	case led is 
		when "0000"=> decode_data := "1111110";  -- '0'
		when "0001"=> decode_data :="0110000";  -- '1'
		when "0010"=> decode_data :="1101101";  -- '2'
		when "0011"=> decode_data :="1111001";  -- '3'
		when "0100"=> decode_data :="0110011";  -- '4' 
		when "0101"=> decode_data :="1011011";  -- '5'
		when "0110"=> decode_data :="1011111";  -- '6'
		when "0111"=> decode_data :="1110000";  -- '7'
		when "1000"=> decode_data :="1111111";  -- '8'
		when "1001"=> decode_data :="1111011";  -- '9'
		when others=> decode_data :="0111110"; -- Error
	end case;
	
	topsegA <= not decode_data(6);
	topsegB <= not decode_data(5);
	topsegC <= not decode_data(4);
	topsegD <= not decode_data(3);
	topsegE <= not decode_data(2);
	topsegF <= not decode_data(1);
	topsegG <= not decode_data(0);
	
	end process;

	
state_reg : process (rst, clk)
	begin
		if (rst = '1') then
			current_state <= state0;
			I_nPCop <= "11";
			I_nPC <= "0000";	
		elsif (clk'event and clk = '1') then

			if (we_done = '1') then
				current_state <= next_state;
			else
				current_state <= current_state;
			end if;
			I_nPCop <= I_nPCop_Reg;
			I_nPC <= I_nPC_Reg;
			sig_sel0 <= O_OP(7 downto 5);
			sel_A0 <= O_OP(3 downto 2);
			sel_B0 <= O_OP(1 downto 0);
			
		end if;


		
	end process;
	


	state_trans : process ( rst, current_state, data_A,  I_nPCop, I_nPC, O_PC, out_B)
	begin

		I_nPCop_Reg <= I_nPCOP;
		I_nPC_Reg <= I_nPC;
		
		case current_state is       
			when state0 =>
				I_nPCop_Reg <= "00";
				data_A0 <= data_A;
					next_state <= state1;
				
			--instr 0
			when state1 =>
				if( O_PC = "0000" ) then
					data_A0 <= data_A;
					next_state <= state2;
					I_nPCop_Reg <= "10";
					I_nPC_Reg <= "0001";
				else
						next_state <= current_state;
				end if;
				
			--instr 1
			when state2 =>
				if( O_PC = "0001" ) then
					data_A0 <= data_A;
						next_state <= state3;
						I_nPCop_Reg <= "10";
						I_nPC_Reg <= "0010";
					else 
						next_state <= current_state;
				end if;
				
			--instr 2
			when state3 =>
				if(O_PC = "0010" ) then
					data_A0 <= data_A;
						next_state <= state4;
						I_nPCop_Reg <= "10";
						I_nPC_Reg <= "0011";
					else
					   next_state <= current_state;
				end if;
				
			--instr 3
			when state4 =>
				if( O_PC =  "0011" ) then
					data_A0 <= "00000" & O_OP(4 downto 2);
					next_state <= state5;
					I_nPCop_Reg <= "10";
					I_nPC_Reg <= "0100";
				else
						next_state <= current_state;
				end if;

			--instr 4
			when state5 =>
				if( O_PC =  "0100" ) then
					data_A0 <= data_A;
						next_state <= state6;
						I_nPCop_Reg <= "10";
						I_nPC_Reg <= "0101";
					else
						next_state <= current_state;
				end if;

			--instr 5
			when state6 =>
				if( O_PC =  "0101" ) then
					data_A0 <= data_A;
						next_state <= state7;
						I_nPCop_Reg <= "10";
						I_nPC_Reg <= "0110";
					else
						next_state <= current_state;
				end if;
				
			--instr 6
			when state7 =>
				if( O_PC =  "0110" ) then
					data_A0 <= data_A;
						next_state <= state8;
						I_nPCop_Reg <= "10";
						I_nPC_Reg <= "0111";
					else
						next_state <= current_state;
				end if;
				
			--instr 7
			when state8 =>
				if( O_PC =  "0111" ) then
					data_A0 <= data_A;
						next_state <= state9;
						I_nPCop_Reg <= "10";
						I_nPC_Reg <= "1000";
					else
						next_state <= current_state;
				end if;
				
			--instr 8
			when state9 =>
				if( O_PC =  "1000" ) then
					data_A0 <= "00000" & O_OP(4 downto 2);
						next_state <= state10;
						I_nPCop_Reg <= "10";
						I_nPC_Reg <= "1001";
					else
						next_state <= current_state;
				end if;

			--instr 9
			when state10 =>
				if( O_PC =  "1001" ) then
						data_A0 <= data_A;
					if( out_B = "00010000" ) then --jmp to loop
						next_state <= state1;
						I_nPCop_Reg <= "10";
						I_nPC_Reg <= "0000";

					else --jmp to begin

						next_state <= state7;

						I_nPCop_Reg <= "10";
						I_nPC_Reg <= "0110";

					end if;

				end if;

            when others =>
                next_state <= current_state;
            end case;
	end process;
	
	out_proc : process (current_state)
	begin
	   case current_state is 
	       when state0 =>
	           led <= "0000";
	       when state1 =>
	           led <= "0001";
	       when state2 =>
	           led <= "0010";
	       when state3 =>
	           led <= "0011";
			when state4 =>
	           led <= "0100";
	       when state5 =>
	           led <= "0101";
	       when state6 =>
	           led <= "0110";
	       when state7 =>
	           led <= "0111";
	       when state8 =>
	           led <= "1000";
	       when state9 =>
	           led <= "1001";
	       when state10 =>
	           led <= "1010";
	       when others =>
	           led <= "0000";
	   end case;
	end process;
	

end Behavioral;