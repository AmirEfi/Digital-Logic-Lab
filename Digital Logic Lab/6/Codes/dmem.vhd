
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity dmem is
    Port ( clk : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (7 downto 0);
           we : in  STD_LOGIC;
           wd : in  STD_LOGIC_VECTOR (7 downto 0);
           rd : out  STD_LOGIC_VECTOR (7 downto 0));
end dmem;

architecture Behavioral of dmem is
type ram is array (0 to 255) of std_logic_vector(7 downto 0);
signal ram_inst : ram:= (others => (others => '0'));
begin

rd <= ram_inst((to_integer(unsigned(a))));
process (clk) 
begin
if (rising_edge(clk) and clk = '1') then 
	if ( we = '1') then
		ram_inst(to_integer(unsigned(a))) <= wd;
	end if;
end if;
end process;


end Behavioral;

