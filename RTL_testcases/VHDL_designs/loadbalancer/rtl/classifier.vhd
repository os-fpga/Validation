--------------------------------------------------------

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	use IEEE.std_logic_arith.all;
-------------------------------
	ENTITY classifier IS
	GENERIC(DATA_WIDTH :INTEGER := 64;
			CTRL_WIDTH :INTEGER := 8);
	PORT(
	SIGNAL 		in_data 			:	IN   	STD_LOGIC_VECTOR(63 DOWNTO 0)	;
	SIGNAL 		in_ctrl 			: 	IN   	STD_LOGIC_VECTOR(7 DOWNTO 0)	;
    SIGNAL 		in_wr 				:	IN 		STD_LOGIC	;
	SIGNAL 		in_rdy 				: 	OUT 	STD_LOGIC	;

	SIGNAL 		out_data 			:	OUT   	STD_LOGIC_VECTOR(63 DOWNTO 0)	;
	SIGNAL 		out_ctrl 			: 	OUT   	STD_LOGIC_VECTOR(7 DOWNTO 0)	;
	SIGNAL 		out_wr 				: 	OUT 	STD_LOGIC	;
	SIGNAL 		out_rdy 			: 	IN 		STD_LOGIC	;

    --- Misc
    SIGNAL 		dest			:	OUT   	STD_LOGIC_VECTOR(7 DOWNTO 0)	; 
    SIGNAL 		reset 				:	IN 		STD_LOGIC	;
    SIGNAL 		clk   				:	IN 		STD_LOGIC
	);
	END ENTITY;
	
 ------------------------------------------------------
	ARCHITECTURE behavior OF classifier IS 
-------COMPONENET SMALL FIFO
		COMPONENT  small_fifo IS
	GENERIC(WIDTH :INTEGER := 72;
			MAX_DEPTH_BITS :INTEGER := 3);
	PORT(
	
			   
     SIGNAL din : IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);--input [WIDTH-1:0] din,     // Data in
     SIGNAL wr_en : IN STD_LOGIC;--input          wr_en,   // Write enable
     
     SIGNAL rd_en : IN STD_LOGIC;--input          rd_en,   // Read the next word 
     
     SIGNAL dout :OUT STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);--output reg [WIDTH-1:0]  dout,    // Data out
     SIGNAL full : OUT STD_LOGIC;--output         full,
     SIGNAL nearly_full : OUT STD_LOGIC;--output         nearly_full,
     SIGNAL empty : OUT STD_LOGIC;--output         empty,
     
	
    SIGNAL reset :IN STD_LOGIC;
    SIGNAL clk   :IN STD_LOGIC

	);
	END COMPONENT;
-------COMPONENET SMALL FIFO
------COMPONENT open_header
	COMPONENT open_header IS
	GENERIC(DATA_WIDTH :INTEGER := 64;
			CTRL_WIDTH :INTEGER := 8);
	PORT(
	SIGNAL 		in_data 			:	IN   	STD_LOGIC_VECTOR(63 DOWNTO 0)	;
	SIGNAL 		in_ctrl 			: 	IN   	STD_LOGIC_VECTOR(7 DOWNTO 0)	;
    SIGNAL 		in_wr 				:	IN 		STD_LOGIC	;
	
	SIGNAL 		pkt_type			:	OUT   	STD_LOGIC_VECTOR(7 DOWNTO 0)	;
	SIGNAL 		pkt_type_rdy		:	OUT   	STD_LOGIC 	;	   		
    SIGNAL 		pkt_type_rdy_ack		:	IN   	STD_LOGIC 	;
	 --- Misc
    
    SIGNAL 		reset 				:	IN 		STD_LOGIC	;
    SIGNAL 		clk   				:	IN 		STD_LOGIC
	);
	END COMPONENT;
------COMPONENT open_header
------------ one hot encoding state definition
	
	TYPE state_type IS (IDLE, IN_MODULE_HDRS,SKIP_HDRS, IN_PACKET, DUMP_1 ,DUMP_2 ,DUMP_3, DUMP_4, DUMP_5);
	ATTRIBUTE enum_encoding: STRING;
	ATTRIBUTE enum_encoding of state_type : type is "onehot";

	SIGNAL state, state_NEXT : state_type; 

------------end state machine definition

----------------------FIFO	  
	  SIGNAL fifo_data : STD_LOGIC_VECTOR(63 DOWNTO 0);
	  SIGNAL fifo_ctrl : STD_LOGIC_VECTOR(7 DOWNTO 0);  
	  SIGNAL in_fifo_in : STD_LOGIC_VECTOR(71 DOWNTO 0);    
      SIGNAL in_fifo_rd_en : STD_LOGIC;
	  SIGNAL in_fifo_rd_en_p : STD_LOGIC;
	  SIGNAL in_fifo_go : STD_LOGIC;
	  SIGNAL in_fifo_go_i : STD_LOGIC;
      SIGNAL in_fifo_dout  : STD_LOGIC_VECTOR(71 DOWNTO 0);  
      SIGNAL in_fifo_full : STD_LOGIC;
      SIGNAL in_fifo_nearly_full : STD_LOGIC;
      SIGNAL in_fifo_empty : STD_LOGIC;
------------------------------
	  SIGNAL ctrl_fifo_in : STD_LOGIC_VECTOR(7 DOWNTO 0);         
      SIGNAL ctrl_fifo_rd : STD_LOGIC;       
      SIGNAL ctrl_fifo_dout : STD_LOGIC_VECTOR(7 DOWNTO 0);   
      SIGNAL ctrl_fifo_full : STD_LOGIC; 
      SIGNAL ctrl_fifo_nearly_full : STD_LOGIC; 
      SIGNAL ctrl_fifo_empty : STD_LOGIC; 
      SIGNAL pkt_type_rdy : STD_LOGIC;
		SIGNAL pkt_type_rdy_ack_p : STD_LOGIC;
		SIGNAL pkt_type_rdy_ack : STD_LOGIC;
	  SIGNAL pkt_type : STD_LOGIC_VECTOR(7 DOWNTO 0);
	  SIGNAL cnt : INTEGER; 
	  SIGNAL 		out_data_i 			:	   	STD_LOGIC_VECTOR(63 DOWNTO 0)	;
	  SIGNAL 		out_ctrl_i 			: 	   	STD_LOGIC_VECTOR(7 DOWNTO 0)	;
	  SIGNAL 		out_wr_i 			: 	 	STD_LOGIC	;
---------------------------------------------------
	BEGIN
	------PORT MAP open_header
	open_header_Inst : open_header 
	GENERIC MAP (DATA_WIDTH  => 64,
			CTRL_WIDTH => 8)
	PORT MAP(
	 		in_data 			=>	in_data,
	 		in_ctrl 			=> 	in_ctrl ,
     		in_wr 				=>	in_wr,
	
	 		pkt_type			=>	pkt_type	,
	 		pkt_type_rdy		=>	pkt_type_rdy,
    --- Misc
         pkt_type_rdy_ack =>pkt_type_rdy_ack_p,
     		reset 				=>	reset,
     		clk   				=>	clk
	);
	
	------PORT MAP open_header
	
		-------PORT MAP SMALL FIFO DATA
		small_fifo_Inst :  small_fifo 
	GENERIC MAP(WIDTH  => 72,
			MAX_DEPTH_BITS  => 5)
	PORT MAP(
	
			   
      din =>(in_fifo_in),    
      wr_en =>in_wr,   
     
      rd_en => in_fifo_rd_en,   
     
      dout =>in_fifo_dout,   
      full =>in_fifo_full,
      nearly_full =>in_fifo_nearly_full,
      empty => in_fifo_empty,
     
	
     reset => reset ,
     clk  => clk 

	);


-------PORT MAP SMALL FIFO
		-------PORT MAP SMALL FIFO DATA
		small_fifo_Inst_ctrl :  small_fifo 
	GENERIC MAP(WIDTH  => 8,
			MAX_DEPTH_BITS  => 5)
	PORT MAP(
	
			   
      din =>pkt_type,    
      wr_en =>pkt_type_rdy,   
     
      rd_en => ctrl_fifo_rd,   
     
      dout =>ctrl_fifo_dout,   
      full =>ctrl_fifo_full,
      nearly_full =>ctrl_fifo_nearly_full,
      empty => ctrl_fifo_empty,
     
	
     reset => reset ,
     clk  => clk 

	);
	
	
-----------------------
      in_fifo_in 	<= 	in_data & in_ctrl ;
		fifo_data 	<=	   in_fifo_dout(71 DOWNTO 8)	;
		fifo_ctrl 	<= 	in_fifo_dout(7 DOWNTO 0)	;
		in_fifo_rd_en <=  in_fifo_go and out_rdy and (not in_fifo_empty);
		
	
	
		 in_rdy 	<=	(NOT in_fifo_nearly_full) AND (NOT ctrl_fifo_nearly_full)	;
		


	dest <=  ctrl_fifo_dout(7 DOWNTO 0);
		
PROCESS(clk,reset)
BEGIN
	IF (reset ='1') THEN
		state <=IDLE;	
		ELSIF clk'EVENT AND clk ='1' THEN
		state<=state_next;
		in_fifo_rd_en_p <= in_fifo_rd_en;
	END IF;
END PROCESS;

PROCESS(state, ctrl_fifo_empty ,fifo_data, fifo_ctrl,in_fifo_empty)
	BEGIN
									state_next 			   <= state;
									out_data_i				<=	fifo_data;
									out_ctrl_i				<=	fifo_ctrl;
									out_wr_i				   <=	in_fifo_rd_en_p ;
									ctrl_fifo_rd			<=	'0'	;
									in_fifo_go				<=	'0'	; 
									pkt_type_rdy_ack_p	<= '0';

		CASE state IS
			WHEN IDLE =>-- wait till the ctrl queue is not empty classification done
			   IF(ctrl_fifo_empty = '0') THEN
								   ctrl_fifo_rd			<=	'1'	;
								   in_fifo_go				<=	'1'	; 	
									pkt_type_rdy_ack_p	<= '1';
								   state_next 				<=  IN_MODULE_HDRS;				
			END IF;
			WHEN IN_MODULE_HDRS =>
								   		in_fifo_go				   <=	'1'	; 
				IF ( in_fifo_rd_en_p = '1' ) THEN
--									out_data_i(55 downto 48)<=	 
--									out_wr_i				   <=	'1' ;
									
									state_next                 <= IN_PACKET;
					END IF;
			
			WHEN SKIP_HDRS =>
								    		
				IF (  fifo_ctrl = X"00" ) THEN
								 state_next                 <= IN_PACKET;
			    ELSE 
							 in_fifo_go				<=	'1'	;
							 
					END IF;
					
			WHEN IN_PACKET		=>
--								   	 out_wr_i				    <=	'1' ; 
									in_fifo_go				    <=	'1'	;
								 			 
				IF (  fifo_ctrl /= X"00") THEN
--								IF  out_rdy='1' THEN
								   in_fifo_go				   <=	'0'	;
--									out_wr_i				    <=	'1' ; 	
									state_next                 <= DUMP_1;
								END IF;
--				ELSIF out_rdy='1' AND in_fifo_empty ='0'  THEN 
									
--				END IF;
				WHEN DUMP_1		=> state_next                 <= DUMP_2;
				WHEN DUMP_2		=> state_next                 <= DUMP_3;
				WHEN DUMP_3		=> state_next                 <= DUMP_4;
				WHEN DUMP_4		=> state_next                 <= DUMP_5;
				WHEN DUMP_5		=> state_next                 <= IDLE;
				WHEN OTHERS=> state_next                 	  <= IDLE;
				
		END CASE;
	END PROCESS;
---------------Register output
		PROCESS(clk,reset)
		BEGIN
			
			IF clk'EVENT AND clk ='1' THEN
									out_data				<=	out_data_i;
									out_ctrl				<=	out_ctrl_i;
									out_wr					<=	out_wr_i;	
									
			END IF;
		END PROCESS;	
END behavior;
   