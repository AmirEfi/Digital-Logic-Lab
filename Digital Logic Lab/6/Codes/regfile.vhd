
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity regfile is
    Port ( a1 : in  STD_LOGIC_VECTOR (2 downto 0);
           a2 : in  STD_LOGIC_VECTOR (2 downto 0);
           a3 : in  STD_LOGIC_VECTOR (2 downto 0);
           wd3 : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           we3 : in  STD_LOGIC;
           rd1 : out  STD_LOGIC_VECTOR (7 downto 0);
           rd2 : out  STD_LOGIC_VECTOR (7 downto 0));
end regfile;

architecture Behavioral of regfile is

type rf is array (0 to 7) of std_logic_vector(7 downto 0); 
signal rf_reg : rf ;
begin
rd1 <= rf_reg(to_integer(unsigned(a1)));
rd2 <= rf_reg(to_integer(unsigned(a2)));
process (clk) 
begin
	if(clk'event and clk = '1') then 
		if ( we3 = '1') then
			rf_reg(to_integer(unsigned(a3))) <= wd3;
		end if;
	end if;
end process;

end Behavioral;

