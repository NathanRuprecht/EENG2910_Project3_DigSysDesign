--------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Nathan A Ruprecht
--
-- Create Date:   10:26:37 09/28/2016
-- Design Name:   
-- Module Name:   E:/2910/DP2/Code/MUX_DEMUX/tb_MUX_DEMUX.vhd
-- Project Name:  MUX_DEMUX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_DEMUX
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
 
ENTITY tb_MUX_DEMUX IS
END tb_MUX_DEMUX;
 
ARCHITECTURE behavior OF tb_MUX_DEMUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_DEMUX
    PORT(
         mux_in : IN  std_logic_vector(7 downto 0);
         sel_mux : IN  std_logic_vector(2 downto 0);
         sel_demux : IN  std_logic_vector(2 downto 0);
         dmux_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mux_in : std_logic_vector(7 downto 0) := (others => '0');
   signal sel_mux : std_logic_vector(2 downto 0) := (others => '0');
   signal sel_demux : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal dmux_out : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_DEMUX PORT MAP (
          mux_in => mux_in,
          sel_mux => sel_mux,
          sel_demux => sel_demux,
          dmux_out => dmux_out
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin
      
		mux_in <= "11010010";
		
		sel_mux <= "000";
		sel_demux <= "000";
      wait for 100 ns;
		
		sel_mux <= "001";
		sel_demux <= "001";
      wait for 100 ns;
		
		sel_mux <= "010";
		sel_demux <= "010";
      wait for 100 ns;
		
		sel_mux <= "011"; 
		sel_demux <= "011";
      wait for 100 ns;
		
		sel_mux <= "100";
		sel_demux <= "100";
      wait for 100 ns;
		
		sel_mux <= "101";
		sel_demux <= "101";
      wait for 100 ns;
		
		sel_mux <= "110";
		sel_demux <= "110";
      wait for 100 ns;
		
		sel_mux <= "111";
		sel_demux <= "111";
      wait for 100 ns;
		sel_mux <= "000";
		sel_demux <= "000";
		
      wait;
   end process;

END;
