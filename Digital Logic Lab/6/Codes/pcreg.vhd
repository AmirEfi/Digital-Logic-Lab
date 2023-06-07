
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcreg is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           i : in  STD_LOGIC_VECTOR (7 downto 0);
           o : out  STD_LOGIC_VECTOR (7 downto 0));
end pcreg;

architecture Behavioral of pcreg is

begin
process (clk, reset) 
begin
	if(clk'event and clk = '1') then 
		if ( reset = '1') then
			o <= "00000000";
		else 
			o <= i;
		end if;
	end if;
end process;

end Behavioral;

