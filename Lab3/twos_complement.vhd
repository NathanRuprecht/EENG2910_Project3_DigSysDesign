----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Nathan A Ruprecht 
-- 
-- Create Date:    10:58:12 10/03/2016 
-- Design Name: 
-- Module Name:    twos_complement - Behavioral 
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

entity twos_complement is
        port (
            A   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
end twos_complement;

architecture Behavioral of twos_complement is
--------------------------------------------------------------------------------
    component adder_eight_bit
    port (
        A       :   in  std_logic_vector(7 downto 0);
        B       :   in  std_logic_vector(7 downto 0);
        Y       :   out std_logic_vector(7 downto 0);
        C_out   :   out std_logic
        );
    end component;
--------------------------------------------------------------------------------

	signal not_A, test	:	std_logic_vector(7 downto 0);
	signal  extra : std_logic;
	 
begin

	not_A <= (not A);
		 
	Adder_4 : adder_eight_bit
   port map (
       A => not_A,
       B => "00000001",
       Y => Y,
       C_out => extra
       );


end Behavioral;

