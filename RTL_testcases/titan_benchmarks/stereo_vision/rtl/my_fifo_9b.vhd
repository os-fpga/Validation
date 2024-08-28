-- Code converted from Coregen BB into behavioural code
-- By Loh, Mui Soon Sept 09th, 2003 Rev 1.0

library ieee;
use ieee.std_logic_1164.all;

ENTITY my_fifo_9b	IS
PORT ( 
	   D	: IN 	STD_LOGIC_VECTOR(8 DOWNTO 0);
	   Q	: OUT 	STD_LOGIC_VECTOR(8 DOWNTO 0);
	   CLK, CE : IN STD_LOGIC
     );  

		     
END ENTITY my_fifo_9b;
ARCHITECTURE SYN OF my_fifo_9b IS
SIGNAL Q_w  :   STD_LOGIC_VECTOR(8 DOWNTO 0);

BEGIN
Q <= Q_w;
PROCESS (CLK, CE)
	BEGIN			 
	 IF (CLK' EVENT AND CLK = '1') THEN	  
	 	IF(CE = '1') THEN
			Q_w <= D;
		END IF;	
	 END IF;	 
END PROCESS;

END ARCHITECTURE SYN;
