
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3 is
	generic ( n : integer := 8);
    Port ( i0 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           i1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           i2 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           o : out  STD_LOGIC_VECTOR (n-1 downto 0));
end mux3;
architecture Behavioral of mux3 is
begin
with s select o <=i0 when "00",i1 when "01",i2 when "10","00000000" when "11";
end Behavioral;

