library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sv_chip2 is port(
	tm3_clk_v0: in std_logic;
	tm3_sram_data : inout std_logic_vector(63 downto 0);
	tm3_sram_addr : out std_logic_vector(18 downto 0);
	tm3_sram_we : out std_logic_vector(7 downto 0);
	tm3_sram_oe : out std_logic_vector(1 downto 0);
	tm3_sram_adsp : out std_logic;
	vidin_new_data: in std_logic;
	vidin_rgb_reg: in std_logic_vector(7 downto 0);
	vidin_addr_reg: in std_logic_vector(18 downto 0);
	svid_comp_switch : in std_logic;
	counter_out_2to1: out std_logic_vector(2 downto 0);
	bus_word_3_2to1: out std_logic_vector(15 downto 0);
	bus_word_4_2to1: out std_logic_vector(15 downto 0);
	bus_word_5_2to1: out std_logic_vector(15 downto 0);
	bus_word_6_2to1: out std_logic_vector(15 downto 0);
	vidin_new_data_fifo: out std_logic;
	vidin_rgb_reg_fifo_left:out std_logic_vector(7 downto 0);
	vidin_rgb_reg_fifo_right:  out std_logic_vector(7 downto 0);
	vidin_addr_reg_2to0: out std_logic_vector(3 downto 0);
	v_nd_s1_left_2to0: in std_logic;     
	v_nd_s2_left_2to0 :in std_logic;
	v_nd_s4_left_2to0 :in std_logic;
	v_d_reg_s1_left_2to0 :in std_logic_vector(7 downto 0);    
	v_d_reg_s2_left_2to0 :in std_logic_vector(7 downto 0);
	v_d_reg_s4_left_2to0 :in std_logic_vector(7 downto 0);
	v_nd_s1_right_2to0: in std_logic;     
	v_nd_s2_right_2to0 :in std_logic;
	v_nd_s4_right_2to0 :in std_logic;
	v_d_reg_s1_right_2to0 :in std_logic_vector(7 downto 0);    
	v_d_reg_s2_right_2to0 :in std_logic_vector(7 downto 0);
	v_d_reg_s4_right_2to0 :in std_logic_vector(7 downto 0));
	
	
end sv_chip2;

architecture arch_sv_chip2 of sv_chip2 is
	signal vidin_new_data_fifo_w: std_logic;  -- <MSL>
	signal v_nd_s1: std_logic;
	signal vidin_new_data_v_fltr: std_logic;
	signal horiz: std_logic_vector(9 downto 0);
	signal vert: std_logic_vector(9 downto 0);
	signal vidin_data_buf_sc_1 : std_logic_vector(63 downto 0);
	signal vidin_data_buf_2_sc_1 : std_logic_vector(55 downto 0);
	signal vidin_addr_buf_sc_1 : std_logic_vector(18 downto 0);
	signal vidin_addr_buf_sc_1_fifo : std_logic_vector(13 downto 0);
	signal vidin_addr_reg_scld: std_logic_vector(18 downto 0);
	signal video_state : std_logic;
	signal vidin_gray_scld_1: std_logic_vector(7 downto 0);
	signal vidout_buf_fifo_1_left:std_logic_vector(63 downto 0);
	signal vidout_buf_fifo_1_right:std_logic_vector(63 downto 0);
	signal vidin_rgb_reg_tmp: std_logic_vector(7 downto 0);
	signal vidin_data_buf_fifo_sc_1_l: std_logic_vector(7 downto 0);
	signal vidin_data_buf_fifo_sc_1_r: std_logic_vector(7 downto 0);
	signal vidout_buf_fifo_2_1_left: std_logic_vector(63 downto 0); 
	signal vidout_buf_fifo_2_1_right: std_logic_vector(63 downto 0); 
	signal vidin_new_data_tmp: std_logic;
	signal vidin_addr_reg_reg : std_logic_vector(18 downto 0);
	signal v_nd_s1_left,v_nd_s1_right: std_logic;
	signal v_nd_s2_left,v_nd_s2_right: std_logic;
	signal v_nd_s4_left,v_nd_s4_right: std_logic;
	signal v_d_reg_s1_left,v_d_reg_s1_right: std_logic_vector(7 downto 0);
	signal v_d_reg_s2_left, v_d_reg_s2_right: std_logic_vector(7 downto 0);
	signal v_d_reg_s4_left, v_d_reg_s4_right: std_logic_vector(7 downto 0);
	signal vidin_v_out_1_f1_left,vidin_v_out_1_f2_left,vidin_v_out_1_f3_left,vidin_v_out_1_h1_left
		,vidin_v_out_1_h2_left,vidin_v_out_1_h3_left,vidin_v_out_1_h4_left: std_logic_vector(15 downto 0);
	signal vidin_v_out_2_f1_left,vidin_v_out_2_f2_left,vidin_v_out_2_f3_left,vidin_v_out_2_h1_left
		,vidin_v_out_2_h2_left,vidin_v_out_2_h3_left,vidin_v_out_2_h4_left: std_logic_vector(15 downto 0);
	signal vidin_v_out_4_f1_left,vidin_v_out_4_f2_left,vidin_v_out_4_f3_left,vidin_v_out_4_h1_left
		,vidin_v_out_4_h2_left,vidin_v_out_4_h3_left,vidin_v_out_4_h4_left: std_logic_vector(15 downto 0);
	signal vidin_v_out_1_f1_right,vidin_v_out_1_f2_right,vidin_v_out_1_f3_right,vidin_v_out_1_h1_right
		,vidin_v_out_1_h2_right,vidin_v_out_1_h3_right,vidin_v_out_1_h4_right: std_logic_vector(15 downto 0);
	signal vidin_v_out_2_f1_right,vidin_v_out_2_f2_right,vidin_v_out_2_f3_right,vidin_v_out_2_h1_right
		,vidin_v_out_2_h2_right,vidin_v_out_2_h3_right,vidin_v_out_2_h4_right: std_logic_vector(15 downto 0);
	signal vidin_v_out_4_f1_right,vidin_v_out_4_f2_right,vidin_v_out_4_f3_right,vidin_v_out_4_h1_right
		,vidin_v_out_4_h2_right,vidin_v_out_4_h3_right,vidin_v_out_4_h4_right: std_logic_vector(15 downto 0);	
	signal v_d_reg_s1_2to3_left:  std_logic_vector(7 downto 0);
	signal v_d_reg_s2_2to3_left:  std_logic_vector(7 downto 0);
	signal v_d_reg_s4_2to3_left:  std_logic_vector(7 downto 0);
	signal v_d_reg_s1_2to3_right:  std_logic_vector(7 downto 0);
	signal v_d_reg_s2_2to3_right:  std_logic_vector(7 downto 0);
	signal v_d_reg_s4_2to3_right:  std_logic_vector(7 downto 0);
	signal vidin_addr_reg_2to3:  std_logic_vector(18 downto 0);
	signal svid_comp_switch_2to3: std_logic;
	signal real_z_4_left,imag_z_4_left,real_p_4_left,imag_p_4_left,real_n_4_left,imag_n_4_left: std_logic_vector(15 downto 0);
	signal real_z_4_right,imag_z_4_right,real_p_4_right,imag_p_4_right,real_n_4_right,imag_n_4_right: std_logic_vector(15 downto 0);
	signal real_z_2_left,imag_z_2_left,real_p_2_left,imag_p_2_left,real_n_2_left,imag_n_2_left: std_logic_vector(15 downto 0);
	signal real_z_2_right,imag_z_2_right,real_p_2_right,imag_p_2_right,real_n_2_right,imag_n_2_right: std_logic_vector(15 downto 0);
	signal real_z_1_left,imag_z_1_left,real_p_1_left,imag_p_1_left,real_n_1_left,imag_n_1_left: std_logic_vector(15 downto 0);
	signal real_z_1_right,imag_z_1_right,real_p_1_right,imag_p_1_right,real_n_1_right,imag_n_1_right: std_logic_vector(15 downto 0);


	-- component scaler port(
	--	tm3_clk_v0: in std_logic;
	--	vidin_new_data: in std_logic;
	--	vidin_rgb_reg: in std_logic_vector(7 downto 0);
	--	vidin_addr_reg: in std_logic_vector(18 downto 0);
	--	vidin_new_data_scld_1: out std_logic;
    --	vidin_new_data_scld_2: out std_logic;
  	--	vidin_new_data_scld_4: out std_logic;
	--	vidin_gray_scld_1:out std_logic_vector(7 downto 0);
	--	vidin_gray_scld_2:out std_logic_vector(7 downto 0);
	--	vidin_gray_scld_4:out std_logic_vector(7 downto 0));
	-- end component;

	component h_fltr port(
        	tm3_clk_v0 : in std_logic;
		vidin_new_data : in std_logic;
		vidin_in_f1: in std_logic_vector(15 downto 0);
		vidin_in_f2: in std_logic_vector(15 downto 0);
		vidin_in_f3: in std_logic_vector(15 downto 0);
		vidin_in_h1: in std_logic_vector(15 downto 0);
		vidin_in_h2: in std_logic_vector(15 downto 0);
		vidin_in_h3: in std_logic_vector(15 downto 0);
		vidin_in_h4: in std_logic_vector(15 downto 0);
		real_z_reg: out std_logic_vector(15 downto 0);
		imag_z_reg: out std_logic_vector(15 downto 0);
		real_p_reg: out std_logic_vector(15 downto 0);
		imag_p_reg: out std_logic_vector(15 downto 0);
		real_n_reg: out std_logic_vector(15 downto 0);
		imag_n_reg: out std_logic_vector(15 downto 0));
	end component;
	

	component h_fltr_or port(
        	tm3_clk_v0 : in std_logic;
		vidin_new_data : in std_logic;
		vidin_in: in std_logic_vector(7 downto 0);
		vidin_out_or : out std_logic_vector(7 downto 0));
	end component;


	component v_fltr generic(
		horiz_length : integer;
		vert_length: integer);
		port(
        	tm3_clk_v0 : in std_logic;
		vidin_new_data : in std_logic;
		vidin_in: in std_logic_vector(7 downto 0);
		vidin_out_f1 : out std_logic_vector(15 downto 0);
		vidin_out_f2 : out std_logic_vector(15 downto 0);
		vidin_out_f3 : out std_logic_vector(15 downto 0);
		vidin_out_h1 : out std_logic_vector(15 downto 0);
		vidin_out_h2 : out std_logic_vector(15 downto 0);
		vidin_out_h3 : out std_logic_vector(15 downto 0);
		vidin_out_h4 : out std_logic_vector(15 downto 0);
		vidin_out_or:out std_logic_vector(7 downto 0));
	end component;

	component port_bus_2to1 port(
		clk: in std_logic;
		vidin_addr_reg: in std_logic_vector(18 downto 0);
		svid_comp_switch : in std_logic;
		vidin_new_data_scld_1_2to3_left: in std_logic;
		vidin_data_reg_scld_1_2to3_left_rp: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_left_ip: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_left_rn: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_left_in: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_left_rp: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_left_ip: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_left_rn: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_left_in: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_left_rp: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_left_ip: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_left_rn: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_left_in: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_right_rp: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_right_ip: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_right_rn: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_right_in: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_right_rp: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_right_ip: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_right_rn: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_right_in: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_right_rp: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_right_ip: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_right_rn: in std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_right_in: in std_logic_vector(15 downto 0);
		bus_word_3: out std_logic_vector(15 downto 0);
		bus_word_4: out std_logic_vector(15 downto 0);
		bus_word_5: out std_logic_vector(15 downto 0);
		bus_word_6: out std_logic_vector(15 downto 0);
		counter_out: out std_logic_vector(2 downto 0));
end component;

begin




---------------------------------------------------------------------------------------------------------
----------------------  doing scaling , v_fltr and v_fltr on left image ---------------------------------
---------------------------------------------------------------------------------------------------------
	
	--scaler_inst_left: scaler port map(tm3_clk_v0,
	--				vidin_new_data_fifo,
	--				vidin_rgb_reg_fifo_left,
	--				vidin_addr_reg_reg,
	--				v_nd_s1_left,     
	--				v_nd_s2_left,
	--				v_nd_s4_left,
	--				v_d_reg_s1_left,    
	--				v_d_reg_s2_left,
	--				v_d_reg_s4_left);

	
	
	v_fltr_1_left: v_fltr generic map(496,7) --16)  --10)
		port map(tm3_clk_v0,
				v_nd_s1_left,    
				v_d_reg_s1_left,					
				vidin_v_out_1_f1_left,
				vidin_v_out_1_f2_left,
				vidin_v_out_1_f3_left,
				vidin_v_out_1_h1_left,
				vidin_v_out_1_h2_left,
				vidin_v_out_1_h3_left,
				vidin_v_out_1_h4_left,
				open);							


	v_fltr_2_left: v_fltr generic map(316,7) --13)   --,7)
		port map(tm3_clk_v0,
				v_nd_s2_left,    
				v_d_reg_s2_left,		
				vidin_v_out_2_f1_left,
				vidin_v_out_2_f2_left,
				vidin_v_out_2_f3_left,
				vidin_v_out_2_h1_left,
				vidin_v_out_2_h2_left,
				vidin_v_out_2_h3_left,
				vidin_v_out_2_h4_left,
				open);							

	v_fltr_4_left: v_fltr generic map(226,7)
		port map(tm3_clk_v0,
				v_nd_s4_left,    
				v_d_reg_s4_left,		
				vidin_v_out_4_f1_left,
				vidin_v_out_4_f2_left,
				vidin_v_out_4_f3_left,
				vidin_v_out_4_h1_left,
				vidin_v_out_4_h2_left,
				vidin_v_out_4_h3_left,
				vidin_v_out_4_h4_left,
				open);							

	
	
	


	h_fltr_1_left: h_fltr port map(tm3_clk_v0,
				v_nd_s1_left,  	
				vidin_v_out_1_f1_left,
				vidin_v_out_1_f2_left,
				vidin_v_out_1_f3_left,
				vidin_v_out_1_h1_left,
				vidin_v_out_1_h2_left,
				vidin_v_out_1_h3_left,
				vidin_v_out_1_h4_left,
				real_z_1_left, 
				imag_z_1_left,
				real_p_1_left,
				imag_p_1_left,
                real_n_1_left,
				imag_n_1_left);

				
	h_fltr_2_left: h_fltr port map(tm3_clk_v0,
				v_nd_s2_left,  	
				vidin_v_out_2_f1_left,
				vidin_v_out_2_f2_left,
				vidin_v_out_2_f3_left,
				vidin_v_out_2_h1_left,
				vidin_v_out_2_h2_left,
				vidin_v_out_2_h3_left,
				vidin_v_out_2_h4_left,
				real_z_2_left, 
				imag_z_2_left,
				real_p_2_left,
				imag_p_2_left,
                real_n_2_left,
				imag_n_2_left);

				
	h_fltr_4_left: h_fltr port map(tm3_clk_v0,
				v_nd_s4_left,  
				vidin_v_out_4_f1_left,
				vidin_v_out_4_f2_left,
				vidin_v_out_4_f3_left,
				vidin_v_out_4_h1_left,
				vidin_v_out_4_h2_left,
				vidin_v_out_4_h3_left,
				vidin_v_out_4_h4_left,
				real_z_4_left, 
				imag_z_4_left,
				real_p_4_left,
				imag_p_4_left,
                real_n_4_left,
				imag_n_4_left);

---------------------------------------------------------------------------------------------------------
----------------------  doing scaling , v_fltr and v_fltr on right image ---------------------------------
---------------------------------------------------------------------------------------------------------
	
	
	--scaler_inst_right: scaler port map(tm3_clk_v0,
	--				vidin_new_data_fifo,
	--				vidin_rgb_reg_fifo_right,
	--				vidin_addr_reg_reg,
	--				v_nd_s1_right,  	
	--				v_nd_s2_right,
	--				v_nd_s4_right,
	--				v_d_reg_s1_right,  
	--				v_d_reg_s2_right,
	--				v_d_reg_s4_right);


	v_fltr_1_right: v_fltr generic map(496,7)   --16)   --,10)
		port map(tm3_clk_v0,
				v_nd_s1_right,    
				v_d_reg_s1_right,					
				vidin_v_out_1_f1_right,
				vidin_v_out_1_f2_right,
				vidin_v_out_1_f3_right,
				vidin_v_out_1_h1_right,
				vidin_v_out_1_h2_right,
				vidin_v_out_1_h3_right,
				vidin_v_out_1_h4_right,
				open);							

	v_fltr_2_right: v_fltr generic map(316,7)  --13)   --,7)
		port map(tm3_clk_v0,
				v_nd_s2_right,    
				v_d_reg_s2_right,		
				vidin_v_out_2_f1_right,
				vidin_v_out_2_f2_right,
		    	vidin_v_out_2_f3_right,
				vidin_v_out_2_h1_right,
				vidin_v_out_2_h2_right,
				vidin_v_out_2_h3_right,
				vidin_v_out_2_h4_right,
				open);							

	v_fltr_4_right: v_fltr generic map(226,7)
		port map(tm3_clk_v0,
				v_nd_s4_right,    
				v_d_reg_s4_right,		
				vidin_v_out_4_f1_right,
				vidin_v_out_4_f2_right,
				vidin_v_out_4_f3_right,
				vidin_v_out_4_h1_right,
				vidin_v_out_4_h2_right,
				vidin_v_out_4_h3_right,
				vidin_v_out_4_h4_right,
				open);							

	h_fltr_1_right: h_fltr port map(tm3_clk_v0,
				v_nd_s1_right,  	
				vidin_v_out_1_f1_right,
				vidin_v_out_1_f2_right,
				vidin_v_out_1_f3_right,
				vidin_v_out_1_h1_right,
				vidin_v_out_1_h2_right,
				vidin_v_out_1_h3_right,
				vidin_v_out_1_h4_right,
				real_z_1_right, 
				imag_z_1_right,
				real_p_1_right,
				imag_p_1_right,
                real_n_1_right,
				imag_n_1_right);


				
	h_fltr_2_right: h_fltr port map(tm3_clk_v0,
				v_nd_s2_right,  	
				vidin_v_out_2_f1_right,
				vidin_v_out_2_f2_right,
				vidin_v_out_2_f3_right,
				vidin_v_out_2_h1_right,
				vidin_v_out_2_h2_right,
				vidin_v_out_2_h3_right,
				vidin_v_out_2_h4_right,
				real_z_2_right, 
				imag_z_2_right,
				real_p_2_right,
				imag_p_2_right,
                real_n_2_right,
				imag_n_2_right);

				

	h_fltr_4_right: h_fltr port map(tm3_clk_v0,
				v_nd_s4_right,  	
				vidin_v_out_4_f1_right,
				vidin_v_out_4_f2_right,
				vidin_v_out_4_f3_right,
				vidin_v_out_4_h1_right,
				vidin_v_out_4_h2_right,
				vidin_v_out_4_h3_right,
				vidin_v_out_4_h4_right,
				real_z_4_right, 
				imag_z_4_right,
				real_p_4_right,
				imag_p_4_right,
                real_n_4_right,
				imag_n_4_right); 


-----------------------------------------------------------------------------------------------------
----------------------         sending filter results to bus_interface module   ---------------------
-----------------------------------------------------------------------------------------------------


	port_bus_2to1_inst: port_bus_2to1 port map(
		tm3_clk_v0,
		vidin_addr_reg_2to3,
		svid_comp_switch_2to3, 
		v_nd_s1_left,
		real_p_1_left,
		imag_p_1_left,
        real_n_1_left,
		imag_n_1_left,
		real_p_2_left,
		imag_p_2_left,
        real_n_2_left,
		imag_n_2_left,
		real_p_4_left,
		imag_p_4_left,
        real_n_4_left,
		imag_n_4_left, 
		real_p_1_right,
		imag_p_1_right,
        real_n_1_right,
		imag_n_1_right,
		real_p_2_right,
		imag_p_2_right,
        real_n_2_right,
		imag_n_2_right,
 		real_p_4_right,
		imag_p_4_right,
        real_n_4_right,
		imag_n_4_right, 
		bus_word_3_2to1,
		bus_word_4_2to1,
		bus_word_5_2to1,
		bus_word_6_2to1,
		counter_out_2to1);


-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------


	--tm3_vidout_clock <= not(video_state);

	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 = '1') then
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

				tm3_sram_adsp <= '1';
				tm3_sram_we <= "11111111";
				tm3_sram_data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
				case horiz(2 downto 0) is 
			        when "000" => 
						tm3_sram_oe <= "10";
				
				when "001" => 
						tm3_sram_oe <= "11";
				
				when "010" => 
						tm3_sram_oe <= "10";
				
				when "011" => 
						tm3_sram_oe <= "11";
				
				when "100" => 
						tm3_sram_oe <= "11";
				
				when "101" => 
						tm3_sram_oe <= "11";
					
				when "110" => 
						tm3_sram_oe <= "11"; --"10";
				
				when "111" => 
						tm3_sram_oe <= "11";
				
			     end case;	
				
			else
				tm3_sram_adsp <= '0';
				
				case horiz(2 downto 0) is
				
					when "000" =>
						tm3_sram_addr <= "00000" & vidin_addr_buf_sc_1_fifo;					
			            tm3_sram_we <= "11111111";
						tm3_sram_oe <= "11";
						tm3_sram_data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
					
					when "001" =>
						vidout_buf_fifo_1_left <= tm3_sram_data;
						tm3_sram_addr <= vidin_addr_buf_sc_1;
						tm3_sram_we <= "11111111";
						tm3_sram_oe <= "11";
						tm3_sram_data <= vidin_data_buf_sc_1;
					
					when "010" =>
					    tm3_sram_addr <= "00001" & vidin_addr_buf_sc_1_fifo;					
			            tm3_sram_we <= "11111111";
						tm3_sram_oe <= "11";
						tm3_sram_data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
					
					      
					when "011" => 
						vidout_buf_fifo_1_right <= tm3_sram_data;
						tm3_sram_addr <= vidin_addr_buf_sc_1;
						tm3_sram_we <= "11111111";
						tm3_sram_oe <= "11";
						tm3_sram_data <= vidin_data_buf_sc_1;
					
					when "100" =>
						    tm3_sram_addr <= "00000" & vidin_addr_buf_sc_1_fifo;					
			                tm3_sram_we <= "11111111";
							tm3_sram_oe <= "11";
							tm3_sram_data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
					
					      
					when "101" =>
						
						tm3_sram_addr <= vidin_addr_buf_sc_1;
						tm3_sram_we <= "11111111";
						tm3_sram_oe <= "11";
						tm3_sram_data <= vidin_data_buf_sc_1;
					
					
					when "110" => 
						 if vert(8)= '0' then
					        tm3_sram_addr <= "00000" & vert(7 downto 0) & horiz(8 downto 3);					
			                        tm3_sram_we <= "11111111";
						tm3_sram_oe <= "11";
						tm3_sram_data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
					
					        else 
						tm3_sram_addr <= "00001" & vert(7 downto 0) & horiz(8 downto 3);					
						tm3_sram_we <= "11111111";
						tm3_sram_oe <= "11";
						tm3_sram_data <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
					
					        end if; 
					
					when "111" =>
						--vidout_buf <= tm3_sram_data;
						tm3_sram_addr <= vidin_addr_buf_sc_1;
                                                -- changed in test_brw_fast_...._als_im, jul 29
						tm3_sram_we <= "11111111"; --"00000000"; --"11111111"; --"00000000";
						tm3_sram_oe <= "11";
						tm3_sram_data <= vidin_data_buf_sc_1;
					
					end case;
			end if;


			if (vidin_new_data_fifo_w = '1')   then  
			
		   	 case vidin_addr_reg_reg(2 downto 0) is
				when "000" =>
					vidin_data_buf_2_sc_1(7 downto 0) <= vidin_rgb_reg_tmp;	
					vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left(7 downto 0);
					vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right(7 downto 0);
					
				when "001" =>
					vidin_data_buf_2_sc_1(15 downto 8) <= vidin_rgb_reg_tmp;
					vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left(15 downto 8);
					vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right(15 downto 8);
					
				when "010" =>
					vidin_data_buf_2_sc_1(23 downto 16) <= vidin_rgb_reg_tmp;
					vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left(23 downto 16);	
					vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right(23 downto 16);	
					
				when "011" =>
					vidin_data_buf_2_sc_1(31 downto 24) <= vidin_rgb_reg_tmp;
					vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left(31 downto 24);
					vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right(31 downto 24);
					
				when "100" =>
					vidin_data_buf_2_sc_1(39 downto 32) <= vidin_rgb_reg_tmp;
					vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left(39 downto 32);
					vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right(39 downto 32);
					
				when "101" =>
					vidin_data_buf_2_sc_1(47 downto 40) <= vidin_rgb_reg_tmp;
					vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left(47 downto 40);
					vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right(47 downto 40);
					
				when "110" =>
					vidin_data_buf_2_sc_1(55 downto 48) <= vidin_rgb_reg_tmp;
					vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left(55 downto 48);
			  		vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right(55 downto 48);
			  	
				when "111" =>
				    vidin_data_buf_sc_1 <= vidin_rgb_reg_tmp &
					vidin_data_buf_2_sc_1(55 downto 0);
					
					--vidout_buf_fifo_2_1 <= vidout_buf_fifo_1;
					vidout_buf_fifo_2_1_left <= vidout_buf_fifo_1_left;
					vidout_buf_fifo_2_1_right <= vidout_buf_fifo_1_right;
					
					vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left(63 downto 56);
			     	vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right(63 downto 56);
			     
			       
					vidin_addr_buf_sc_1 <= "0000" & svid_comp_switch 
								& vidin_addr_reg_reg(16 downto 3);
				-----------------------------------------------------------
					if vidin_addr_reg_reg(8 downto 3)= 43 then
							vidin_addr_buf_sc_1_fifo <= (vidin_addr_reg_reg(16 downto 9) + "00000001") & "000000";
					else
						if vidin_addr_reg_reg(8 downto 3)= 44 then
								vidin_addr_buf_sc_1_fifo <= (vidin_addr_reg_reg(16 downto 9) + "00000001") & "000001";
						else 	
							vidin_addr_buf_sc_1_fifo <= (vidin_addr_reg_reg(16 downto 3)) + 2;
						end if;
					end if;
				-----------------------------------------------------------
				
		end case;


		--vidin_rgb_reg_tmp <= vidin_rgb_reg(7 downto 0);
		--vidin_addr_reg_2to3 <= vidin_addr_reg;
		--vidin_rgb_reg_fifo_left <=  vidin_data_buf_fifo_sc_1; --xor vidin_rgb_reg_tmp;
		--vidin_rgb_reg_fifo_right <=  vidin_rgb_reg_tmp;	--vidin_data_buf_fifo_sc_1; -- 	
       		
			end if;

		--vidin_new_data_fifo <= vidin_new_data;
		--svid_comp_switch_2to3 <= svid_comp_switch;



		end if;
	end process;

	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 ='1') then 
	
			vidin_rgb_reg_tmp <= vidin_rgb_reg;
			
			vidin_addr_reg_2to3 <= vidin_addr_reg;
			
			vidin_addr_reg_reg <= vidin_addr_reg;
			vidin_addr_reg_2to0 <= vidin_addr_reg(1 downto 0) & vidin_addr_reg(10 downto 9);


			--vidin_new_data_tmp <= vidin_new_data;
			vidin_new_data_fifo <= vidin_new_data;  --_tmp;
			vidin_new_data_fifo_w <= vidin_new_data;  -- <MSL>
			
			--vidin_new_data_fifo <= vidin_new_data;
			
			svid_comp_switch_2to3 <= svid_comp_switch;

			--vidin_rgb_reg_fifo_left <= vidin_rgb_reg_fifo_left_32;
			--vidin_rgb_reg_fifo_right <= vidin_rgb_reg_fifo_right_32;
			
			--vidin_rgb_reg_fifo_left_23 <= vidin_data_buf_fifo_sc_1_l; --"11111111"; -- --xor vidin_rgb_reg_tmp;
			--vidin_rgb_reg_fifo_right_23 <= vidin_data_buf_fifo_sc_1_r; --vidin_rgb_reg_tmp;	--vidin_data_buf_fifo_sc_1; -- 	
 
			vidin_rgb_reg_fifo_left <= vidin_data_buf_fifo_sc_1_l;
			vidin_rgb_reg_fifo_right <= vidin_data_buf_fifo_sc_1_r;

			v_nd_s1_left <= v_nd_s1_left_2to0;
			v_nd_s2_left <= v_nd_s2_left_2to0;
			v_nd_s4_left <= v_nd_s4_left_2to0;
			v_d_reg_s1_left <= v_d_reg_s1_left_2to0; 
			v_d_reg_s2_left <= v_d_reg_s2_left_2to0; 
			v_d_reg_s4_left <= v_d_reg_s4_left_2to0; 
			v_nd_s1_right <= v_nd_s1_right_2to0;
			v_nd_s2_right <= v_nd_s2_right_2to0;
			v_nd_s4_right <= v_nd_s4_right_2to0;
			v_d_reg_s1_right <= v_d_reg_s1_right_2to0; 
			v_d_reg_s2_right <= v_d_reg_s2_right_2to0; 
			v_d_reg_s4_right <= v_d_reg_s4_right_2to0; 

  		end if;
	end process;    				

end arch_sv_chip2;

