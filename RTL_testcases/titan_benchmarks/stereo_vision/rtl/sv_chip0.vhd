-- Ahmad Darabiha
-- last updated Aug, 2002

-- this is the design for chip#0 of 
-- the stereo vision system.
-- this is the last stage which interpolates the results of correlation 
-- and after LPF it takes the Max and send the final results to chip #3 to
-- be displayed on the monitor.
 
library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sv_chip0 is port(
	tm3_clk_v0: in std_logic;
	tm3_sram_data : inout std_logic_vector(63 downto 0);
	tm3_sram_addr : out std_logic_vector(18 downto 0);
	tm3_sram_we : out std_logic_vector(7 downto 0);
	tm3_sram_oe : out std_logic_vector(1 downto 0);
	tm3_sram_adsp : out std_logic;
	bus_word_1_1to0: in std_logic_vector(7 downto 0);
	bus_word_2_1to0: in std_logic_vector(7 downto 0);
	bus_word_3_1to0: in std_logic_vector(7 downto 0);
	bus_word_4_1to0: in std_logic_vector(7 downto 0);
	bus_word_5_1to0: in std_logic_vector(7 downto 0);
	bus_word_6_1to0: in std_logic_vector(7 downto 0);
	counter_out_1to0: in std_logic_vector(2 downto 0);
	vidin_new_data_fifo: in std_logic;
	vidin_rgb_reg_fifo_left:in std_logic_vector(7 downto 0);
	vidin_rgb_reg_fifo_right:in std_logic_vector(7 downto 0);
	vidin_addr_reg_2to0: in std_logic_vector(3 downto 0);
	v_nd_s1_left_2to0: out std_logic;     
	v_nd_s2_left_2to0 : out std_logic;
	v_nd_s4_left_2to0 : out std_logic;
	v_d_reg_s1_left_2to0 : out std_logic_vector(7 downto 0);    
	v_d_reg_s2_left_2to0 :out std_logic_vector(7 downto 0);
	v_d_reg_s4_left_2to0 :out std_logic_vector(7 downto 0);
	v_nd_s1_right_2to0: out std_logic;     
	v_nd_s2_right_2to0 : out std_logic;
	v_nd_s4_right_2to0 : out std_logic;
	v_d_reg_s1_right_2to0 : out std_logic_vector(7 downto 0);    
	v_d_reg_s2_right_2to0 :out std_logic_vector(7 downto 0);
	v_d_reg_s4_right_2to0 :out std_logic_vector(7 downto 0);
	tm3_vidout_red : out std_logic_vector( 9 downto 0);
	tm3_vidout_green : out std_logic_vector( 9 downto 0);
	tm3_vidout_blue : out std_logic_vector( 9 downto 0);
 	tm3_vidout_clock : out std_logic;
	tm3_vidout_hsync : out std_logic;
	tm3_vidout_vsync : out std_logic;
	tm3_vidout_blank : out std_logic;
	x_in: in std_logic_vector(15 downto 0);
	y_in: in std_logic_vector(15 downto 0);
	depth_out : out std_logic_vector(15 downto 0));
end sv_chip0;

architecture arch_sv_chip0 of sv_chip0 is
	signal x_reg_l,x_reg_r,y_reg_up,y_reg_dn : std_logic_vector(15 downto 0);
	signal depth_out_reg : std_logic_vector(7 downto 0);
	signal horiz: std_logic_vector(9 downto 0);
	signal vert: std_logic_vector(9 downto 0);
	signal vidin_data_buf_sc_1 : std_logic_vector(63 downto 0);
	signal vidin_data_buf_2_sc_1 : std_logic_vector(55 downto 0);
	signal vidin_addr_buf_sc_1 : std_logic_vector(18 downto 0);
	signal vidout_buf : std_logic_vector(63 downto 0);
	signal vidin_data_buf_sc_2 : std_logic_vector(63 downto 0);
	signal vidin_data_buf_2_sc_2 : std_logic_vector(55 downto 0);
	signal vidin_addr_buf_sc_2 : std_logic_vector(18 downto 0);
	signal vidin_data_buf_sc_4 : std_logic_vector(63 downto 0);
	signal vidin_data_buf_2_sc_4 : std_logic_vector(55 downto 0);
	signal vidin_addr_buf_sc_4 : std_logic_vector(18 downto 0);
	signal video_state : std_logic;
	signal vidin_new_data_scld_1_2to3_left_reg: std_logic;
	signal vidin_data_reg_scld_1_2to3_left_reg: std_logic_vector(7 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_reg: std_logic_vector(7 downto 0);
	signal vidin_new_data_scld_2_2to3_left_reg: std_logic;
	signal vidin_data_reg_scld_2_2to3_left_reg: std_logic_vector(7 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_reg: std_logic_vector(7 downto 0);
	signal vidin_new_data_scld_4_2to3_left_reg: std_logic;
	signal vidin_data_reg_scld_4_2to3_left_reg: std_logic_vector(7 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_reg: std_logic_vector(7 downto 0);
	
	signal vidin_addr_reg_2to3_reg: std_logic_vector(18 downto 0);
	
	signal vidin_addr_reg: std_logic_vector(18 downto 0);
	signal svid_comp_switch_2to3: std_logic;
	signal vidin_new_data_scld_1_1to0: std_logic;
	signal vidin_new_data_scld_2_1to0: std_logic;
	signal vidin_new_data_scld_4_1to0: std_logic;

	signal v_corr_20: type_array_8_20;
	signal v_corr_10: type_array_8_10;
	signal v_corr_05: type_array_8_5;

	signal v_corr_20_fltr: type_array_8_20;
	signal v_corr_10_fltr: type_array_8_10;
	signal v_corr_05_fltr: type_array_8_5;

	signal v_corr_20_fltr_x: type_array_8_20;
	signal v_corr_10_fltr_x: type_array_8_10;
	signal v_corr_05_fltr_x: type_array_8_5;

	signal v_corr_20_fltr_h: type_array_8_20;
	signal v_corr_10_fltr_h: type_array_8_10;
	signal v_corr_05_fltr_h: type_array_8_5;

	signal v_corr_20_fifo: type_array_8_20;
	signal v_corr_10_fifo: type_array_9_20;

	signal v_corr_20_fifo_x: type_array_8_20;
	signal v_corr_10_fifo_x: type_array_9_20;
	
	signal qs_4_out : type_array_16_20;
	signal qs_2_out : type_array_16_20;

	signal qs_4_out_x : type_array_16_20;
	signal qs_2_out_x : type_array_16_20;

	signal rdy_4_out :std_logic;
	signal rdy_2_out :std_logic;

	signal max_data_out: std_logic_vector(7 downto 0);
	signal max_indx_out: std_logic_vector(4 downto 0);

	signal v_nd_s1_left_2to0_tmp: std_logic;     
	signal v_nd_s2_left_2to0_tmp : std_logic;
	signal v_nd_s4_left_2to0_tmp : std_logic;
	signal v_d_reg_s1_left_2to0_tmp : std_logic_vector(7 downto 0);    
	signal v_d_reg_s2_left_2to0_tmp : std_logic_vector(7 downto 0);
	signal v_d_reg_s4_left_2to0_tmp : std_logic_vector(7 downto 0);
	signal v_d_reg_s1_left_2to0_fifo_tmp : std_logic_vector(7 downto 0);    
	signal v_d_reg_s2_left_2to0_fifo_tmp : std_logic_vector(7 downto 0);
	signal v_d_reg_s4_left_2to0_fifo_tmp : std_logic_vector(7 downto 0);
	signal v_nd_s1_right_2to0_tmp: std_logic;     
	signal v_nd_s2_right_2to0_tmp : std_logic;
	signal v_nd_s4_right_2to0_tmp : std_logic;
	signal v_d_reg_s1_right_2to0_tmp : std_logic_vector(7 downto 0);    
	signal v_d_reg_s2_right_2to0_tmp : std_logic_vector(7 downto 0);
	signal v_d_reg_s4_right_2to0_tmp : std_logic_vector(7 downto 0);
	signal v_d_reg_s1_right_2to0_fifo_tmp : std_logic_vector(7 downto 0);    
	signal v_d_reg_s2_right_2to0_fifo_tmp : std_logic_vector(7 downto 0);
	signal v_d_reg_s4_right_2to0_fifo_tmp : std_logic_vector(7 downto 0);

	signal comb_out : type_array_11_20;

	
	component combine_res is 
		port(
		clk : in std_logic;
		wen: in std_logic;
		din_1: in std_logic_vector(7 downto 0);  -- scale_1 is 8 bite wide
		din_2: in std_logic_vector(8 downto 0); -- scale 2 and 4 are 9 bit wide
		din_3: in std_logic_vector(8 downto 0);
		dout: out std_logic_vector(10 downto 0)); 
	end component;

	component v_fltr_496 generic(vert_length : integer);
		port(
    	tm3_clk_v0 : in std_logic;
		vidin_new_data : in std_logic;
		vidin_in : in std_logic_vector(7 downto 0);
		vidin_out : out std_logic_vector(7 downto 0));
	end component;


	component v_fltr_316 generic(vert_length : integer);
		port(
    	tm3_clk_v0 : in std_logic;
		vidin_new_data : in std_logic;
		vidin_in : in std_logic_vector(7 downto 0);
		vidin_out : out std_logic_vector(7 downto 0));
	end component;

	component lp_fltr_v1 port(
		clk: in std_logic;
		din: in std_logic_vector(fltr_din_w-1 downto 0);
		dout_1: out std_logic_vector(fltr_din_w-1 downto 0);
		dout_2: out std_logic_vector(fltr_din_w-1 downto 0);
		nd: in std_logic);
	end component;

	component lp_fltr_v2 port(
		clk: in std_logic;
		din: in std_logic_vector(fltr_din_w-1 downto 0);
		dout_1: out std_logic_vector(fltr_din_w-1 downto 0);
		dout_2: out std_logic_vector(fltr_din_w-1 downto 0);
		nd: in std_logic);
	end component;
	
	component lp_fltr_v4 port(
		clk: in std_logic;
		din: in std_logic_vector(fltr_din_w-1 downto 0);
		dout_1: out std_logic_vector(fltr_din_w-1 downto 0);
		dout_2: out std_logic_vector(fltr_din_w-1 downto 0);
		nd: in std_logic);
	end component;

	component scaler port(
		tm3_clk_v0: in std_logic;
		vidin_new_data: in std_logic;
		vidin_rgb_reg: in std_logic_vector(7 downto 0);
		vidin_addr_reg: in std_logic_vector(3 downto 0);
		vidin_new_data_scld_1: out std_logic;
    	vidin_new_data_scld_2: out std_logic;
  		vidin_new_data_scld_4: out std_logic;
		vidin_gray_scld_1:out std_logic_vector(7 downto 0);
		vidin_gray_scld_2:out std_logic_vector(7 downto 0);
		vidin_gray_scld_4:out std_logic_vector(7 downto 0));
	end component;
	


	component wrapper_qs_intr_5_20 is 
	port(
		clk : in std_logic;
		din: in type_array_8_5;
		wen_1:in std_logic;
		wen_4: in std_logic;
		addrin: in std_logic_vector(18 downto 0);
		dout: out type_array_16_20;
		rdy : out std_logic);
	end component;

	component wrapper_qs_intr_10_20 is 
	port(
		clk : in std_logic;
		din: in type_array_8_10;
		wen_1:in std_logic;
		wen_4: in std_logic;
		addrin: in std_logic_vector(18 downto 0);
		dout: out type_array_16_20;
		rdy : out std_logic);
	end component;


	component find_max port(
		clk: in std_logic;
		wen: in std_logic;
		d_in: type_array_11_20;
		d_out : out std_logic_vector(7 downto 0);
		indx_out : out std_logic_vector(4 downto 0));
	end component;

	component lp_fltr
		port(
		clk: in std_logic;
		din: in std_logic_vector(fltr_din_w-1 downto 0);
		dout: out std_logic_vector(fltr_din_w-1 downto 0);
		ce: in std_logic);
	end component;

	------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
	component my_fifo_8b
		port (
		CLK: IN std_logic;
		D: IN std_logic_VECTOR(7 downto 0);
		Q: OUT std_logic_VECTOR(7 downto 0);
		CE: IN std_logic);
	end component;

	-- Synplicity black box declaration

	-- COMP_TAG_END ------ End COMPONENT Declaration ------------

	------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
	component my_fifo_9b
		port (
		CLK: IN std_logic;
		D: IN std_logic_VECTOR(8 downto 0); --(7 downto 0);
		Q: OUT std_logic_VECTOR(8 downto 0); --(7 downto 0);
		CE: IN std_logic);
	end component;

	-- Synplicity black box declaration

	-- COMP_TAG_END ------ End COMPONENT Declaration ------------



	component port_bus_1to0_1 generic( corr_res_w:integer);
		port(
		clk: in std_logic;
		vidin_addr_reg: out std_logic_vector(18 downto 0);
		svid_comp_switch : out std_logic;
		vidin_new_data_scld_1_1to0: out std_logic;
		v_corr_20: out type_array_8_20;
		vidin_new_data_scld_2_1to0: out std_logic;
		v_corr_10: out type_array_8_10;
		vidin_new_data_scld_4_1to0: out std_logic;
		v_corr_05: out type_array_8_5;
		bus_word_1: in std_logic_vector(7 downto 0);
		bus_word_2: in std_logic_vector(7 downto 0);
		bus_word_3: in std_logic_vector(7 downto 0);
		bus_word_4: in std_logic_vector(7 downto 0);
		bus_word_5: in std_logic_vector(7 downto 0);
		bus_word_6: in std_logic_vector(7 downto 0);
		counter_out: in std_logic_vector(2 downto 0));
	end component;

begin

-------------------------------------------------------------------------------
--------------------   Delay Line for alignment in the   ----------------------
----------------------   first atage after scaler   ---------------------------
-------------------------------------------------------------------------------

	scaler_inst_left: scaler port map(tm3_clk_v0,
					vidin_new_data_fifo,
					vidin_rgb_reg_fifo_left,
					vidin_addr_reg_2to0,
					v_nd_s1_left_2to0_tmp,     
					v_nd_s2_left_2to0_tmp,
					v_nd_s4_left_2to0_tmp,
					v_d_reg_s1_left_2to0_tmp,    
					v_d_reg_s2_left_2to0_tmp,
					v_d_reg_s4_left_2to0_tmp);

	scaler_inst_right: scaler port map(tm3_clk_v0,
					vidin_new_data_fifo,
					vidin_rgb_reg_fifo_right,
					vidin_addr_reg_2to0,
					v_nd_s1_right_2to0_tmp,  	
					v_nd_s2_right_2to0_tmp,
					v_nd_s4_right_2to0_tmp,
					v_d_reg_s1_right_2to0_tmp,  
					v_d_reg_s2_right_2to0_tmp,
					v_d_reg_s4_right_2to0_tmp);

	v_fltr_496_l_inst: v_fltr_496 generic map(12)
					port map(
						tm3_clk_v0,
						v_nd_s1_left_2to0_tmp,
						v_d_reg_s1_left_2to0_tmp,
						v_d_reg_s1_left_2to0_fifo_tmp);

	v_fltr_496_r_inst: v_fltr_496 generic map(12)
					port map(
						tm3_clk_v0,
						v_nd_s1_right_2to0_tmp,
						v_d_reg_s1_right_2to0_tmp,
						v_d_reg_s1_right_2to0_fifo_tmp);

	v_fltr_316_l_inst: v_fltr_316 generic map(4)
					port map(
						tm3_clk_v0,
						v_nd_s2_left_2to0_tmp,
						v_d_reg_s2_left_2to0_tmp,
						v_d_reg_s2_left_2to0_fifo_tmp);

	v_fltr_316_r_inst: v_fltr_316 generic map(4)
					port map(
						tm3_clk_v0,
						v_nd_s2_right_2to0_tmp,
						v_d_reg_s2_right_2to0_tmp,
						v_d_reg_s2_right_2to0_fifo_tmp);

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


port_bus_1to0_1_inst: port_bus_1to0_1 generic map(8)
	port map(
		tm3_clk_v0,
		vidin_addr_reg,
		svid_comp_switch_2to3,
		vidin_new_data_scld_1_1to0,
		v_corr_20,
		vidin_new_data_scld_2_1to0,
		v_corr_10,
		vidin_new_data_scld_4_1to0,
		v_corr_05,
		bus_word_1_1to0,
		bus_word_2_1to0,
		bus_word_3_1to0,
		bus_word_4_1to0,
		bus_word_5_1to0,
		bus_word_6_1to0,
		counter_out_1to0);



----------------------------------------------------------------------------
---------------- LP Horiz. fltr of the correlation results ----------------- 
----------------------------------------------------------------------------

	gen_fir_1: for i in 0 to 20 generate
					inst_fir_1: lp_fltr
								port map(
										tm3_clk_v0,
										v_corr_20(i),
										v_corr_20_fltr_h(i),
										vidin_new_data_scld_1_1to0);
	end generate;


	
	gen_fir_2: for i in 0 to 10 generate
					inst_fir_2: lp_fltr
								port map(
										tm3_clk_v0,
										v_corr_10(i),
										v_corr_10_fltr_h(i),
										vidin_new_data_scld_2_1to0);
	end generate;


		

	gen_fir_4: for i in 0 to 5 generate
					inst_fir_4: lp_fltr
								port map(
										tm3_clk_v0,
										v_corr_05(i),
										v_corr_05_fltr_h(i),
										vidin_new_data_scld_4_1to0);
	end generate;
	
----------------------------------------------------------------------------
---------------- LP Vert. fltr of the correlation results ----------------- 
----------------------------------------------------------------------------
	gen_fir_1_v0: for i in 0 to 20 generate
				inst_fir_v1: lp_fltr_v1
								port map(
										tm3_clk_v0,
										v_corr_20_fltr_h(i),
										v_corr_20_fltr_x(i),
										v_corr_20_fltr(i),
										vidin_new_data_scld_1_1to0);
					
	end generate;

	gen_fir_1_v1: for i in 0 to 10 generate
				inst_fir_v2: lp_fltr_v2
								port map(
										tm3_clk_v0,
										v_corr_10_fltr_h(i),
										v_corr_10_fltr_x(i),
										v_corr_10_fltr(i),
										vidin_new_data_scld_2_1to0);
	end generate;

	gen_fir_1_v2: for i in 0 to 5 generate
				inst_fir_v4: lp_fltr_v4
								port map(
										tm3_clk_v0,
										v_corr_05_fltr_h(i),
										v_corr_05_fltr_x(i),
										v_corr_05_fltr(i),
										vidin_new_data_scld_4_1to0);
	end generate;

	
----------------------------------------------------------------------------
-------------- back interpolation from scale 2 and 4 to scale 1 ------------
----------------------------------------------------------------------------

wrapper_qs_intr_inst_5: wrapper_qs_intr_5_20
	port map(
		tm3_clk_v0,
		v_corr_05_fltr,
		vidin_new_data_scld_1_1to0,
		vidin_new_data_scld_4_1to0,
		vidin_addr_reg,
		qs_4_out,
		rdy_4_out);

wrapper_qs_intr_inst_10: wrapper_qs_intr_10_20
	port map(
		tm3_clk_v0,
		v_corr_10_fltr,
		vidin_new_data_scld_1_1to0,
		vidin_new_data_scld_2_1to0,
		vidin_addr_reg,
		qs_2_out,
		rdy_2_out);


wrapper_qs_intr_inst_5_more: wrapper_qs_intr_5_20
	port map(
		tm3_clk_v0,
		v_corr_05_fltr_x,
		vidin_new_data_scld_1_1to0,
		vidin_new_data_scld_4_1to0,
		vidin_addr_reg,
		qs_4_out_x,
		open);

wrapper_qs_intr_inst_10_more: wrapper_qs_intr_10_20
	port map(
		tm3_clk_v0,
		v_corr_10_fltr_x,
		vidin_new_data_scld_1_1to0,
		vidin_new_data_scld_2_1to0,
		vidin_addr_reg,
		qs_2_out_x,
		open);

------------------------------------------------------------------------------
--------------------------- end of back interpolation ------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-----------------  horiz. delay unit for scale 1 and 2 to allign with sc_4 ---
------------------------------------------------------------------------------

	gen_1_1 : for i in 0 to 20 generate
				ints_fifo_1_gen_1 : my_fifo_8b 
								port map(
									tm3_clk_v0,
									v_corr_20_fltr(i),
									v_corr_20_fifo(i),
									rdy_4_out);
	end generate;



	gen_2_1 : for i in 0 to 20 generate
				ints_fifo_2_gen_1 : my_fifo_9b 
								port map(
									tm3_clk_v0,
									qs_2_out(i)(8 downto 0), --(8 downto 1),
									v_corr_10_fifo(i),
									rdy_4_out);
	end generate;


--------------------------- end of horiz. delay units ----------------------
----------------------------------------------------------------------------

-------------------------------------------------------------------------------------------
-----------------------------      combining scales ---------------------------------------

	gen_combine : for i in 0 to 20 generate
		combine_res_inst : combine_res
				port map(
					tm3_clk_v0,
					rdy_4_out,
					v_corr_20_fifo(i),
					v_corr_10_fifo(i),
					qs_4_out(i)(8 downto 0),
					comb_out(i));	
	end generate;
--------------------------------   end of combining ---------------------------------------
-------------------------------------------------------------------------------------------



find_max_inst: find_max 
	port map(
		tm3_clk_v0,
		rdy_4_out,
		comb_out,
		max_data_out,
		max_indx_out);

	

	-------------------------------------------------------------------------------------------
	------------------------------ writing data to SRAM ---------------------------------------

	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 = '1') then		
			vidin_new_data_scld_1_2to3_left_reg <= rdy_4_out; --vidin_new_data_scld_1_1to0;
			vidin_new_data_scld_2_2to3_left_reg <= rdy_4_out; --vidin_new_data_scld_2_1to0;
			vidin_new_data_scld_4_2to3_left_reg <= rdy_4_out; --vidin_new_data_scld_4_1to0;
			vidin_data_reg_scld_1_2to3_left_reg <= v_corr_20_fifo(0);--qs_4_out(1)(8 downto 1);  --(0);
			vidin_data_reg_scld_1_2to3_right_reg <= v_corr_10_fifo(0)(8 downto 1); --comb_out(0)(8 downto 1); --v_corr_20_fifo(5); --(5);
			vidin_data_reg_scld_2_2to3_left_reg <=  qs_4_out(0)(8 downto 1); --comb_out(1)(8 downto 1); --qs_2_out(0)(8 downto 1); --v_corr_10(0);
			vidin_data_reg_scld_2_2to3_right_reg <= comb_out(0)(8 downto 1);--"000" & max_indx_out; --qs_2_out(5)(8 downto 1);  --v_corr_10(5);
			vidin_data_reg_scld_4_2to3_left_reg <= comb_out(4)(8 downto 1);--qs_4_out(1)(8 downto 1); --v_corr_05(0);
			vidin_data_reg_scld_4_2to3_right_reg <= max_indx_out & "000"; --"000" & max_indx_out; --v_corr_10_fifo(4)(8 downto 1);--comb_out(10)(10 downto 3); --qs_4_out(5)(8 downto 1); --v_corr_05(5);
		
	

			if (vidin_addr_reg(8 downto 0) >= "001001000") then
				vidin_addr_reg_2to3_reg <= vidin_addr_reg - "0000000000001001000";  -- addr-72
			else
				vidin_addr_reg_2to3_reg <= vidin_addr_reg + "0000000000100100000";  -- addr-72+360
			end if;

		end if;
	end process;
		
	------------------------------- end of witing to SRAM -------------------------------------
	-------------------------------------------------------------------------------------------
	
	-------------------------------------------------------------------------------------------
    ------------------------       sending back the delayed signal to chip 2 ------------------
	

	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 = '1') then		
	
			v_nd_s1_left_2to0 <= v_nd_s1_left_2to0_tmp;     
			v_nd_s2_left_2to0 <= v_nd_s2_left_2to0_tmp;
			v_nd_s4_left_2to0 <= v_nd_s4_left_2to0_tmp;
		
			v_nd_s1_right_2to0 <= v_nd_s1_right_2to0_tmp;  	
			v_nd_s2_right_2to0 <= v_nd_s2_right_2to0_tmp;
			v_nd_s4_right_2to0 <= v_nd_s4_right_2to0_tmp;
		
			if v_nd_s1_left_2to0_tmp = '1' then
					v_d_reg_s1_left_2to0 <= v_d_reg_s1_left_2to0_fifo_tmp;
					v_d_reg_s1_right_2to0 <= v_d_reg_s1_right_2to0_fifo_tmp;
			end if;

			if v_nd_s2_left_2to0_tmp = '1' then
					v_d_reg_s2_left_2to0 <= v_d_reg_s2_left_2to0_fifo_tmp;
					v_d_reg_s2_right_2to0 <= v_d_reg_s2_right_2to0_fifo_tmp;
			end if;

			if v_nd_s4_left_2to0_tmp = '1' then
					v_d_reg_s4_left_2to0 <= v_d_reg_s4_left_2to0_tmp;
					v_d_reg_s4_right_2to0 <= v_d_reg_s4_right_2to0_tmp;
			end if;
		end if;
	end process;
		
	-------------------------------  end of sending back ---------------------------------------
	--------------------------------------------------------------------------------------------

	tm3_vidout_clock <= not(video_state);

	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 = '1') then
			x_reg_l <= x_in;
			y_reg_up <= y_in;
			x_reg_r <= x_in + 8;
			y_reg_dn <= y_in +8;
			depth_out <= "00000000" & depth_out_reg;

			video_state <= not(video_state);
			
			if video_state = '0' then
				if horiz = 800 then
					horiz <= "0000000000";
					if vert = 525 then
						vert <= "0000000000";
					else
						vert <= vert + 1;
					end if;
				else
					horiz <= horiz + 1;
				end if;
				
				if ((vert >= 491) AND (vert <= 493)) then
					tm3_vidout_vsync <= '1';
				else
					tm3_vidout_vsync <= '0';
				end if;
				if ((horiz >= 664) AND (horiz <= 760)) then
					tm3_vidout_hsync <= '1';
				else
					tm3_vidout_hsync <= '0';
				end if;
				if ((horiz < 640) AND (vert < 480)) then
					tm3_vidout_blank <= '1';
				else
					tm3_vidout_blank <= '0';
				end if;
				
	
				tm3_sram_adsp <= '1';
				tm3_sram_we <= "11111111";
				tm3_sram_data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
				--tm3_sram_oe <= "11";
				case horiz(2 downto 0) is 
			    when "000" => 
			        	tm3_sram_oe <= "10";
					--if (horiz(9 downto 3) = x_reg(9 downto 3)) and (vert(9 downto 3) = y_reg(9 downto 3)) then 					
					if (horiz <= x_reg_r)and(horiz >= x_reg_l)and(vert <= y_reg_dn)and(vert >= y_reg_up) then 					
						tm3_vidout_red <= "1111111111"; 
						tm3_vidout_green <= "0000000000"; 
						tm3_vidout_blue <= "0000000000"; 
						depth_out_reg <= vidout_buf(15 downto 8);
					else 
						tm3_vidout_red <= vidout_buf(15 downto 8) & "00";
						tm3_vidout_green <= vidout_buf(15 downto 8) & "00";
						tm3_vidout_blue <= vidout_buf(15 downto 8) & "00";

					end if;

				when "001" => 
					tm3_sram_oe <= "10";
					--if (horiz(9 downto 3) = x_reg(9 downto 3)) and (vert(9 downto 3) = y_reg(9 downto 3)) then 					
					if (horiz <= x_reg_r)and(horiz >= x_reg_l)and(vert <= y_reg_dn)and(vert >= y_reg_up) then 					
						tm3_vidout_red <= "1111111111"; 
				        tm3_vidout_green <= "0000000000"; 
						tm3_vidout_blue <= "0000000000"; 
						depth_out_reg <= vidout_buf(23 downto 16);
					else 
						tm3_vidout_red <= vidout_buf(23 downto 16) & "00";
				        tm3_vidout_green <= vidout_buf(23 downto 16) & "00";
						tm3_vidout_blue <= vidout_buf(23 downto 16) & "00";
						
					end if;

				when "010" => 
					tm3_sram_oe <= "10";
					--if (horiz(9 downto 3) = x_reg(9 downto 3)) and (vert(9 downto 3) = y_reg(9 downto 3)) then 					
					if (horiz <= x_reg_r)and(horiz >= x_reg_l)and(vert <= y_reg_dn)and(vert >= y_reg_up) then 					
						tm3_vidout_red <= "1111111111"; 
				        tm3_vidout_green <= "0000000000";
						tm3_vidout_blue <= "0000000000";
						depth_out_reg <= vidout_buf(31 downto 24);
					
					else 
						tm3_vidout_red <= vidout_buf(31 downto 24) & "00";
				        tm3_vidout_green <= vidout_buf(31 downto 24) & "00";
						tm3_vidout_blue <= vidout_buf(31 downto 24) & "00";
					end if;
				
				when "011" => 
					tm3_sram_oe <= "10";
					--if (horiz(9 downto 3) = x_reg(9 downto 3)) and (vert(9 downto 3) = y_reg(9 downto 3)) then 					
					if (horiz <= x_reg_r)and(horiz >= x_reg_l)and(vert <= y_reg_dn)and(vert >= y_reg_up) then 					
						tm3_vidout_red <= "1111111111"; 
				        tm3_vidout_green <= "0000000000";
						tm3_vidout_blue <= "0000000000";
						depth_out_reg <= vidout_buf(39 downto 32);

					else 
						tm3_vidout_red <= vidout_buf(39 downto 32) & "00";
				        tm3_vidout_green <= vidout_buf(39 downto 32) & "00";
						tm3_vidout_blue <= vidout_buf(39 downto 32) & "00";
					end if;
				
				when "100" => 
					tm3_sram_oe <= "10";
					--if (horiz(9 downto 3) = x_reg(9 downto 3)) and (vert(9 downto 3) = y_reg(9 downto 3)) then 					
					if (horiz <= x_reg_r)and(horiz >= x_reg_l)and(vert <= y_reg_dn)and(vert >= y_reg_up) then 					
						tm3_vidout_red <= "1111111111"; 
				        tm3_vidout_green <= "0000000000";
						tm3_vidout_blue <= "0000000000";
						depth_out_reg <= vidout_buf(47 downto 40);

					else 
						tm3_vidout_red <= vidout_buf(47 downto 40) & "00";
				        tm3_vidout_green <= vidout_buf(47 downto 40) & "00";
						tm3_vidout_blue <= vidout_buf(47 downto 40) & "00";
					end if;
				
				when "101" => 
					tm3_sram_oe <= "10";
					--if (horiz(9 downto 3) = x_reg(9 downto 3)) and (vert(9 downto 3) = y_reg(9 downto 3)) then 					
					if (horiz <= x_reg_r)and(horiz >= x_reg_l)and(vert <= y_reg_dn)and(vert >= y_reg_up) then 					
						tm3_vidout_red <= "1111111111"; 
				        tm3_vidout_green <= "0000000000";
						tm3_vidout_blue <= "0000000000";
						depth_out_reg <= vidout_buf(55 downto 48);

					else 
						tm3_vidout_red <= vidout_buf(55 downto 48) & "00";
				        tm3_vidout_green <= vidout_buf(55 downto 48) & "00";
						tm3_vidout_blue <= vidout_buf(55 downto 48) & "00";
					end if;
					
				when "110" => 
					tm3_sram_oe <= "10";
					--if (horiz(9 downto 3) = x_reg(9 downto 3)) and (vert(9 downto 3) = y_reg(9 downto 3)) then 					
					if (horiz <= x_reg_r)and(horiz >= x_reg_l)and(vert <= y_reg_dn)and(vert >= y_reg_up) then 					
						tm3_vidout_red <= "1111111111"; 
				        tm3_vidout_green <= "0000000000"; 
						tm3_vidout_blue <= "0000000000";
						depth_out_reg <= vidout_buf(63 downto 56);

					else 
						tm3_vidout_red <= vidout_buf(63 downto 56) & "00";
				        tm3_vidout_green <= vidout_buf(63 downto 56) & "00";
						tm3_vidout_blue <= vidout_buf(63 downto 56) & "00";
					end if;
				
				when "111" => 
					tm3_sram_oe <= "11";
					--if (horiz(9 downto 3) = x_reg(9 downto 3)) and (vert(9 downto 3) = y_reg(9 downto 3)) then 					
					if (horiz <= x_reg_r)and(horiz >= x_reg_l)and(vert <= y_reg_dn)and(vert >= y_reg_up) then 					
						tm3_vidout_red <= "1111111111"; 
				        tm3_vidout_green <= "0000000000";
						tm3_vidout_blue <= "0000000000";
						depth_out_reg <= vidout_buf(7 downto 0);

					else 
						tm3_vidout_red <= vidout_buf(7 downto 0) & "00";
				        tm3_vidout_green <= vidout_buf(7 downto 0) & "00";
						tm3_vidout_blue <= vidout_buf(7 downto 0) & "00";
					end if;
 
				end case;	
			
			else
				tm3_sram_adsp <= '0';
				
				case horiz(2 downto 0) is
					when "000" =>
					--	vidout_buf <= tm3_sram_data;
						tm3_sram_addr <= vidin_addr_buf_sc_2;
						tm3_sram_we <= "00000000";
						tm3_sram_oe <= "11";
						tm3_sram_data <= vidin_data_buf_sc_2;
				
					when "100" =>
					--	vidout_buf <= tm3_sram_data;
						tm3_sram_addr <= vidin_addr_buf_sc_4;
						tm3_sram_we <= "00000000";
						tm3_sram_oe <= "11";
						tm3_sram_data <= vidin_data_buf_sc_4;
					
					when "110" => 
						 --if vert(8)= '0' then
					    --  tm3_sram_addr <= "00000" & vert(7 downto 0) & horiz(8 downto 3);					
	                    --  tm3_sram_we <= "11111111";
						--	tm3_sram_oe <= "11";
						--	tm3_sram_data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
					
						 --else 
							tm3_sram_addr <= "00101" & vert(7 downto 0) & horiz(8 downto 3);					
							tm3_sram_we <= "11111111";
							tm3_sram_oe <= "11";
							tm3_sram_data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
					
					     --end if; 
					


					when "111" =>
						vidout_buf <= tm3_sram_data;
						tm3_sram_addr <= vidin_addr_buf_sc_1;
						tm3_sram_we <= "00000000";
						tm3_sram_oe <= "11";
						tm3_sram_data <= vidin_data_buf_sc_1;
					
					when others =>
						 tm3_sram_addr <= "0000000000000000000";					
			             tm3_sram_we <= "11111111";
						 tm3_sram_oe <= "11";
					     tm3_sram_data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
					
					end case;
			end if;



			if (vidin_new_data_scld_1_2to3_left_reg = '1')   then  
			
       		   	 case (svid_comp_switch_2to3 & vidin_addr_reg_2to3_reg(2 downto 0)) is
				when "0000" =>
					vidin_data_buf_2_sc_1(7 downto 0) <= vidin_data_reg_scld_1_2to3_left_reg; 
					vidin_data_buf_2_sc_2(7 downto 0) <= vidin_data_reg_scld_2_2to3_left_reg; 
					vidin_data_buf_2_sc_4(7 downto 0) <= vidin_data_reg_scld_4_2to3_left_reg; 
					
				when "0001" =>
					vidin_data_buf_2_sc_1(15 downto 8) <= vidin_data_reg_scld_1_2to3_left_reg; 
					vidin_data_buf_2_sc_2(15 downto 8) <= vidin_data_reg_scld_2_2to3_left_reg; 
					vidin_data_buf_2_sc_4(15 downto 8) <= vidin_data_reg_scld_4_2to3_left_reg; 
	      			
				when "0010" =>
					vidin_data_buf_2_sc_1(23 downto 16) <= vidin_data_reg_scld_1_2to3_left_reg;
					vidin_data_buf_2_sc_2(23 downto 16) <= vidin_data_reg_scld_2_2to3_left_reg;
					vidin_data_buf_2_sc_4(23 downto 16) <= vidin_data_reg_scld_4_2to3_left_reg;
					
				when "0011" =>
					vidin_data_buf_2_sc_1(31 downto 24) <= vidin_data_reg_scld_1_2to3_left_reg;
					vidin_data_buf_2_sc_2(31 downto 24) <= vidin_data_reg_scld_2_2to3_left_reg;
					vidin_data_buf_2_sc_4(31 downto 24) <= vidin_data_reg_scld_4_2to3_left_reg;
				when "0100" =>
					vidin_data_buf_2_sc_1(39 downto 32) <= vidin_data_reg_scld_1_2to3_left_reg;
					vidin_data_buf_2_sc_2(39 downto 32) <= vidin_data_reg_scld_2_2to3_left_reg;
					vidin_data_buf_2_sc_4(39 downto 32) <= vidin_data_reg_scld_4_2to3_left_reg;
					
				when "0101" =>
					vidin_data_buf_2_sc_1(47 downto 40) <= vidin_data_reg_scld_1_2to3_left_reg;
					vidin_data_buf_2_sc_2(47 downto 40) <= vidin_data_reg_scld_2_2to3_left_reg;
					vidin_data_buf_2_sc_4(47 downto 40) <= vidin_data_reg_scld_4_2to3_left_reg;
					
				when "0110" =>
					vidin_data_buf_2_sc_1(55 downto 48) <= vidin_data_reg_scld_1_2to3_left_reg;
					vidin_data_buf_2_sc_2(55 downto 48) <= vidin_data_reg_scld_2_2to3_left_reg;
					vidin_data_buf_2_sc_4(55 downto 48) <= vidin_data_reg_scld_4_2to3_left_reg;
			  	
				when "0111" =>
				    vidin_data_buf_sc_1 <= vidin_data_reg_scld_1_2to3_left_reg & 
					vidin_data_buf_2_sc_1(55 downto 0);
	
			    vidin_data_buf_sc_2 <= vidin_data_reg_scld_2_2to3_left_reg & 
					vidin_data_buf_2_sc_2(55 downto 0);

			    vidin_data_buf_sc_4 <= vidin_data_reg_scld_4_2to3_left_reg & 
					vidin_data_buf_2_sc_4(55 downto 0);


		       
					vidin_addr_buf_sc_1 <= "0000" & svid_comp_switch_2to3 
								& vidin_addr_reg_2to3_reg(16 downto 3);
				
					vidin_addr_buf_sc_2 <= "0001" & svid_comp_switch_2to3 
								& vidin_addr_reg_2to3_reg(16 downto 3);
	
					vidin_addr_buf_sc_4 <= "0010" & svid_comp_switch_2to3 
								& vidin_addr_reg_2to3_reg(16 downto 3);
	
				when "1000" =>
					vidin_data_buf_2_sc_1(7 downto 0) <= vidin_data_reg_scld_1_2to3_right_reg; 
					vidin_data_buf_2_sc_2(7 downto 0) <= vidin_data_reg_scld_2_2to3_right_reg; 
					vidin_data_buf_2_sc_4(7 downto 0) <= vidin_data_reg_scld_4_2to3_right_reg; 
					
				when "1001" =>
					vidin_data_buf_2_sc_1(15 downto 8) <= vidin_data_reg_scld_1_2to3_right_reg; 
					vidin_data_buf_2_sc_2(15 downto 8) <= vidin_data_reg_scld_2_2to3_right_reg; 
					vidin_data_buf_2_sc_4(15 downto 8) <= vidin_data_reg_scld_4_2to3_right_reg; 
	      			
				when "1010" =>
					vidin_data_buf_2_sc_1(23 downto 16) <= vidin_data_reg_scld_1_2to3_right_reg;
					vidin_data_buf_2_sc_2(23 downto 16) <= vidin_data_reg_scld_2_2to3_right_reg;
					vidin_data_buf_2_sc_4(23 downto 16) <= vidin_data_reg_scld_4_2to3_right_reg;
					
				when "1011" =>
					vidin_data_buf_2_sc_1(31 downto 24) <= vidin_data_reg_scld_1_2to3_right_reg;
					vidin_data_buf_2_sc_2(31 downto 24) <= vidin_data_reg_scld_2_2to3_right_reg;
					vidin_data_buf_2_sc_4(31 downto 24) <= vidin_data_reg_scld_4_2to3_right_reg;
					
				when "1100" =>
					vidin_data_buf_2_sc_1(39 downto 32) <= vidin_data_reg_scld_1_2to3_right_reg;
					vidin_data_buf_2_sc_2(39 downto 32) <= vidin_data_reg_scld_2_2to3_right_reg;
					vidin_data_buf_2_sc_4(39 downto 32) <= vidin_data_reg_scld_4_2to3_right_reg;
					
				when "1101" =>
					vidin_data_buf_2_sc_1(47 downto 40) <= vidin_data_reg_scld_1_2to3_right_reg;
					vidin_data_buf_2_sc_2(47 downto 40) <= vidin_data_reg_scld_2_2to3_right_reg;
					vidin_data_buf_2_sc_4(47 downto 40) <= vidin_data_reg_scld_4_2to3_right_reg;
					
				when "1110" =>
					vidin_data_buf_2_sc_1(55 downto 48) <= vidin_data_reg_scld_1_2to3_right_reg;
					vidin_data_buf_2_sc_2(55 downto 48) <= vidin_data_reg_scld_2_2to3_right_reg;
					vidin_data_buf_2_sc_4(55 downto 48) <= vidin_data_reg_scld_4_2to3_right_reg;
			  	
				when "1111" =>
				    vidin_data_buf_sc_1 <= vidin_data_reg_scld_1_2to3_right_reg & 
					vidin_data_buf_2_sc_1(55 downto 0);
	
			    vidin_data_buf_sc_2 <= vidin_data_reg_scld_2_2to3_right_reg & 
					vidin_data_buf_2_sc_2(55 downto 0);

			    vidin_data_buf_sc_4 <= vidin_data_reg_scld_4_2to3_right_reg & 
					vidin_data_buf_2_sc_4(55 downto 0);


		       
				vidin_addr_buf_sc_1 <= "0000" & svid_comp_switch_2to3 
								& vidin_addr_reg_2to3_reg(16 downto 3);
	
				vidin_addr_buf_sc_2 <= "0001" & svid_comp_switch_2to3 
								& vidin_addr_reg_2to3_reg(16 downto 3);

				vidin_addr_buf_sc_4 <= "0010" & svid_comp_switch_2to3 
								& vidin_addr_reg_2to3_reg(16 downto 3);



				end case;
			end if;
			
		end if;
	end process;
end arch_sv_chip0;





