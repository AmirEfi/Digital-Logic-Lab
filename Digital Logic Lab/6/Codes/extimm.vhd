
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity extimm is
    Port ( i : in  STD_LOGIC_VECTOR (7 downto 0);
           s : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (7 downto 0));
end extimm;
architecture Behavioral of extimm is
begin
with s select o <= i when '1',"00000" & i(2 downto 0) when '0';
end Behavioral;

