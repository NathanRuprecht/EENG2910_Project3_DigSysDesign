--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:09:00 12/05/2016
-- Design Name:   
-- Module Name:   C:/Users/Yang Qi/Desktop/Code/CPU/tb_ALU.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Sel : IN  std_logic_vector(2 downto 0);
         Y : OUT  std_logic_vector(7 downto 0);
         I_we : OUT  std_logic;
         rst : IN  std_logic;
         we_done : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Sel : std_logic_vector(2 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal we_done : std_logic := '0';

 	--Outputs
   signal Y : std_logic_vector(7 downto 0);
   signal I_we : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
	signal clock: std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Sel => Sel,
          Y => Y,
          I_we => I_we,
          rst => rst,
          we_done => we_done
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		rst <= '1';
		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '0';
		A <= "00000000";
		B <= "00000000";
		Sel <= "010";
		we_done <= '0';
      wait for clock_period*5;
		A <= "00000000";
		B <= "00000000";
		Sel <= "010";
		we_done <= '1';
      wait for clock_period*5;
		A <= "00000001";
		B <= "00000001";
		Sel <= "010";
		we_done <= '0';
      wait for clock_period*5;
		A <= "00000001";
		B <= "00000001";
		Sel <= "010";
		we_done <= '1';
      wait for clock_period*5;
		A <= "00000101";
		B <= "00000000";
		Sel <= "000";
		we_done <= '0';
      wait for clock_period*5;
		A <= "00000101";
		B <= "00000000";
		Sel <= "000";
		we_done <= '1';
      wait for clock_period*5;
		A <= "00000010";
		B <= "00000010";
		Sel <= "010";
		we_done <= '0';
      wait for clock_period*5;
		A <= "00000010";
		B <= "00000010";
		Sel <= "010";
		we_done <= '1';
      wait for clock_period*5;
		A <= "00000011";
		B <= "00000011";
		Sel <= "010";
		we_done <= '0';
      wait for clock_period*5;
		A <= "00000011";
		B <= "00000011";
		Sel <= "010";
		we_done <= '1';
      wait for clock_period*5;
		A <= "00001010";
		B <= "00000000";
		Sel <= "001";
		we_done <= '0';
      wait for clock_period*5;
		A <= "00001010";
		B <= "00000000";
		Sel <= "001";
		we_done <= '1';
      wait for clock_period*5;
		A <= "00000001";
		B <= "00000000";
		Sel <= "000";
		we_done <= '0';
      wait for clock_period*5;
		A <= "00000001";
		B <= "00000000";
		Sel <= "000";
		we_done <= '0';
      wait for clock_period*5;
		A <= "00000100";
		B <= "00000001";
		Sel <= "100";
		we_done <= '0';
      wait for clock_period*5;
		A <= "00000100";
		B <= "00000001";
		Sel <= "100";
		we_done <= '1';
      wait for clock_period*5;

      -- insert stimulus here 

      wait;
   end process;

END;
