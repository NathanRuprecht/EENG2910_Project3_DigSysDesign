----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Nathan A Ruprecht
-- 
-- Create Date:    15:02:26 09/28/2016 
-- Design Name: 
-- Module Name:    comparator - Behavioral 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
    port (
        A   :   in  std_logic_vector(7 downto 0);
        B   :   in  std_logic_vector(7 downto 0);
        Y   :   out  std_logic_vector(7 downto 0)
        );
end comparator;

architecture Behavioral of comparator is

begin
    process(A, B)
    begin
        if (A > B) then
            Y <= "10000000";    --if A is bigger than B, output 1000 0000
        elsif (A = B) then
            Y <= "00010000";    --if A equals B, output 0001 0000
        elsif (A < B) then
            Y <= "00000001";    --if A is smaller than B, output 0000 0001
        else
            Y <= "00000000";    --others, output 0000 0000
        end if;
    end process;

end Behavioral;


