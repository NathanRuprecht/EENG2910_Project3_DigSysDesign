--------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		Nathan A Ruprecht
--
-- Create Date:   15:06:46 09/28/2016
-- Design Name:   
-- Module Name:   E:/2910/DP3/Code/ALU/tb_ALU.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_ALU is
--  Port ( );
end tb_ALU;

architecture Behavioral of tb_ALU is
    component ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal  A :   std_logic_vector(7 downto 0);
    signal  B :   std_logic_vector(7 downto 0);
    signal  Sel :   std_logic_vector(2 downto 0);
    signal  Y :   std_logic_vector(7 downto 0);
begin
    uut : ALU
    port map (
            A => A,
            B => B,
            Sel => Sel,
            Y => Y
            );
            
    sim : process
    begin
		
	     A <= "00001000";
        B <= "00000111";
        Sel <= "111";
		  wait for 100 ns;
		  	
        A <= "00001000";
        B <= "00000111";
        Sel <= "000";
        wait for 100 ns;
        
        A <= "00000011";
        B <= "00001111";
        Sel <= "001";
        wait for 100 ns;
        
        A <= "00000011";
        B <= "00000111";
        Sel <= "010";
        wait for 100 ns;
        
        A <= "00000001";
        B <= "00000001";
        Sel <= "011";
        wait for 100 ns;    

        A <= "00001000";
        B <= "00000111";
        Sel <= "100";
        wait for 100 ns;
        
        A <= "00000100";
        B <= "00001011";
        Sel <= "101";
        wait for 100 ns;
		  
        A <= "00011100";
        B <= "00000000";
        Sel <= "110";
        wait for 100 ns;
        
        A <= "00011111";
        B <= "00000111";
        Sel <= "111";
        wait for 100 ns; 		  
    end process;

end Behavioral;
