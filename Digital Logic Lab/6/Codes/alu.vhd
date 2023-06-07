
library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity alu is
	port(
		a  : in std_logic_vector(7 downto 0);
		b  : in std_logic_vector(7 downto 0);
		control  : in std_logic_vector(3 downto 0);
		
		o    : out std_logic_vector(7 downto 0);
		cf   : out std_logic; 
		sf  : out std_logic; 
		ovf   : out std_logic; 
		zf   : out std_logic
		);
end alu;
architecture behavioral of alu is
	signal addition_s, increment_s, subtraction_s, decrement_s : std_logic_vector(8 downto 0); --it is used for carry out
	
	
	type logicVectorArray is array (0 to 15) of std_logic_vector(7 downto 0);
	signal output : logicVectorArray;
	
begin	
	addition_s <= ('0' & a) + ('0' & b); 
	subtraction_s <= ('0' & a) - ('0' & b); 
	increment_s <= ('0' & a) + 1;  
	decrement_s <= ('0' & b) - 1;  	
	output(0) <= addition_s(7 downto 0);
	output(1) <= a AND b; 
	output(2) <= subtraction_s(7 downto 0);
	output(3) <= a OR b;
	output(4) <= a XOR b; 
	output(5) <= increment_s(7 downto 0); 
	output(6) <= decrement_s(7 downto 0);
	output(7) <= std_logic_vector(shift_right(signed(a), to_integer(unsigned(b))));
	output(8) <= std_logic_vector(shift_right(unsigned(a), to_integer(unsigned(b))));
	output(9) <= std_logic_vector(shift_left(signed(a), to_integer(unsigned(b))));
	output(10) <= std_logic_vector(shift_left(unsigned(a), to_integer(unsigned(b))));
	output(11) <= std_logic_vector(rotate_left(unsigned(a), to_integer(unsigned(b))));
	output(12) <= std_logic_vector(rotate_right(unsigned(a), to_integer(unsigned(b))));
	output(13) <= NOT a; 
	output(14) <= subtraction_s(7 downto 0);
	output(15) <= b;
	o <= output(conv_integer(control)); 
	sf <= output(conv_integer(control))(7); 
	
	zf <= '1' when output(conv_integer(control)) = "00000000" else '0'; 
	
	cf <= addition_s(8) WHEN control = "0000" ELSE 
		  decrement_s(8) WHEN control = "0110" ELSE 
		  increment_s(8) WHEN control = "0101" ELSE 
		  subtraction_s(8) WHEN control = "0010" ELSE 
		  subtraction_s(8) WHEN control = "1110" ELSE 
			'Z'; 
	ovf <= NOT ( a(7) XOR b(7) ) AND (a(7) XOR addition_s(7)) WHEN control = "0000" ELSE
		   NOT ( a(7) XOR b(7) ) AND (a(7) XOR subtraction_s(7)) WHEN control = "0010" ELSE 	
		   NOT ( a(7) XOR b(7) ) AND (a(7) XOR subtraction_s(7)) WHEN control = "1110" ELSE 
		   NOT a(7) AND  (a(7) XOR increment_s(7)) WHEN control = "0101" ELSE 
		   NOT a(7) AND  (a(7) XOR decrement_s(7)) WHEN control = "0110" ELSE 
		  'Z'; 
	
	
	
		
end behavioral;



