LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY my_ram IS
	port (
	addr	: IN std_logic_VECTOR(7 downto 0);
	clk		: IN std_logic;
	din		: IN std_logic_VECTOR(15 downto 0);
	dout	: OUT std_logic_VECTOR(15 downto 0);
	nd		: IN std_logic;
	rfd		: OUT std_logic;
	rdy		: OUT std_logic;
	we		: IN std_logic );
END my_ram;

ARCHITECTURE SYN OF my_ram IS
	COMPONENT altdpram256x16
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	END COMPONENT;	
BEGIN
	rfd <= nd;
	rdy <= nd;
RAM0	: altdpram256x16
PORT MAP (
			address	=> addr,
			clock	=> clk,
			data	=> din,
			wren	=> we,
			q		=> dout
		 );
END SYN;