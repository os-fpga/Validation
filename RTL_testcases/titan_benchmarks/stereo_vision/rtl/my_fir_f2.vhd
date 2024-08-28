-- Code converted from Coregen BB into behavioural code <Temporary for QNS Test Only>
-- By Loh, Mui Soon Sept 09th, 2003 Rev 1.0

library ieee;
use ieee.std_logic_1164.all;

ENTITY my_fir_f2	IS
port (
		ND	: IN std_logic;
		RDY	: OUT std_logic;
		CLK	: IN std_logic;
		RFD	: OUT std_logic;
		DIN	: IN std_logic_VECTOR(15 downto 0);
		DOUT: OUT std_logic_VECTOR(27 downto 0)
     );  

		     
END ENTITY my_fir_f2;
ARCHITECTURE SYN OF my_fir_f2 IS

COMPONENT my_fir_f2_altr
	PORT
	(
		clock		: IN STD_LOGIC  := '1';
		rst			: IN STD_LOGIC  := '1';
		data_in		: IN STD_LOGIC_VECTOR (15 DOWNTO 0) :=  (OTHERS => '1');
		fir_result	: OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
		rdy_to_ld	: OUT STD_LOGIC ;
		done		: OUT STD_LOGIC 
	);
END COMPONENT;

SIGNAL Q_w  :   STD_LOGIC_VECTOR(27 DOWNTO 0);

BEGIN
FIR1	: my_fir_f2_altr
PORT MAP (
			clock		=> CLK,
			rst			=> ND,
			data_in		=> DIN,
			fir_result	=> DOUT,
			rdy_to_ld	=> RFD,
			done		=> RDY
		 );

END ARCHITECTURE SYN;