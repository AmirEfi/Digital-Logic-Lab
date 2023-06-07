
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux2 is
	generic ( n : integer := 8);
    Port ( i0 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           i1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           s : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (n-1 downto 0));
end mux2;

architecture Behavioral of mux2 is

begin

o <= i0 when s = '0' else i1;

end Behavioral;

