--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:52:07 12/05/2016
-- Design Name:   
-- Module Name:   C:/Users/Yang Qi/Desktop/Code/CPU/tb_addder.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: add_const
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
 
ENTITY tb_addder IS
END tb_addder;
 
ARCHITECTURE behavior OF tb_addder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT add_const
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Y : OUT  std_logic_vector(7 downto 0);
         C_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(7 downto 0);
   signal C_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: add_const PORT MAP (
          A => A,
          B => B,
          Y => Y,
          C_out => C_out
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
				A <= "00000101";
		B <= "00000000";
      wait for 100 ns;	
		A <= "00000101";
		B <= "00000011";
		wait for 100 ns;
      wait;
   end process;

END;
