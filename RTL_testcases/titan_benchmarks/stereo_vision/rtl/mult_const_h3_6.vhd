LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY mult_const_h3_6 IS
	port (
	clk: IN std_logic;
	a: IN std_logic_VECTOR(7 downto 0);
	q: OUT std_logic_VECTOR(16 downto 0));
END mult_const_h3_6;

ARCHITECTURE mult_const_h3_6_a OF mult_const_h3_6 IS

SIGNAL q_w	: std_logic_VECTOR(14 downto 0);
BEGIN
q <= "00" & q_w;

PROCESS (CLK)
	BEGIN			 
	 IF (CLK' EVENT AND CLK = '1') THEN	  
		 q_w <= a * "1101101";			 	 
	 END IF;
END PROCESS;

END mult_const_h3_6_a;