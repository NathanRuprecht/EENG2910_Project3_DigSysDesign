----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		 Nathan A Ruprecht
-- 
-- Create Date:    15:38:53 09/07/2016 
-- Design Name: 
-- Module Name:    adder_8bit - Behavioral 
-- Project Name:   Design Project 1
-- Target Devices: 
-- Tool versions: 
-- Description:    Design, implement, and test an 8-bit adder
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_8bit is

	port (a: in std_logic_vector(7 downto 0);
			b: in std_logic_vector(7 downto 0);
			s: out std_logic_vector(7 downto 0);
			co: out std_logic
			);
			
end adder_8bit;

architecture Behavioral of adder_8bit is

component full_adder is
    Port ( a, b, c_in : in  STD_LOGIC;
           sum, c_out : out  STD_LOGIC);
end component;

signal ci : std_logic_vector(7 downto 0);

begin

ci(0) <= '0';

full_adder0:full_adder
port map( a=>a(0), b=>b(0), c_in=>ci(0), sum=>s(0), c_out=> ci(1) );

full_adder1:full_adder
port map( a=>a(1), b=>b(1), c_in=>ci(1), sum=>s(1), c_out=> ci(2) );

full_adder2:full_adder
port map( a=>a(2), b=>b(2), c_in=>ci(2), sum=>s(2), c_out=> ci(3) );

full_adder3:full_adder
port map( a=>a(3), b=>b(3), c_in=>ci(3), sum=>s(3), c_out=> ci(4) );

full_adder4:full_adder
port map( a=>a(4), b=>b(4), c_in=>ci(4), sum=>s(4), c_out=> ci(5) );

full_adder5:full_adder
port map( a=>a(5), b=>b(5), c_in=>ci(5), sum=>s(5), c_out=> ci(6) );

full_adder6:full_adder
port map( a=>a(6), b=>b(6), c_in=>ci(6), sum=>s(6), c_out=> ci(7) );

full_adder7:full_adder
port map( a=>a(7), b=>b(7), c_in=>ci(7), sum=>s(7), c_out=> co );


end Behavioral;

