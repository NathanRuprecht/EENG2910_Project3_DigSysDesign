----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:06:00 12/02/2016 
-- Design Name: 
-- Module Name:    Segment_LED - Behavioral 
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

entity Segment_LED is
    Port ( switch0 : in  STD_LOGIC;
           switch1 : in  STD_LOGIC;
           switch2 : in  STD_LOGIC;
           switch3 : in  STD_LOGIC;
			  topselDispA: out  STD_LOGIC;
			  topselDispB: out  STD_LOGIC;
			  topselDispC: out STD_LOGIC;
			  topselDispD: out STD_LOGIC;
           topsegA : out  STD_LOGIC;
           topsegB : out  STD_LOGIC;
           topsegC : out  STD_LOGIC;
           topsegD : out  STD_LOGIC;
           topsegE : out  STD_LOGIC;
           topsegF : out  STD_LOGIC;
           topsegG : out  STD_LOGIC);
end Segment_LED;

architecture Behavioral of Segment_LED is

component test2
port(
		digit : in std_logic_vector (3 downto 0);
		segment_A : out std_logic;
		segment_B : out std_logic;
		segment_C : out std_logic;
		segment_E : out std_logic;
		segment_D : out std_logic;
		segment_F : out std_logic;
		segment_G : out std_logic
		);
	end component;
	
signal temperary_data : std_logic_vector(3 downto 0);

begin
temperary_data <= switch0 & switch1 & switch2 & switch3;
topselDispA <= '0';
topselDispB <= '1';
topselDispC <= '1';
topselDispD <= '1';
uut: test2 PORT MAP(
							digit => temperary_data,
							segment_A => topsegA,
							segment_B => topsegB,
							segment_C => topsegC,
							segment_D => topsegD,
							segment_E => topsegE,
							segment_F => topsegF,
							segment_G => topsegG
					);
					
end Behavioral;

