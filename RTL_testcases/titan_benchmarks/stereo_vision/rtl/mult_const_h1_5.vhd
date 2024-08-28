LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY mult_const_h1_5 IS
	port (
	q: OUT std_logic_VECTOR(16 downto 0));
END mult_const_h1_5;

ARCHITECTURE mult_const_h1_5_a OF mult_const_h1_5 IS

BEGIN
q <= X"0000" & '0';

END mult_const_h1_5_a;
