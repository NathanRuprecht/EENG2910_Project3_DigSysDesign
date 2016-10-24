--------------------------------------------------------------------------------
-- Company: UNT
-- Engineer: Yunlong Qi
--
-- Create Date:   13:43:45 09/02/2016
-- Design Name:   
-- Module Name:   D:/Xilinx_Program_Files/proj_5/tb_full_adder.vhd
-- Project Name:  proj_5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder
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
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity tb_full_adder is

end tb_full_adder;

architecture tb of tb_full_adder is

	component full_adder is 
		port (a: in std_logic_vector(7 downto 0);
				b: in std_logic_vector(7 downto 0);
				c_in		: in std_logic;
				sum		: out std_logic_vector(7 downto 0);
				c_out		: out std_logic
				);
	end component;
	
	signal a			: std_logic;
	signal b 		: std_logic;
	signal c_in		: std_logic;
	signal sum		: std_logic;
	signal c_out	: std_logic;

begin

	mapping: full_adder port map (a, b, c_in, sum, c_out);
	
	process
		begin
			a <= '01101001';
			b <= '01111100';
			c_in <= '0';
			wait for 10ns;
			
			a <= '11110010';
			b <= '00011010';
			c_in <= '0';
			wait for 10ns;
			
			a <= '00001111';
			b <= '11110000';
			c_in <= '0';
			wait for 10ns;
			
			a <= '00101010';
			b <= '00101010';
			c_in <= '0';
			wait for 10ns;
			
			a <= '11100111';
			b <= '10001110';
			c_in <= '0';
			wait for 10ns;
			
			a <= '10011100';
			b <= '00011111';
			c_in <= '1';
			wait for 10ns;
			
	end process;
			
end tb;
