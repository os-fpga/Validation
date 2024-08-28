LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY mult_const_h1_4 IS
	port (
	clk: IN std_logic;
	a: IN std_logic_VECTOR(7 downto 0);
	q: OUT std_logic_VECTOR(16 downto 0));
END mult_const_h1_4;

ARCHITECTURE mult_const_h1_4_a OF mult_const_h1_4 IS

SIGNAL q_w	: std_logic_VECTOR(15 downto 0);
BEGIN
q <= '0' & q_w;

PROCESS (CLK)
	BEGIN			 
	 IF (CLK' EVENT AND CLK = '1') THEN	  
		 q_w <= a * "11000001";			 	 
	 END IF;
END PROCESS;

END mult_const_h1_4_a;
