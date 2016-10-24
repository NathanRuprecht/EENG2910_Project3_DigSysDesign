----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Nathan A Ruprecht
-- 
-- Create Date:    10:54:13 10/03/2016 
-- Design Name: 
-- Module Name:    ALU_nand - Behavioral 
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

entity ALU_nand is
    port (
        A   :   in  std_logic_vector(7 downto 0);
        B   :   in  std_logic_vector(7 downto 0);
        Y   :   out std_logic_vector(7 downto 0)
        );
end ALU_nand;

architecture Behavioral of ALU_nand is

begin

	 Y <= not(A and B);

end Behavioral;

