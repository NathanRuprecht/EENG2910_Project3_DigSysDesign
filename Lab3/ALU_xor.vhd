----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Nathan A Ruprecht
-- 
-- Create Date:    15:02:12 09/28/2016 
-- Design Name: 
-- Module Name:    ALU_xor - Behavioral 
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

entity ALU_xor is
    port (
        A   :   in  std_logic_vector(7 downto 0);
        B   :   in  std_logic_vector(7 downto 0);
        Y   :   out std_logic_vector(7 downto 0)
        );
end ALU_xor;

architecture Behavioral of ALU_xor is

begin

    Y(0) <= A(0) xor B(0);
    Y(1) <= A(1) xor B(1);
    Y(2) <= A(2) xor B(2);
    Y(3) <= A(3) xor B(3);
	 Y(4) <= A(4) xor B(4);
    Y(5) <= A(5) xor B(5);
    Y(6) <= A(6) xor B(6);
    Y(7) <= A(7) xor B(7);

end Behavioral;


