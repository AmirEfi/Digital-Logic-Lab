library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity regen is
    Port ( clk : in  STD_LOGIC;
           reset  : in  STD_LOGIC;
           en : in  STD_LOGIC;
           i : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0));
end regen;

architecture Behavioral of regen is

begin
process (clk, reset) 
begin
	if(clk'event and clk = '1') then 
		if ( reset = '1') then
			o <= "0000";
		elsif ( en = '1') then 
			o <= i;
		end if;
	end if;
end process;

end Behavioral;

