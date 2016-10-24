----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Nathan A Ruprecht
-- 
-- Create Date:    15:50:18 09/28/2016 
-- Design Name: 
-- Module Name:    shifter - Behavioral 
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

entity shifter is
    port (
        A   :   in  std_logic_vector(7 downto 0);
        B   :   in  std_logic_vector(7 downto 0);
        Y   :   out std_logic_vector(7 downto 0)
        );
end shifter;

architecture Behavioral of shifter is

begin
    process(B)
    begin
        if ( B(0) = '1' ) then
            Y <= A(6 downto 0) & '0';
        elsif ( B(1) = '1' ) then
            Y <= A(5 downto 0) & "00";
        elsif ( B(2) = '1') then
            Y <= A(4 downto 0) & "000";
        elsif ( B(3) = '1' ) then
            Y <= A(3 downto 0) & "0000";
        elsif ( B(4) = '1') then
            Y <= A(2 downto 0) & "00000";
			elsif ( B(5) = '1' ) then
            Y <= A(1 downto 0) & "000000";
        elsif ( B(6) = '1') then
            Y <= A(0) & "0000000";
        else
            Y <= A;
        end if;
            
    end process;
    
end Behavioral;


