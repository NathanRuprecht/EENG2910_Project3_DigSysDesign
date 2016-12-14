----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Nathan Ruprecht
--						Yang Qi
--						Ayodele Ojo
--						Maher Alsanwi
-- 
-- Create Date:    15:18:01 11/09/2016 
-- Design Name: 
-- Module Name:    Register_file - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity Register_file is
	Port ( 
		clk 	: in	STD_LOGIC;
       I_dataD : in  STD_LOGIC_VECTOR (7 downto 0);
       O_dataA : out  STD_LOGIC_VECTOR (7 downto 0);
       O_dataB : out  STD_LOGIC_VECTOR (7 downto 0);
		 O_dataC : out std_logic_vector (7 downto 0);
       I_selA : in  STD_LOGIC_VECTOR (1 downto 0);
       I_selB : in  STD_LOGIC_VECTOR (1 downto 0);
		 I_selC : in std_logic_vector (1 downto 0);
       I_we : in  STD_LOGIC;
		 we_done : out std_logic
		);
end Register_file;

architecture Behavioral of Register_file is
	type store_t is array (0 to 3) of std_logic_vector(7 downto 0);
	
   signal R : store_t := (
    "00000000",		--R1
	 "00000001",		--R2
    "00000010",		--R3
    "00000011"			--R4   
	 );

begin
  		O_dataA <= R(to_integer(unsigned(I_selA)));
		O_dataB <= R(to_integer(unsigned(I_selB)));
		O_dataC <= R(to_integer(unsigned(I_selC)));
	process (clk)
  begin

    if rising_edge(clk) then

	if (I_we = '1') then
      R(to_integer(unsigned(I_selB))) <= I_dataD;
		we_done <= '1';
	else 
		we_done <= '0';
	end if;
   end if;
	end process;
	
end Behavioral;

