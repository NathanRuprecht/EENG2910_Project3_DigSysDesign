----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		Nathan A Ruprecht
-- 
-- Create Date:   11:46:09 09/21/2016 
-- Design Name: 
-- Module Name:   MUX_DEMUX - Behavioral 
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

entity MUX_DEMUX is
    port(
	      mux_in : in STD_LOGIC_VECTOR(7 downto 0);
         sel_mux : in STD_LOGIC_VECTOR(2 downto 0);
			--mux_out : inout STD_LOGIC;
			--dmux_in : inout STD_LOGIC;
         sel_demux : in STD_LOGIC_VECTOR(2 downto 0);
         dmux_out : out STD_LOGIC_VECTOR(7 downto 0)
         );
end MUX_DEMUX;

architecture Behavioral of MUX_DEMUX is
signal mux_out,dmux_in :  STD_LOGIC;
begin

mux : process (mux_in,sel_mux) is
    begin
        case sel_mux is
            when "000" => mux_out <= mux_in(7);
            when "001" => mux_out <= mux_in(6);
            when "010" => mux_out <= mux_in(5);
				when "011" => mux_out <= mux_in(4);
            when "100" => mux_out <= mux_in(3);
            when "101" => mux_out <= mux_in(2);
				when "110" => mux_out <= mux_in(1);
            when others => mux_out <= mux_in(0);
        end case;
    end process mux;

dmux_in<=mux_out;

demux : process (dmux_in,sel_demux) is
    begin
        case sel_demux is
            when "000" => dmux_out <= dmux_in & "0000000";
            when "001" => dmux_out <= '0' & dmux_in & "000000";
            when "010" => dmux_out <= "00" & dmux_in & "00000";
				when "011" => dmux_out <= "000" & dmux_in & "0000";
				when "100" => dmux_out <= "0000" & dmux_in & "000";
            when "101" => dmux_out <= "00000" & dmux_in & "00";
            when "110" => dmux_out <= "000000" & dmux_in & '0';
            when others => dmux_out <= "0000000" & dmux_in;
        end case;
    end process demux;



end Behavioral;

