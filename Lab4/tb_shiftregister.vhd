--------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Nathan A Ruprecht
--
-- Create Date:   11:55:53 10/19/2016
-- Design Name:   
-- Module Name:   E:/2910/DP4/Code/Shift_Register/tb_shiftregister.vhd
-- Project Name:  Shift_Register
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ShiftRegister_4bit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_shiftregister IS
END tb_shiftregister;
 
ARCHITECTURE behavior OF tb_shiftregister IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ShiftRegister_4bit
    PORT(
         Din : IN  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         RSB : IN  std_logic;
         LSB : IN  std_logic;
         Sel : IN  std_logic_vector(2 downto 0);
         Qout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Din : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal RSB : std_logic := '0';
   signal LSB : std_logic := '0';
   signal Sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Qout : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ShiftRegister_4bit PORT MAP (
          Din => Din,
          CLK => CLK,
          RST => RST,
          RSB => RSB,
          LSB => LSB,
          Sel => Sel,
          Qout => Qout
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		Din <= "0101";
		Sel <= "100";
		LSB <= '0';
		wait for 2 * clk_period;
		
		LSB <= '1';
		wait for 2 * clk_period;
		
		RST <= '1';
		wait for 2 * clk_period;
		
		RST <= '0';
		Din <= "0011";
		Sel <= "101";
		RSB <= '0';
		wait for 2 * clk_period;
		
		RSB <= '1';
		wait for 2 * clk_period;
		
		RST <= '0';
		Din <= "0011";
		Sel <= "000";
		wait for 2 * clk_period;

		Din <= "0011";
		Sel <= "001";
		wait for 2 * clk_period;

		Din <= "0011";
		Sel <= "010";
		wait for 2 * clk_period;

		Din <= "0011";
		Sel <= "011";
		wait for 2 * clk_period;		
      wait;
   end process;

END;
