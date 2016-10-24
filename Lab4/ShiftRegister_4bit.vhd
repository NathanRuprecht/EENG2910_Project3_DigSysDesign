----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Nathan A Ruprecht
-- 
-- Create Date:    15:35:08 10/05/2016 
-- Design Name: 
-- Module Name:    ShiftRegister_4bit - Behavioral 
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

entity ShiftRegister_4bit is
	port (
			Din : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			RSB : in std_logic;
			LSB : in std_logic;
			Sel : in std_logic_vector(2 downto 0);
			Qout : out std_logic_vector(3 downto 0)
			);
end ShiftRegister_4bit;

architecture Behavioral of ShiftRegister_4bit is
----------------------------------------------------------------------------------
component SIPO is
	port (
			Din : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			Qout : out std_logic_vector(3 downto 0)
			);
end component;
----------------------------------------------------------------------------------
component PIPO is
	port (
			Din : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			Qout : out std_logic_vector(3 downto 0)
			);
end component;
----------------------------------------------------------------------------------
component SISO is
	port (
			Din : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			Qout : out std_logic_vector(3 downto 0)
			);
end component;
----------------------------------------------------------------------------------
component PISO is
	port (
			Din : in std_logic_vector(3 downto 0);
			CLK : in std_logic;
			RST : in std_logic;
			Qout : out std_logic_vector(3 downto 0)
			);
end component;
----------------------------------------------------------------------------------

signal q0, q1, q2, q3 : std_logic;
signal s_Y0, s_Y1, s_Y2, q_YQ :	std_logic_vector(3 downto 0);
signal s_sig	:	std_logic_vector(2 downto 0);

begin

s_sig <= Sel;

	shift_1: SIPO --code given and works with tb
		port map (
			Din => Din,
			CLK => CLK,
			RST => RST,
			Qout => s_Y0
			);

	shift_2: PIPO --works with tb
		port map (
			Din => Din,
			CLK => CLK,
			RST => RST,
			Qout => s_Y1
			);

	shift_3: SISO -- works with tb
		port map (
			Din => Din,
			CLK => CLK,
			RST => RST,
			Qout => s_Y2
			);	
			
    process(s_sig, Din, CLK, RST, LSB,RSB,q_YQ)
    begin
        case s_sig is
            when "000" => q_YQ <= s_Y0;     --SIPO
            when "001" => q_YQ <= s_Y1;     --PIPO
            when "010" => q_YQ <= s_Y2;     --SISO
            when "011" => q_YQ <= s_Y1;     --PISO
				when "100" => q_YQ <= q_YQ(2 downto 0) & LSB;     --LeftShift
            when "101" => q_YQ <= RSB & q_YQ(3 downto 1);     --RightShift
            when others => q_YQ <= (others => '0');
        end case;            
    end process;
	 Qout<=q_YQ;

end Behavioral;

