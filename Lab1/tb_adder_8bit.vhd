--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:33:36 09/07/2016
-- Design Name:   
-- Module Name:   C:/Users/nar0117/Desktop/Test/proj0/tb_adder_8bit.vhd
-- Project Name:  proj0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder_8bit
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
 
ENTITY tb_adder_8bit IS
END tb_adder_8bit;
 
ARCHITECTURE behavior OF tb_adder_8bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder_8bit
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         s : OUT  std_logic_vector(7 downto 0);
         co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(7 downto 0);
   signal co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder_8bit PORT MAP (
          a => a,
          b => b,
          s => s,
          co => co
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
			a <= "01101001";
			b <= "01111100";
			wait for 10ns;
			
			a <= "11110010";
			b <= "00011010";
			wait for 10ns;
			
			a <= "00001111";
			b <= "11110000";
			wait for 10ns;
			
			a <= "00101010";
			b <= "00101010";
			wait for 10ns;
			
			a <= "11100111";
			b <= "10001110";
			wait for 10ns;
			
			a <= "10011100";
			b <= "00011111";
      -- insert stimulus here 

      wait;
   end process;

END;
