----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		
-- 
-- Create Date:    13:36:13 09/02/2016 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder is

	port (a: in std_logic;
			b: in std_logic;
			c_in: in std_logic;
			sum: out std_logic;
			c_out: out std_logic
			);
			
end full_adder;

architecture Behavioral of full_adder is

begin

	sum <= a xor b xor c_in;
	c_out <= (a and b) or (b and c_in) or (a and c_in);

end Behavioral;

