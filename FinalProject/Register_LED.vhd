----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:45:13 12/02/2016 
-- Design Name: 
-- Module Name:    Register_LED - Behavioral 
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

entity Register_LED is
port (
		clk: in std_logic;
		switch0: in std_logic;
		switch1: in std_logic;
		Led7:out std_logic;
		Led6:out std_logic;
		Led5:out std_logic;
		Led4:out std_logic;
		Led3:out std_logic;
		Led2:out std_logic;
		Led1:out std_logic;
		Led0:out std_logic
		);
end Register_LED;

architecture Behavioral of Register_LED is
component RAM
		port(
		I_clk 	: in	STD_LOGIC;
		I_we 		: in  STD_LOGIC;
		I_addr 	: in  STD_LOGIC_VECTOR (1 downto 0);
		I_data 	: in  STD_LOGIC_VECTOR (7 downto 0);
		O_data 	: out	STD_LOGIC_VECTOR (7 downto 0)
			 );
end component;

signal I_addr: std_logic_vector (1 downto 0);
signal O_data: std_logic_vector (7 downto 0);
begin

RAM_1: RAM
port map(
	I_clk => clk,
	I_we => '0',
	I_addr => I_addr,
	I_data => "00000000",
	O_data => O_data
	);
I_addr <= switch0 & switch1;
LED0 <= O_data(0);
LED1 <= O_data(1);
LED2 <= O_data(2);
LED3 <= O_data(3);
LED4 <= O_data(4);
LED5 <= O_data(5);
LED6 <= O_data(6);
LED7 <= O_data(7);

end Behavioral;

