-------------------------------------------	
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------

	ENTITY  balancer_top IS
	GENERIC(	DATA_WIDTH :INTEGER := 64;
				CTRL_WIDTH :INTEGER := 8);
	PORT(
	
				SIGNAL in_data :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
				SIGNAL in_ctrl : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
				SIGNAL in_wr :IN STD_LOGIC;
				SIGNAL in_rdy : OUT STD_LOGIC;
				
				SIGNAL out_data : OUT   STD_LOGIC_VECTOR(63 DOWNTO 0);
				SIGNAL out_ctrl : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
				SIGNAL out_wr : OUT STD_LOGIC;
				SIGNAL out_rdy : IN STD_LOGIC;
				SIGNAL 		dest_out			:	OUT   	STD_LOGIC_VECTOR(7 DOWNTO 0)	; 
				SIGNAL reset :IN STD_LOGIC;
				SIGNAL clk   :IN STD_LOGIC
	);
	END ENTITY;
	
	ARCHITECTURE behavior OF balancer_top IS 
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
COMPONENT  int2ext_top IS
	GENERIC(DATA_WIDTH :INTEGER := 64;
			CTRL_WIDTH :INTEGER := 8);
	PORT(
	
		SIGNAL in_data :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL in_ctrl : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL in_wr :IN STD_LOGIC;
		SIGNAL in_rdy : OUT STD_LOGIC;
		
		SIGNAL out_data : OUT   STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL out_ctrl : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL out_wr : OUT STD_LOGIC;
		SIGNAL out_rdy : IN STD_LOGIC;
	   
		SIGNAL     en : IN STD_LOGIC;
		
		SIGNAL reset :IN STD_LOGIC;
		SIGNAL clk   :IN STD_LOGIC

	);
	END COMPONENT int2ext_top;
--
--		COMPONENT  hello_pkt IS
--	GENERIC(DATA_WIDTH :INTEGER := 64;
--			CTRL_WIDTH :INTEGER := 8);
--	PORT(
--
--			 SIGNAL tx_in_data : IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
--			 SIGNAL tx_in_ctrl : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
--			 SIGNAL tx_in_wr :  	IN STD_LOGIC;
--			 SIGNAL rx_in_data : IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
--			 SIGNAL rx_in_ctrl : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
--			 SIGNAL rx_in_wr   : IN STD_LOGIC;
--
--			 SIGNAL out_data   : OUT   STD_LOGIC_VECTOR(63 DOWNTO 0);
--			 SIGNAL out_ctrl   : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
--			 SIGNAL out_wr     : OUT STD_LOGIC;
--		--	SIGNAL out_cnt : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
--		--	SIGNAL cnt_enable :OUT STD_LOGIC;
--			 SIGNAL out_rdy    :	IN STD_LOGIC;
--			 SIGNAL in_rdy     :	OUT STD_LOGIC;
--			 SIGNAL reset      :	IN STD_LOGIC;
--			 SIGNAL clk        :	IN STD_LOGIC
--	);
--	END COMPONENT hello_pkt;
--------------------- Classifier Component------------
	COMPONENT  classifier IS
	GENERIC(DATA_WIDTH :INTEGER := 64;
			CTRL_WIDTH :INTEGER := 8);
	PORT(
	
	SIGNAL in_data :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL in_ctrl : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL in_wr :IN STD_LOGIC;
	SIGNAL in_rdy : OUT STD_LOGIC;
	
	SIGNAL out_data :OUT   STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL out_ctrl : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL out_wr : OUT STD_LOGIC;
	SIGNAL out_rdy : IN STD_LOGIC;
    SIGNAL 		dest			:	OUT   	STD_LOGIC_VECTOR(7 DOWNTO 0)	; 
    SIGNAL reset :IN STD_LOGIC;
    SIGNAL clk   :IN STD_LOGIC
	);
	END COMPONENT classifier;
------------End Classifier Component 
-------- Classifier Arbiter -----------
	COMPONENT classifier_arbiter IS
	GENERIC(DATA_WIDTH :INTEGER := 64;
			CTRL_WIDTH :INTEGER := 8);
	PORT(
	
		SIGNAL out_data : OUT   STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL out_ctrl : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL out_wr : OUT STD_LOGIC;
		SIGNAL out_rdy : IN STD_LOGIC;
	
		SIGNAL in_data_0 :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL in_ctrl_0 : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL in_wr_0 :IN STD_LOGIC;
		SIGNAL in_rdy_0 : OUT STD_LOGIC;
	
		SIGNAL in_data_1 :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL in_ctrl_1 : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL in_wr_1 :IN STD_LOGIC;
		SIGNAL in_rdy_1 : OUT STD_LOGIC;
	
		SIGNAL in_data_2 :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL in_ctrl_2 : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL in_wr_2 :IN STD_LOGIC;
		SIGNAL in_rdy_2 : OUT STD_LOGIC;
	
		SIGNAL in_data_3 :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL in_ctrl_3 : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL in_wr_3 :IN STD_LOGIC;
		SIGNAL in_rdy_3 : OUT STD_LOGIC;
		
		SIGNAL in_data_4 :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL in_ctrl_4 : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL in_wr_4 :IN STD_LOGIC;
		SIGNAL in_rdy_4 : OUT STD_LOGIC;
		
		SIGNAL in_data_5 :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL in_ctrl_5 : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL in_wr_5 :IN STD_LOGIC;
		SIGNAL in_rdy_5 : OUT STD_LOGIC;
		
		SIGNAL in_data_6 :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL in_ctrl_6 : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL in_wr_6 :IN STD_LOGIC;
		SIGNAL in_rdy_6 : OUT STD_LOGIC;
		
		SIGNAL in_data_7 :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL in_ctrl_7 : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
		SIGNAL in_wr_7 :IN STD_LOGIC;
		SIGNAL in_rdy_7 : OUT STD_LOGIC;
	
		SIGNAL reset :IN STD_LOGIC;
		SIGNAL clk   :IN STD_LOGIC

	);
	END COMPONENT classifier_arbiter;
----------------------------Arp Top Component
	COMPONENT arp_top IS
	GENERIC(DATA_WIDTH :INTEGER := 64;
			CTRL_WIDTH :INTEGER := 8);
	PORT(
	SIGNAL in_data :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL in_ctrl : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL in_wr :IN STD_LOGIC;
	SIGNAL in_rdy : OUT STD_LOGIC;

	SIGNAL out_data :OUT   STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL out_ctrl : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL out_wr : OUT STD_LOGIC;
	SIGNAL out_rdy : IN STD_LOGIC;
	
	 
    --- Misc
     SIGNAL     en : IN STD_LOGIC;
    SIGNAL reset :IN STD_LOGIC;
    SIGNAL clk   :IN STD_LOGIC
	);
	END COMPONENT arp_top;
--	--------------- Balance Component-----
	COMPONENT   balance_top IS
	GENERIC(DATA_WIDTH :INTEGER := 64;
			CTRL_WIDTH :INTEGER := 8);
	PORT(
	
	SIGNAL in_data :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL in_ctrl : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL in_wr :IN STD_LOGIC;
	SIGNAL in_rdy : OUT STD_LOGIC;
	
	----------------
	SIGNAL in_next_mac :IN   STD_LOGIC_VECTOR(47 DOWNTO 0);
	SIGNAL in_exit_port :IN   STD_LOGIC_VECTOR(7 DOWNTO 0);	
	SIGNAL in_next_mac_rdy : IN STD_LOGIC;
	SIGNAL out_rd_next_mac : OUT STD_LOGIC;
	SIGNAL key :  OUT   STD_LOGIC_VECTOR(11 DOWNTO 0);
	-------------------
	SIGNAL out_data : OUT   STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL out_ctrl : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL out_wr : OUT STD_LOGIC;
	SIGNAL out_rdy : IN STD_LOGIC;
	SIGNAL en :IN STD_LOGIC;
    SIGNAL reset :IN STD_LOGIC;
    SIGNAL clk   :IN STD_LOGIC

	);
	END COMPONENT balance_top;
	
--	--------------- Router Component-----
	COMPONENT  router IS
	GENERIC(DATA_WIDTH :INTEGER := 64;
			CTRL_WIDTH :INTEGER := 8);
	PORT(
	
	 SIGNAL in_data :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
	 SIGNAL in_ctrl : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
     SIGNAL in_wr :IN STD_LOGIC;
	 SIGNAL in_rdy : OUT STD_LOGIC;
	
	 SIGNAL out_data : OUT   STD_LOGIC_VECTOR(63 DOWNTO 0);
	 SIGNAL out_ctrl : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
     SIGNAL out_wr : OUT STD_LOGIC;
	 SIGNAL out_rdy : IN STD_LOGIC;
	
	 SIGNAL     en : IN STD_LOGIC;
     SIGNAL reset :IN STD_LOGIC;
     SIGNAL clk   :IN STD_LOGIC

	);
	END COMPONENT;
-------------Pass Component-----
	COMPONENT  pass IS
	GENERIC(DATA_WIDTH :INTEGER := 64;
			CTRL_WIDTH :INTEGER := 8);
	PORT(
	
	SIGNAL in_data :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL in_ctrl : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL in_wr :IN STD_LOGIC;
	SIGNAL in_rdy : OUT STD_LOGIC;
	
	SIGNAL out_data : OUT   STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL out_ctrl : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL out_wr : OUT STD_LOGIC;
	SIGNAL out_rdy : IN STD_LOGIC;
	 SIGNAL     en : IN STD_LOGIC;
    SIGNAL reset :IN STD_LOGIC;
    SIGNAL clk   :IN STD_LOGIC

	);
	END COMPONENT  pass;
---------------------------------------------------------------------------------------
-------------Manager Component-----
	COMPONENT manager IS
	GENERIC(DATA_WIDTH :INTEGER := 64;
			CTRL_WIDTH :INTEGER := 8);
	PORT(
	
				SIGNAL in_data :IN   STD_LOGIC_VECTOR(63 DOWNTO 0);
				SIGNAL in_ctrl : IN   STD_LOGIC_VECTOR(7 DOWNTO 0);
				SIGNAL in_wr :IN STD_LOGIC;
				SIGNAL in_rdy : OUT STD_LOGIC;	
				SIGNAL in_rd: IN std_logic;
				SIGNAL in_key 		: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
				SIGNAL out_mac: OUT std_logic_VECTOR(47 downto 0);
				SIGNAL out_port: OUT std_logic_VECTOR(7 downto 0);
				SIGNAL out_rd_rdy: OUT std_logic	;
				SIGNAL out_rdy : IN STD_LOGIC;
				SIGNAL en: IN STD_LOGIC;	
				SIGNAL reset :IN STD_LOGIC;
				SIGNAL clk   :IN STD_LOGIC

	);
	END COMPONENT  manager;
---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
	SIGNAL out_data_classifier :    STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL out_ctrl_classifier :  STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL out_wr_classifier :  STD_LOGIC;	
	SIGNAL out_rdy_classifier :  STD_LOGIC;
	 SIGNAL 		dest_i			:	   	STD_LOGIC_VECTOR(7 DOWNTO 0)	; 
-------------------------------------------------------------------------------------
	SIGNAL out_data_arp :    STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL out_ctrl_arp :   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL out_wr_arp :  STD_LOGIC;	
    SIGNAL in_rdy_arp :  STD_LOGIC;

-------------------------------------------------------------------------------------
	SIGNAL out_data_balance :    STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL out_ctrl_balance :   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL out_wr_balance :  STD_LOGIC;	
    SIGNAL in_rdy_balance :  STD_LOGIC;
-------------------------------------------------------------------------------------
	SIGNAL out_data_router :    STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL out_ctrl_router :   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL out_wr_router :  STD_LOGIC;	
    SIGNAL in_rdy_router :  STD_LOGIC;
-----------------------------------------------------------------------------------
	 SIGNAL out_data_hello :    STD_LOGIC_VECTOR(63 DOWNTO 0);
	 SIGNAL out_ctrl_hello :   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL out_wr_hello :  STD_LOGIC;	
    SIGNAL in_rdy_hello :  STD_LOGIC;
-------------------------------------------------------------------------------------
	SIGNAL out_data_pass :    STD_LOGIC_VECTOR(63 DOWNTO 0);
	SIGNAL out_ctrl_pass :   STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL out_wr_pass :  STD_LOGIC;
    SIGNAL in_rdy_pass :  STD_LOGIC;
    SIGNAL in_rdy_0 :  STD_LOGIC;
    SIGNAL in_rdy_1 :  STD_LOGIC;
	SIGNAL in_rdy_2 :  STD_LOGIC;
	SIGNAL in_rdy_3 :  STD_LOGIC;
	SIGNAL in_rdy_4 :  STD_LOGIC;
		SIGNAL in_rdy_5 :  STD_LOGIC;
	----------------------------------
	SIGNAL in_rdy_manger : STD_LOGIC;
	SIGNAL in_rd_manger:  std_logic;	
	SIGNAL out_mac_manger:  std_logic_VECTOR(47 downto 0);
	SIGNAL out_port_manger:  std_logic_VECTOR(7 downto 0);
	SIGNAL key:  std_logic_VECTOR(11 downto 0);
	SIGNAL out_rd_rdy_manger:  std_logic	;
	----------------------------
	
	 SIGNAL out_data_arb :    STD_LOGIC_VECTOR(63 DOWNTO 0);
	 SIGNAL out_ctrl_arb :   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL out_wr_arb :  STD_LOGIC;	
    SIGNAL out_rdy_arb :  STD_LOGIC;
	 ------------------
	  SIGNAL out_data_int :    STD_LOGIC_VECTOR(63 DOWNTO 0);
	 SIGNAL out_ctrl_int :   STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL out_wr_int :  STD_LOGIC;	
    SIGNAL in_rdy_int :  STD_LOGIC;
	 
--	 
	BEGIN
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--
out_rdy_classifier <=  in_rdy_pass ;--AND in_rdy_int  and in_rdy_balance AND in_rdy_router ;--AND in_rdy_arp;--    AND in_rdy_int AND in_rdy_router;

--------------------- Classifier Port Map------------
	
	classifier_Inst :  classifier 
	GENERIC MAP(DATA_WIDTH => 64,
				CTRL_WIDTH  => 8)
	PORT MAP(
	--Input
	
	 in_data => in_data,
	 in_ctrl => in_ctrl,
     in_wr => in_wr,
	  in_rdy => in_rdy,--this is to be connected with out_rdy from the pervious module this is out put port
	---Output
	
--	out_data => out_data,
--	 out_ctrl => out_ctrl,
--    out_wr => out_wr,
--	 out_rdy =>  out_rdy ,
		 out_data => out_data_classifier,
		 out_ctrl => out_ctrl_classifier,
		 out_wr => out_wr_classifier,
		 out_rdy =>out_rdy_classifier,-- this is input port 
	--- Misc
	    dest =>dest_i,
	    reset => reset,
	    clk   => clk
	);
	
 dest_out <=  dest_i;
--------------End Classifier Port Map 
--
------------------------------Arp Top Component
--	arp_top_Ins : arp_top 
--	GENERIC MAP(DATA_WIDTH => 64,
--				CTRL_WIDTH  => 8)
--	PORT MAP(
--	  in_data => out_data_classifier ,
--	  in_ctrl => out_ctrl_classifier,
--     in_wr => out_wr_classifier,
--	  in_rdy =>in_rdy_arp,
--
--	  out_data => out_data_arp,
--	  out_ctrl => out_ctrl_arp,
--     out_wr => out_wr_arp,
--	  out_rdy =>in_rdy_0,
--	
--	 
--    --- Misc
--     en => dest_i(0),
--     reset => reset,
--     clk   => clk
--	);
--	
------	---------------Balance Component----
	
	
	balance_Inst :   balance_top 
	GENERIC MAP(DATA_WIDTH => 64,
				CTRL_WIDTH  => 8)
	PORT MAP(
	
	  in_data => out_data_classifier,
	  in_ctrl => out_ctrl_classifier,
     in_wr => out_wr_classifier,
	  in_rdy => in_rdy_balance,
	
	  out_data => out_data_balance,
	  out_ctrl => out_ctrl_balance,
     out_wr => out_wr_balance,
	  out_rdy =>in_rdy_1,
	  
	  in_next_mac =>out_mac_manger,
	  in_exit_port => out_port_manger,
      out_rd_next_mac => in_rd_manger,
	  in_next_mac_rdy =>out_rd_rdy_manger,
	  key => open,
	  
	
--	out_data => out_data,
--	 out_ctrl => out_ctrl,
--    out_wr => out_wr,
--	 out_rdy =>  out_rdy ,

	  en => dest_i(1),
     reset => reset,
     clk   => clk

	);
------	---------------Balance Component-----
	router_Inst :   router 
	GENERIC MAP(DATA_WIDTH => 64,
				CTRL_WIDTH  => 8)
	PORT MAP(
	
	 in_data => out_data_classifier,
	 in_ctrl => out_ctrl_classifier,
     in_wr => out_wr_classifier,
	 in_rdy => in_rdy_router,
	
	 out_data => out_data_router,
	 out_ctrl => out_ctrl_router,
     out_wr => out_wr_router,
	 out_rdy =>in_rdy_3,
	 en => dest_i(2),
     reset => reset,
     clk   => clk

	);
-----------------Pass Component-----
	pass_Inst :   pass 
	GENERIC MAP(DATA_WIDTH => 64,
				CTRL_WIDTH  => 8)
	PORT MAP(
	
	 in_data => out_data_classifier,
	 in_ctrl => out_ctrl_classifier,
    in_wr => out_wr_classifier,
	 in_rdy => in_rdy_pass,
	
	 out_data => out_data_pass,
	 out_ctrl => out_ctrl_pass,
    out_wr => out_wr_pass,
	 out_rdy =>in_rdy_5,
--	 out_data => out_data,
--	 out_ctrl => out_ctrl,
--	 out_wr => out_wr,
--	 out_rdy =>  out_rdy ,
	 en =>dest_i(7),
     reset => reset,
     clk   => clk

	);
--	----------------------------------------------
------	----------------Pass Component-----
------	
------				
	manager_Inst :   manager 
	GENERIC MAP(DATA_WIDTH => 64,
				CTRL_WIDTH  => 8)
	PORT MAP(
	
	 in_data => out_data_classifier,
	 in_ctrl => out_ctrl_classifier,
     in_wr => out_wr_classifier,
	 in_rdy => in_rdy_manger,
	
	  in_rd => in_rd_manger,
	  in_key => (OTHERS=>'0'),
	  out_mac => out_mac_manger,
	  out_port=>out_port_manger,
     out_rd_rdy => out_rd_rdy_manger,
	 out_rdy =>'1',
	 en => dest_i(6),
     reset => reset,
     clk   => clk

	);
--------------------------Hello----
------	Hello_Ist :   hello_pkt
------	GENERIC MAP(DATA_WIDTH => 64,
------				CTRL_WIDTH  => 8)
------	PORT MAP(
------
------			  tx_in_data   => out_data_arb,
------			  tx_in_ctrl   => out_ctrl_arb,
------			  tx_in_wr     => out_wr_arb,
------			  rx_in_data   => out_data_classifier,
------			  rx_in_ctrl   => out_ctrl_classifier,
------			  rx_in_wr     => out_wr_classifier,
------
------			  out_data   	=>	out_data_hello,
------			  out_ctrl   	=> out_ctrl_hello,
------			  out_wr     	=> out_wr_hello,
------		--	SIGNAL out_cnt : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
------		--	SIGNAL cnt_enable :OUT STD_LOGIC;
------			  out_rdy     =>in_rdy_2,
------			  in_rdy      =>in_rdy_hello,
------			  reset      => reset ,
------			  clk        => clk
------	);
------	----------------------------------------
--		int2ext_top_Inst :   int2ext_top 
--		GENERIC MAP(DATA_WIDTH => 64,
--				CTRL_WIDTH  => 8)
--	PORT MAP(
--	
--		 in_data => out_data_classifier,
--	    in_ctrl => out_ctrl_classifier,
--       in_wr => out_wr_classifier,
--		 in_rdy  => in_rdy_int,
--		
--		 out_data  =>out_data_int,
--		 out_ctrl  =>out_ctrl_int,
--		 out_wr  => out_wr_int,
--		 out_rdy  =>in_rdy_4,
----		 	out_data => out_data,
----			out_ctrl => out_ctrl,
----			out_wr => out_wr,
----			out_rdy =>  out_rdy ,
--		 en =>dest_i(4),
--		 reset => reset ,
--		 clk    =>clk
--
--	);
----
--	-------- Classifier Arbiter -----------
	 classifier_arbiter_Inst : classifier_arbiter 
	GENERIC MAP(DATA_WIDTH => 64,
				CTRL_WIDTH  => 8)
	PORT MAP(
	
	 out_data => out_data_arb,
	 out_ctrl =>out_ctrl_arb,
     out_wr =>out_wr_arb,
	 out_rdy =>out_rdy_arb,---this is input from the next mudlue
	
	  in_data_0 =>out_data_arp,
	  in_ctrl_0 =>out_ctrl_arp,
     in_wr_0 => '0',--out_wr_arp,--out_wr_arp,
	  in_rdy_0 =>in_rdy_0,
	
	 in_data_1 =>(others=>'0'),
	 in_ctrl_1 =>(others=>'0'),
    in_wr_1 => '0',
	 in_rdy_1 =>open,
	 
	 in_data_2 =>out_data_hello,
	 in_ctrl_2 =>out_ctrl_hello,
     in_wr_2 => '0',--out_wr_hello,--out_wr_balance,
	  in_rdy_2 =>in_rdy_2,
		
	 in_data_3 =>out_data_router,
	 in_ctrl_3 =>out_ctrl_router,
    in_wr_3 => out_wr_router,--out_wr_router,--out_wr_router,
	 in_rdy_3 =>in_rdy_3,
	
	 in_data_4 =>out_data_int,
	 in_ctrl_4 =>out_ctrl_int,
    in_wr_4 => out_wr_int,--out_wr_balance,
	 in_rdy_4 =>in_rdy_4,
	 
	 in_data_5 =>out_data_pass,
	 in_ctrl_5 =>out_ctrl_pass,
    in_wr_5 => out_wr_pass,
	 in_rdy_5 =>in_rdy_5,
	 
	 
	 
	  in_data_6 =>out_data_balance,
	  in_ctrl_6 =>out_ctrl_balance,
     in_wr_6 => out_wr_balance,
	  in_rdy_6 =>in_rdy_1,

	 
		 
--		 in_data_6 =>out_data_classifier,
--	  in_ctrl_6 =>out_ctrl_classifier,
--     in_wr_6 => out_wr_classifier,
--	  in_rdy_6 =>in_rdy_1,
	 
	 in_data_7 =>(others=>'0'),
	 in_ctrl_7 =>(others=>'0'),
    in_wr_7 => '0',
	 in_rdy_7 =>open,
	
     reset => reset,
     clk   => clk

	);


    out_data <= out_data_arb;
	 out_ctrl <=out_ctrl_arb;
    out_wr <=out_wr_arb;
	 out_rdy_arb <= out_rdy ;---this is input from the next mudlue
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

	END behavior;