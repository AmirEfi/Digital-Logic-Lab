
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
entity imem is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           rd : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk : in std_logic);
end imem;
architecture Behavioral of imem is
type ram is array (0 to 255) of std_logic_vector(15 downto 0);
signal ram_ins : ram := (others => (others => '0'));
begin
rd <= ram_ins((to_integer(unsigned(a))));
process 
begin 
	ram_ins(0) <= "1100000000001010";
	ram_ins(1) <= "1100000100000000";
	ram_ins(2) <= "1100001000000001";
	ram_ins(3) <= "1100001100000000";
	ram_ins(4) <= "0000010100000011";
	ram_ins(5) <= "1000000000001001";
	ram_ins(6) <= "0000000001001000";
	ram_ins(7) <= "0000000011000010";
	ram_ins(8) <= "1010100000000100";
	ram_ins(9) <= "1101000101100100";
	wait ;--until a /= "11100100" ;
end process;
end Behavioral;

