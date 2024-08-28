LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY my_div_16_slow IS
	port (
	dividend	: IN std_logic_VECTOR(15 downto 0);
	divisor		: IN std_logic_VECTOR(16 downto 0);
	quot		: OUT std_logic_VECTOR(15 downto 0);
	remd		: OUT std_logic_VECTOR(7 downto 0);
	c			: IN std_logic);
END my_div_16_slow;

ARCHITECTURE SYN OF my_div_16_slow IS
	COMPONENT div16_slow
	PORT
	(
		numer		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		denom		: IN STD_LOGIC_VECTOR (16 DOWNTO 0);
		clock		: IN STD_LOGIC ;
		quotient	: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		remain		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0)
	);
	END COMPONENT;

BEGIN

DIV0	: div16_slow
PORT MAP (
			numer				=> dividend,
			denom				=> divisor,
			clock				=> c,
			quotient			=> quot,
			remain(7 downto 0)	=> remd
		 );
END SYN;