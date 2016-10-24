----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Nathan A Ruprecht 
-- 
-- Create Date:    11:19:09 10/03/2016 
-- Design Name: 
-- Module Name:    subtract_eight_bit - Behavioral 
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

entity subtract_eight_bit is
    port (
        A       :   in  std_logic_vector(7 downto 0);
        B       :   in  std_logic_vector(7 downto 0);
        Y       :   out std_logic_vector(7 downto 0);
        C_out   :   out std_logic
        );
end subtract_eight_bit;

architecture Behavioral of subtract_eight_bit is
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
    component twos_complement
        port (
            A   :   in  std_logic_vector(7 downto 0);
            Y   :   out std_logic_vector(7 downto 0)
            );
    end component;
--------------------------------------------------------------------------------

    signal  s_Y0 :   std_logic_vector(7 downto 0);
	 signal  s_C_out : std_logic;
	 
begin

    TWOSCOMP_2 : twos_complement
    port map(
        A => B,
        Y => s_Y0
        );

    Adder_3 : adder_eight_bit
    port map (
        A => A,
        B => s_Y0,
        Y => Y,
        C_out => s_C_out
        );

end Behavioral;

