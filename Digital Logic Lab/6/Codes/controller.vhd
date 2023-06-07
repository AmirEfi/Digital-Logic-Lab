
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity controller is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           aluflags : in  STD_LOGIC_VECTOR (3 downto 0);
           instr : in  STD_LOGIC_VECTOR (15 downto 0);
           pcsrc : out  STD_LOGIC;
           regw : out  STD_LOGIC;
           immsrc : out  STD_LOGIC;
           srca : out  STD_LOGIC;
           srcb : out  STD_LOGIC_VECTOR (1 downto 0);
           memw : out  STD_LOGIC;
           memtoreg : out  STD_LOGIC;
           r1 : out  STD_LOGIC;
           alucontrol : out  STD_LOGIC_VECTOR (3 downto 0));
end controller;

architecture Behavioral of controller is

component regen
  port (
    clk : in  STD_LOGIC;
           reset  : in  STD_LOGIC;
           en : in  STD_LOGIC;
           i : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0)
  );
  end component regen;
  
  signal flagsout : STD_LOGIC_VECTOR (3 downto 0);
  signal fw : std_logic;
  signal control : STD_LOGIC_VECTOR (13 downto 0);
  
begin

regen1 : regen
	port map(
		     clk => clk,
           reset  => reset,
           en => fw,
           i => aluflags,
           o => flagsout
	);
	
	process (aluflags, instr)
	begin 
		if instr(15) = '0' then
			case instr(10 downto 6) is
				when "00001" =>		--add
					control <= "01000000100001";
				when "00010" =>		--and
					control <= "01000000100011";
				when "00011" =>		--sub
					control <= "01000000100101";
				when "00100" =>		--or
					control <= "01000000100111";
				when "00101" =>		--xor
					control <= "01000000101001";
				when "01000" =>		--not
					control <= "01000000111010";
				when "00110" =>		--mov
					control <= "01010000111110";
				when "01001" =>		--sar
					control <= "01001000101111";
				when "01010" =>		--slr
					control <= "01001000110001";
				when "01011" =>		--sal
					control <= "01001000110011";
				when "01100" =>		--sll
					control <= "01001000110101";
				when "01101" =>		--rol
					control <= "01001000110111";
				when "01110" =>		--ror
					control <= "01001000111001";
				when "00000" =>		--nop
					control <= "00000000111110";
				when "01111" =>		--inc
					control <= "01000100100001";
				when "10000" =>		--dec
					control <= "01000100100101";
				when "10100" =>		--cmp
					control <= "00000000100101";
				when others =>
					control <= "UUUUUUUUUUUUUU";
			end case;
		else 
			case instr(14 downto 11) is
				when "0000" =>		--je
					if flagsout(2)='1' then
						control <= "10111000111110";
					else 
						control <= "00111000111110";
					end if;
				when "0001" =>		--jb
					if(flagsout(1)='1')then
						control <= "10111000111110";
					else 
						control <= "00111000111110";
					end if;
				when "0010" =>		--ja
					if(flagsout(2) = '0' and flagsout(1) = '0')then 
						control <= "10111000111110";
					else 
						control <= "00111000111110";
					end if;
				when "0011" =>		--jl
					if(flagsout(3) /= flagsout(0))then
						control <= "10111000111110";
					else 
						control <= "00111000111110";
					end if;
				when "0100" =>		--jg
					if(flagsout(3) = flagsout(0) and flagsout(2) = '0')then
						control <= "10111000111110";
					else 
						control <= "00111000111110";
					end if;
				when "0101" =>	--jmp
					control <= "10111000111110";
				when "1000" =>		--li
					control <= "01111000011110";
				when "1001" =>		--lm
					control <= "01111010011110";
				when "1010" =>		--sm
					control <= "01111011011110";
				when others =>
					control <= "UUUUUUUUUUUUUU";
			end case;
		end if;
	end process;
	
	fw <= control(0);
	alucontrol <= control(4 downto 1);
	r1 <= control(5);
	memtoreg <= control(6);
	memw <= control(7);
	srcb <= control(9 downto 8);
	srca <= control(10);
	immsrc <= control(11);
	regw <= control(12);
	pcsrc <= control(13);


end Behavioral;

