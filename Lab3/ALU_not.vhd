----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:13 10/03/2016 
-- Design Name: 
-- Module Name:    ALU_not - Behavioral 
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

entity ALU_not is
    port (
        A   :   in  std_logic_vector(7 downto 0);
        B   :   in  std_logic_vector(7 downto 0);
        Y   :   out std_logic_vector(7 downto 0)
        );
end ALU_not;

architecture Behavioral of ALU_not is

begin

	 Y(0) <= A(0) and B(0);
    Y(1) <= A(1) and B(1);
    Y(2) <= A(2) and B(2);
    Y(3) <= A(3) and B(3);
	 Y(4) <= A(4) and B(4);
    Y(5) <= A(5) and B(5);
    Y(6) <= A(6) and B(6);
    Y(7) <= A(7) and B(7);

end Behavioral;

