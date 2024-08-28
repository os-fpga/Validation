LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY my_mult_8 IS
port (
		clk	: IN std_logic;
		a	: IN std_logic_VECTOR(7 downto 0);
		b	: IN std_logic_VECTOR(7 downto 0);
		q	: OUT std_logic_VECTOR(15 downto 0);
		rdy	: OUT std_logic);
END my_mult_8;

ARCHITECTURE SYN OF my_mult_8 IS
	COMPONENT altmult8x8
	PORT
	(
		dataa		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
rdy <= '1';

MULT0	: altmult8x8
PORT MAP (
			dataa	=> a,
			datab	=> b,
			clock	=> clk,
			result	=> q
		 );
END SYN;