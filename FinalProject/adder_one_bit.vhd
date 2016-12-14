----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:16 11/28/2016 
-- Design Name: 
-- Module Name:    adder_one_bit - Behavioral 
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

entity adder_one_bit is
    Port ( 
        A       :   in  std_logic;
        B       :   in  std_logic;
        C_in    :   in  std_logic;
        S       :   out std_logic;
        C_out   :   out std_logic
        );
end adder_one_bit;

architecture Behavioral of adder_one_bit is
    
begin
    S <= A xor B xor C_in;
    C_out <= (A and B) or (B and C_in) or (A and C_in);

end Behavioral;