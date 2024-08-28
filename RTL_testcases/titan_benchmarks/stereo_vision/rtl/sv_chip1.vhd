-- created by Ahmad darabiha
-- last updated Aug. 2002
-- this is the design for chip #1 of stereo 
-- vision system. this chip mainly performs the 
-- normalization and correlation in two orienations
-- and 3 scales.
 
library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sv_chip1 is port(
	tm3_clk_v0: in std_logic;
	tm3_sram_data : inout std_logic_vector(63 downto 0);
	tm3_sram_addr : out std_logic_vector(18 downto 0);
	tm3_sram_we : out std_logic_vector(7 downto 0);
	tm3_sram_oe : out std_logic_vector(1 downto 0);
	tm3_sram_adsp : out std_logic;
	bus_word_3_2to1: in std_logic_vector(15 downto 0);
	bus_word_4_2to1: in std_logic_vector(15 downto 0);
	bus_word_5_2to1: in std_logic_vector(15 downto 0);
	bus_word_6_2to1: in std_logic_vector(15 downto 0);
	counter_out_2to1: in std_logic_vector(2 downto 0);
	bus_word_1_1to0: out std_logic_vector(7 downto 0);
	bus_word_2_1to0: out std_logic_vector(7 downto 0);
	bus_word_3_1to0: out std_logic_vector(7 downto 0);
	bus_word_4_1to0: out std_logic_vector(7 downto 0);
	bus_word_5_1to0: out std_logic_vector(7 downto 0);
	bus_word_6_1to0: out std_logic_vector(7 downto 0);
	counter_out_1to0: out std_logic_vector(2 downto 0));
end sv_chip1;

architecture arch_sv_chip1 of sv_chip1 is
	signal horiz: std_logic_vector(9 downto 0);
	signal vert: std_logic_vector(9 downto 0);
	signal vidin_data_buf_sc_1 : std_logic_vector(63 downto 0);
	signal vidin_data_buf_2_sc_1 : std_logic_vector(55 downto 0);
	signal vidin_addr_buf_sc_1 : std_logic_vector(18 downto 0);
	signal vidin_data_buf_sc_2 : std_logic_vector(63 downto 0);
	signal vidin_data_buf_2_sc_2 : std_logic_vector(55 downto 0);
	signal vidin_addr_buf_sc_2 : std_logic_vector(18 downto 0);
	signal vidin_data_buf_sc_4 : std_logic_vector(63 downto 0);
	signal vidin_data_buf_2_sc_4 : std_logic_vector(55 downto 0);
	signal vidin_addr_buf_sc_4 : std_logic_vector(18 downto 0);
	signal video_state : std_logic;
	
	signal vidin_new_data_scld_1_2to3_left_reg: std_logic;
	signal vidin_data_reg_scld_1_2to3_left_reg:  std_logic_vector(7 downto 0);
	--signal vidin_data_reg_scld_1_2to3_left_iz_reg:  std_logic_vector(7 downto 0);
	
	signal vidin_new_data_scld_2_2to3_left_reg: std_logic;
	signal vidin_data_reg_scld_2_2to3_left_reg:  std_logic_vector(7 downto 0);
	--signal vidin_data_reg_scld_2_2to3_left_iz_reg:  std_logic_vector(7 downto 0);
	
	signal vidin_new_data_scld_4_2to3_left_reg: std_logic;
	signal vidin_data_reg_scld_4_2to3_left_reg:  std_logic_vector(7 downto 0);
	--signal vidin_data_reg_scld_4_2to3_left_iz_reg:  std_logic_vector(7 downto 0);
	
	signal vidin_new_data_scld_1_2to3_right_reg: std_logic;
	signal vidin_data_reg_scld_1_2to3_right_reg:  std_logic_vector(7 downto 0);
	--signal vidin_data_reg_scld_1_2to3_right_iz_reg:  std_logic_vector(7 downto 0);
	
	signal vidin_new_data_scld_2_2to3_right_reg: std_logic;
	signal vidin_data_reg_scld_2_2to3_right_reg:  std_logic_vector(7 downto 0);
	--signal vidin_data_reg_scld_2_2to3_right_iz_reg:  std_logic_vector(7 downto 0);
	
	signal vidin_new_data_scld_4_2to3_right_reg: std_logic;
	signal vidin_data_reg_scld_4_2to3_right_reg:  std_logic_vector(7 downto 0);
	--signal vidin_data_reg_scld_4_2to3_right_iz_reg:  std_logic_vector(7 downto 0);
	
	signal vidin_addr_reg_2to3_reg: std_logic_vector(18 downto 0);
	
	signal vidin_new_data_scld_1_2to3_left: std_logic;
	signal vidin_data_reg_scld_1_2to3_left_rz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_left_iz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_left_rp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_left_ip: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_left_rn: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_left_in: std_logic_vector(15 downto 0);
		
	signal vidin_new_data_scld_2_2to3_left: std_logic;
	signal vidin_data_reg_scld_2_2to3_left_rz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_iz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_rp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_ip: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_rn: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_in: std_logic_vector(15 downto 0);
	
	signal vidin_new_data_scld_4_2to3_left: std_logic;
	signal vidin_data_reg_scld_4_2to3_left_rz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_iz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_rp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_ip: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_rn: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_in: std_logic_vector(15 downto 0);
	
	signal vidin_new_data_scld_1_2to3_right: std_logic;
	signal vidin_data_reg_scld_1_2to3_right_rz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_iz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_rp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_ip: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_rn: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_in: std_logic_vector(15 downto 0);
	
	signal vidin_new_data_scld_2_2to3_right: std_logic;
	signal vidin_data_reg_scld_2_2to3_right_rz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_iz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_rp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_ip: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_rn: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_in: std_logic_vector(15 downto 0);
	
	signal vidin_new_data_scld_4_2to3_right: std_logic;
	signal vidin_data_reg_scld_4_2to3_right_rz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_iz: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_rp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_ip: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_rn: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_in: std_logic_vector(15 downto 0);
	
	
	signal vidin_addr_reg_2to3: std_logic_vector(18 downto 0);
	signal svid_comp_switch_2to3: std_logic;
	
	--signal corr_out_01_1_z,corr_out_02_1_z,corr_out_03_1_z,corr_out_04_1_z,
	--		corr_out_05_1_z,corr_out_06_1_z,corr_out_07_1_z,corr_out_08_1_z,
	--		corr_out_09_1_z,corr_out_10_1_z,corr_out_11_1_z,corr_out_12_1_z,
	--		corr_out_13_1_z,corr_out_14_1_z,corr_out_15_1_z,corr_out_16_1_z,
	--		corr_out_17_1_z,corr_out_18_1_z,corr_out_19_1_z,corr_out_20_1_z: std_logic_vector(15 downto 0);

	signal corr_out_1_z, corr_out_1_p, corr_out_1_n : type_array_16_20;
	signal corr_out_1 : type_array_18_20;

	signal corr_out_2_z, corr_out_2_p, corr_out_2_n : type_array_16_10;
	signal corr_out_2 : type_array_18_10;

	signal corr_out_4_z, corr_out_4_p, corr_out_4_n : type_array_16_5;
	signal corr_out_4 : type_array_18_5;


	component port_bus_2to1_1 port(
		clk: in std_logic;
		vidin_addr_reg: out std_logic_vector(18 downto 0);
		svid_comp_switch : out std_logic;
		vidin_new_data_scld_1_2to3_left: out std_logic;
		vidin_data_reg_scld_1_2to3_left_rp: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_left_ip: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_left_rn: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_left_in: out std_logic_vector(15 downto 0);
		vidin_new_data_scld_2_2to3_left: out std_logic;
		vidin_data_reg_scld_2_2to3_left_rp: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_left_ip: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_left_rn: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_left_in: out std_logic_vector(15 downto 0);
		vidin_new_data_scld_4_2to3_left: out std_logic;
		vidin_data_reg_scld_4_2to3_left_rp: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_left_ip: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_left_rn: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_left_in: out std_logic_vector(15 downto 0);
		vidin_new_data_scld_1_2to3_right: out std_logic;
		vidin_data_reg_scld_1_2to3_right_rp: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_right_ip: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_right_rn: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_1_2to3_right_in: out std_logic_vector(15 downto 0);
		vidin_new_data_scld_2_2to3_right: out std_logic;
		vidin_data_reg_scld_2_2to3_right_rp: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_right_ip: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_right_rn: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_2_2to3_right_in: out std_logic_vector(15 downto 0);
		vidin_new_data_scld_4_2to3_right: out std_logic;
		vidin_data_reg_scld_4_2to3_right_rp: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_right_ip: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_right_rn: out std_logic_vector(15 downto 0);
		vidin_data_reg_scld_4_2to3_right_in: out std_logic_vector(15 downto 0);
		bus_word_3: in std_logic_vector(15 downto 0);
		bus_word_4: in std_logic_vector(15 downto 0);
		bus_word_5: in std_logic_vector(15 downto 0);
		bus_word_6: in std_logic_vector(15 downto 0);
		counter_out: in std_logic_vector(2 downto 0));
	end component;
	
	component wrapper_norm_corr_20  generic(sh_reg_w :integer);
		port(
 	 	clk : in std_logic;
		wen : in std_logic;
		d_l_1 : in std_logic_vector(15 downto 0);
		d_l_2 : in std_logic_vector(15 downto 0);
		d_r_1: in std_logic_vector(15 downto 0);
		d_r_2: in std_logic_vector(15 downto 0);
		corr_out_0: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_1: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_2: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_3: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_4: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_5: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_6: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_7: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_8: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_9: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_10: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_11: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_12: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_13: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_14: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_15: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_16: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_17: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_18: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_19: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_20: out std_logic_vector(2*sh_reg_w-1 downto 0));
end component;

component wrapper_norm_corr_10  generic(sh_reg_w :integer);
		port(
 	 	clk : in std_logic;
		wen : in std_logic;
		d_l_1 : in std_logic_vector(15 downto 0);
		d_l_2 : in std_logic_vector(15 downto 0);
		d_r_1: in std_logic_vector(15 downto 0);
		d_r_2: in std_logic_vector(15 downto 0);
		corr_out_0: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_1: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_2: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_3: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_4: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_5: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_6: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_7: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_8: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_9: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_10: out std_logic_vector(2*sh_reg_w-1 downto 0));
end component;

component wrapper_norm_corr_5_seq  generic(sh_reg_w :integer);
		port(
 	 	clk : in std_logic;
		wen : in std_logic;
		d_l_1 : in std_logic_vector(15 downto 0);
		d_l_2 : in std_logic_vector(15 downto 0);
		d_r_1: in std_logic_vector(15 downto 0);
		d_r_2: in std_logic_vector(15 downto 0);
		corr_out_0: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_1: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_2: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_3: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_4: out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_5: out std_logic_vector(2*sh_reg_w-1 downto 0));
end component;

component port_bus_1to0 generic(corr_res_w: integer);
	port(
	clk: in std_logic;
	vidin_addr_reg: in std_logic_vector(18 downto 0);
	svid_comp_switch : in std_logic;
	vidin_new_data_scld_1_2to3_left: in std_logic;
	v_corr_05_00: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_05_01: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_05_02: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_05_03: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_05_04: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_05_05: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_00: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_01: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_02: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_03: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_04: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_05: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_06: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_07: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_08: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_09: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_10: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_00: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_01: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_02: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_03: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_04: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_05: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_06: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_07: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_08: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_09: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_10: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_11: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_12: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_13: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_14: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_15: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_16: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_17: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_18: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_19: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_20: in std_logic_vector(corr_res_w-1 downto 0);
	bus_word_1: out std_logic_vector(7 downto 0);
	bus_word_2: out std_logic_vector(7 downto 0);
	bus_word_3: out std_logic_vector(7 downto 0);
	bus_word_4: out std_logic_vector(7 downto 0);
	bus_word_5: out std_logic_vector(7 downto 0);
	bus_word_6: out std_logic_vector(7 downto 0);
	counter_out: out std_logic_vector(2 downto 0));
end component;

begin
	port_bus_2to1_1_inst: port_bus_2to1_1 port map(
		tm3_clk_v0,
		vidin_addr_reg_2to3,
		svid_comp_switch_2to3, 
		vidin_new_data_scld_1_2to3_left,
		vidin_data_reg_scld_1_2to3_left_rp,
		vidin_data_reg_scld_1_2to3_left_ip,
		vidin_data_reg_scld_1_2to3_left_rn,
		vidin_data_reg_scld_1_2to3_left_in,
		vidin_new_data_scld_2_2to3_left,
		vidin_data_reg_scld_2_2to3_left_rp,
		vidin_data_reg_scld_2_2to3_left_ip,
		vidin_data_reg_scld_2_2to3_left_rn,
		vidin_data_reg_scld_2_2to3_left_in,
		vidin_new_data_scld_4_2to3_left,
		vidin_data_reg_scld_4_2to3_left_rp,
		vidin_data_reg_scld_4_2to3_left_ip,
		vidin_data_reg_scld_4_2to3_left_rn,
		vidin_data_reg_scld_4_2to3_left_in,
		vidin_new_data_scld_1_2to3_right,
		vidin_data_reg_scld_1_2to3_right_rp,
		vidin_data_reg_scld_1_2to3_right_ip,
		vidin_data_reg_scld_1_2to3_right_rn,
		vidin_data_reg_scld_1_2to3_right_in,
		vidin_new_data_scld_2_2to3_right,
		vidin_data_reg_scld_2_2to3_right_rp,
		vidin_data_reg_scld_2_2to3_right_ip,
		vidin_data_reg_scld_2_2to3_right_rn,
		vidin_data_reg_scld_2_2to3_right_in,
		vidin_new_data_scld_4_2to3_right,
		vidin_data_reg_scld_4_2to3_right_rp,
		vidin_data_reg_scld_4_2to3_right_ip,
		vidin_data_reg_scld_4_2to3_right_rn,
		vidin_data_reg_scld_4_2to3_right_in,
		bus_word_3_2to1,
		bus_word_4_2to1,
		bus_word_5_2to1,
		bus_word_6_2to1,
		counter_out_2to1);

wrapper_norm_corr_20_inst_p: wrapper_norm_corr_20 generic map(8)
		port map(
		tm3_clk_v0,
		vidin_new_data_scld_1_2to3_left,
		vidin_data_reg_scld_1_2to3_right_rp, -- changed in may 21, 2002
		vidin_data_reg_scld_1_2to3_right_ip, -- .......................
		vidin_data_reg_scld_1_2to3_left_rp, -- .......................
		vidin_data_reg_scld_1_2to3_left_ip, -- .......................
		corr_out_1_p(0),
		corr_out_1_p(1),
		corr_out_1_p(2),
		corr_out_1_p(3),
		corr_out_1_p(4),
		corr_out_1_p(5),
		corr_out_1_p(6),
		corr_out_1_p(7),
		corr_out_1_p(8),
		corr_out_1_p(9),
		corr_out_1_p(10),
		corr_out_1_p(11),
		corr_out_1_p(12),
		corr_out_1_p(13),
		corr_out_1_p(14),
		corr_out_1_p(15),
		corr_out_1_p(16),
		corr_out_1_p(17),
		corr_out_1_p(18),
		corr_out_1_p(19),
		corr_out_1_p(20));

wrapper_norm_corr_20_inst_n: wrapper_norm_corr_20 generic map(8)
		port map(
		tm3_clk_v0,
		vidin_new_data_scld_1_2to3_left,
		vidin_data_reg_scld_1_2to3_right_rn, -- changed in may 21, 2002
		vidin_data_reg_scld_1_2to3_right_in, -- .......................
		vidin_data_reg_scld_1_2to3_left_rn, -- .......................
		vidin_data_reg_scld_1_2to3_left_in, -- .......................
		corr_out_1_n(0),
		corr_out_1_n(1),
		corr_out_1_n(2),
		corr_out_1_n(3),
		corr_out_1_n(4),
		corr_out_1_n(5),
		corr_out_1_n(6),
		corr_out_1_n(7),
		corr_out_1_n(8),
		corr_out_1_n(9),
		corr_out_1_n(10),
		corr_out_1_n(11),
		corr_out_1_n(12),
		corr_out_1_n(13),
		corr_out_1_n(14),
		corr_out_1_n(15),
		corr_out_1_n(16),
		corr_out_1_n(17),
		corr_out_1_n(18),
		corr_out_1_n(19),
  	corr_out_1_n(20));


	wrapper_norm_corr_10_inst_p: wrapper_norm_corr_10 generic map(8)
		port map(
		tm3_clk_v0,
		vidin_new_data_scld_2_2to3_left,
		vidin_data_reg_scld_2_2to3_right_rp, -- changed in may 21, 2002
		vidin_data_reg_scld_2_2to3_right_ip, -- .......................
		vidin_data_reg_scld_2_2to3_left_rp, -- .......................
		vidin_data_reg_scld_2_2to3_left_ip, -- .......................
		corr_out_2_p(0),
		corr_out_2_p(1),
		corr_out_2_p(2),
		corr_out_2_p(3),
		corr_out_2_p(4),
		corr_out_2_p(5),
		corr_out_2_p(6),
		corr_out_2_p(7),
		corr_out_2_p(8),
		corr_out_2_p(9),
		corr_out_2_p(10));

	wrapper_norm_corr_10_inst_n: wrapper_norm_corr_10 generic map(8)
		port map(
		tm3_clk_v0,
		vidin_new_data_scld_2_2to3_left,
		vidin_data_reg_scld_2_2to3_right_rn, -- changed in may 21, 2002
		vidin_data_reg_scld_2_2to3_right_in, -- .......................
		vidin_data_reg_scld_2_2to3_left_rn, -- .......................
		vidin_data_reg_scld_2_2to3_left_in, -- .......................
		corr_out_2_n(0),
		corr_out_2_n(1),
		corr_out_2_n(2),
		corr_out_2_n(3),
		corr_out_2_n(4),
		corr_out_2_n(5),
		corr_out_2_n(6),
		corr_out_2_n(7),
		corr_out_2_n(8),
		corr_out_2_n(9),
		corr_out_2_n(10));
	

	wrapper_norm_corr_5_inst_p: wrapper_norm_corr_5_seq generic map(8)
		port map(
		tm3_clk_v0,
		vidin_new_data_scld_4_2to3_left,
		vidin_data_reg_scld_4_2to3_right_rp, -- changed in may 21, 2002
		vidin_data_reg_scld_4_2to3_right_ip, -- .......................
		vidin_data_reg_scld_4_2to3_left_rp, -- .......................
		vidin_data_reg_scld_4_2to3_left_ip, -- .......................
		corr_out_4_p(0),
		corr_out_4_p(1),
		corr_out_4_p(2),
		corr_out_4_p(3),
		corr_out_4_p(4),
		corr_out_4_p(5));

	wrapper_norm_corr_5_inst_n: wrapper_norm_corr_5_seq generic map(8)
		port map(
		tm3_clk_v0,
		vidin_new_data_scld_4_2to3_left,
		vidin_data_reg_scld_4_2to3_right_rn, -- changed in may 21, 2002
		vidin_data_reg_scld_4_2to3_right_in, -- .......................
		vidin_data_reg_scld_4_2to3_left_rn, -- .......................
		vidin_data_reg_scld_4_2to3_left_in, -- .......................
		corr_out_4_n(0),
		corr_out_4_n(1),
		corr_out_4_n(2),
		corr_out_4_n(3),
		corr_out_4_n(4),
		corr_out_4_n(5));


port_bus_1to0_inst: port_bus_1to0 generic map(8)
		port map(
			tm3_clk_v0,
			vidin_addr_reg_2to3,
			svid_comp_switch_2to3, 
			vidin_new_data_scld_1_2to3_left,
			corr_out_4(0)(17) & corr_out_4(0)(15 downto 9), --- scale 4  inputs
			corr_out_4(1)(17) & corr_out_4(1)(15 downto 9), --- scale 4  inputs
			corr_out_4(2)(17) & corr_out_4(2)(15 downto 9),
			corr_out_4(3)(17) & corr_out_4(3)(15 downto 9),
			corr_out_4(4)(17) & corr_out_4(4)(15 downto 9),
			corr_out_4(5)(17) & corr_out_4(5)(15 downto 9),
			corr_out_2(0)(17) & corr_out_2(0)(15 downto 9), --- scale 2  inputs
			corr_out_2(1)(17) & corr_out_2(1)(15 downto 9), --- scale 2  inputs
			corr_out_2(2)(17) & corr_out_2(2)(15 downto 9),
			corr_out_2(3)(17) & corr_out_2(3)(15 downto 9),
			corr_out_2(4)(17) & corr_out_2(4)(15 downto 9),
			corr_out_2(5)(17) & corr_out_2(5)(15 downto 9),
			corr_out_2(6)(17) & corr_out_2(6)(15 downto 9),
			corr_out_2(7)(17) & corr_out_2(7)(15 downto 9),
			corr_out_2(8)(17) & corr_out_2(8)(15 downto 9),
			corr_out_2(9)(17) & corr_out_2(9)(15 downto 9),
			corr_out_2(10)(17) & corr_out_2(10)(15 downto 9),
			corr_out_1(0)(17) & corr_out_1(0)(15 downto 9), -- scale 1 inputs
			corr_out_1(1)(17) & corr_out_1(1)(15 downto 9), -- scale 1 inputs
			corr_out_1(2)(17) & corr_out_1(2)(15 downto 9),
			corr_out_1(3)(17) & corr_out_1(3)(15 downto 9),
			corr_out_1(4)(17) & corr_out_1(4)(15 downto 9),
			corr_out_1(5)(17) & corr_out_1(5)(15 downto 9),
			corr_out_1(6)(17) & corr_out_1(6)(15 downto 9),
			corr_out_1(7)(17) & corr_out_1(7)(15 downto 9),
			corr_out_1(8)(17) & corr_out_1(8)(15 downto 9),
			corr_out_1(9)(17) & corr_out_1(9)(15 downto 9),
			corr_out_1(10)(17) & corr_out_1(10)(15 downto 9),
			corr_out_1(11)(17) & corr_out_1(11)(15 downto 9),
			corr_out_1(12)(17) & corr_out_1(12)(15 downto 9),
			corr_out_1(13)(17) & corr_out_1(13)(15 downto 9),
			corr_out_1(14)(17) & corr_out_1(14)(15 downto 9),
			corr_out_1(15)(17) & corr_out_1(15)(15 downto 9),
			corr_out_1(16)(17) & corr_out_1(16)(15 downto 9),
			corr_out_1(17)(17) & corr_out_1(17)(15 downto 9),
			corr_out_1(18)(17) & corr_out_1(18)(15 downto 9),
			corr_out_1(19)(17) & corr_out_1(19)(15 downto 9),
			corr_out_1(20)(17) & corr_out_1(20)(15 downto 9),
			bus_word_1_1to0,
			bus_word_2_1to0,
			bus_word_3_1to0,
			bus_word_4_1to0,
			bus_word_5_1to0,
			bus_word_6_1to0,
			counter_out_1to0);	


	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 = '1') then		
			if vidin_new_data_scld_1_2to3_left = '1' then
				for i in 0 to 20 loop
					corr_out_1(i) <= 	(corr_out_1_p(i)(15) & corr_out_1_p(i)(15) & corr_out_1_p(i)) +  
								(corr_out_1_n(i)(15) & corr_out_1_n(i)(15) & corr_out_1_n(i)); -- +  
								--(corr_out_1_n(i)(15) & corr_out_1_n(i)(15) & corr_out_1_n(i));
				end loop;
			end if;
		end if;
	end process;

	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 = '1') then		
			if vidin_new_data_scld_2_2to3_left = '1' then
				for i in 0 to 10 loop
					corr_out_2(i) <= 	(corr_out_2_p(i)(15) & corr_out_2_p(i)(15) & corr_out_2_p(i)) +  
								(corr_out_2_n(i)(15) & corr_out_2_n(i)(15) & corr_out_2_n(i)); -- +  
								--(corr_out_2_n(i)(15) & corr_out_2_n(i)(15) & corr_out_2_n(i));
				end loop;
			end if;
		end if;
	end process;

	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 = '1') then		
			if vidin_new_data_scld_2_2to3_left = '1' then
				for i in 0 to 5 loop
					corr_out_4(i) <= 	(corr_out_4_p(i)(15) & corr_out_4_p(i)(15) & corr_out_4_p(i)) +  
								(corr_out_4_n(i)(15) & corr_out_4_n(i)(15) & corr_out_4_n(i)); -- +  
								--(corr_out_4_n(i)(15) & corr_out_4_n(i)(15) & corr_out_4_n(i));
				end loop;
			end if;
		end if;
	end process;


  
	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 = '1') then		
			vidin_new_data_scld_1_2to3_left_reg <= vidin_new_data_scld_1_2to3_left;
			vidin_data_reg_scld_1_2to3_left_reg <= vidin_data_reg_scld_1_2to3_left_rp(15 downto 8);
			vidin_new_data_scld_2_2to3_left_reg <= vidin_new_data_scld_2_2to3_left;
			vidin_data_reg_scld_2_2to3_left_reg <= vidin_data_reg_scld_2_2to3_left_rp(15 downto 8);
			vidin_new_data_scld_4_2to3_left_reg <= vidin_new_data_scld_4_2to3_left;
			vidin_data_reg_scld_4_2to3_left_reg <= vidin_data_reg_scld_4_2to3_left_rp(15 downto 8);
			vidin_new_data_scld_1_2to3_right_reg <= vidin_new_data_scld_1_2to3_right;
			vidin_data_reg_scld_1_2to3_right_reg <= vidin_data_reg_scld_1_2to3_right_rp(15 downto 8);
			vidin_new_data_scld_2_2to3_right_reg <= vidin_new_data_scld_2_2to3_right;
			vidin_data_reg_scld_2_2to3_right_reg <= vidin_data_reg_scld_2_2to3_right_rp(15 downto 8);
			vidin_new_data_scld_4_2to3_right_reg <= vidin_new_data_scld_4_2to3_right;
			vidin_data_reg_scld_4_2to3_right_reg <= vidin_data_reg_scld_4_2to3_right_rp(15 downto 8);
			vidin_addr_reg_2to3_reg <= vidin_addr_reg_2to3;
		end if;
	end process;
		
	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 = '1') then
			video_state <= not(video_state);
			
			--vidin_new_data_scld_1_2to3_left_reg <= vidin_new_data_scld_1_2to3_left;
			--vidin_data_reg_scld_1_2to3_left_reg <= vidin_data_reg_scld_1_2to3_left;
			--vidin_addr_reg_2to3_reg <= vidin_addr_reg_2to3;

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
				tm3_sram_oe <= "11";
				
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

					when "111" =>
					--	vidout_buf <= tm3_sram_data;
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
					vidin_data_buf_2_sc_1(7 downto 0) <= vidin_data_reg_scld_1_2to3_left_reg; -- xor  vidin_data_reg_scld_1_2to3_right_reg;	
					
				when "0001" =>
					vidin_data_buf_2_sc_1(15 downto 8) <= vidin_data_reg_scld_1_2to3_left_reg; -- xor vidin_data_reg_scld_1_2to3_right_reg;	
	      			
				when "0010" =>
					vidin_data_buf_2_sc_1(23 downto 16) <= vidin_data_reg_scld_1_2to3_left_reg; -- xor vidin_data_reg_scld_1_2to3_right_reg;
					
				when "0011" =>
					vidin_data_buf_2_sc_1(31 downto 24) <= vidin_data_reg_scld_1_2to3_left_reg; -- xor vidin_data_reg_scld_1_2to3_right_reg;	
					
				when "0100" =>
					vidin_data_buf_2_sc_1(39 downto 32) <= vidin_data_reg_scld_1_2to3_left_reg; -- xor vidin_data_reg_scld_1_2to3_right_reg;	
					
				when "0101" =>
					vidin_data_buf_2_sc_1(47 downto 40) <= vidin_data_reg_scld_1_2to3_left_reg; -- xor vidin_data_reg_scld_1_2to3_right_reg;	
					
				when "0110" =>
					vidin_data_buf_2_sc_1(55 downto 48) <= vidin_data_reg_scld_1_2to3_left_reg; --xor vidin_data_reg_scld_1_2to3_right_reg;	
			  	
				when "0111" =>
				    vidin_data_buf_sc_1 <= vidin_data_reg_scld_1_2to3_left_reg & --xor vidin_data_reg_scld_1_2to3_right_reg) &
					vidin_data_buf_2_sc_1(55 downto 0);

		       
					vidin_addr_buf_sc_1 <= "0000" & svid_comp_switch_2to3 
								& vidin_addr_reg_2to3_reg(16 downto 3);
				
				when "1000" =>
					vidin_data_buf_2_sc_1(7 downto 0) <= vidin_data_reg_scld_1_2to3_right_reg; -- xor  vidin_data_reg_scld_1_2to3_right_reg;	
					
				when "1001" =>
					vidin_data_buf_2_sc_1(15 downto 8) <= vidin_data_reg_scld_1_2to3_right_reg; -- xor vidin_data_reg_scld_1_2to3_right_reg;	
	      			
				when "1010" =>
					vidin_data_buf_2_sc_1(23 downto 16) <= vidin_data_reg_scld_1_2to3_right_reg; -- xor vidin_data_reg_scld_1_2to3_right_reg;
					
				when "1011" =>
					vidin_data_buf_2_sc_1(31 downto 24) <= vidin_data_reg_scld_1_2to3_right_reg; -- xor vidin_data_reg_scld_1_2to3_right_reg;	
					
				when "1100" =>
					vidin_data_buf_2_sc_1(39 downto 32) <= vidin_data_reg_scld_1_2to3_right_reg; -- xor vidin_data_reg_scld_1_2to3_right_reg;	
					
				when "1101" =>
					vidin_data_buf_2_sc_1(47 downto 40) <= vidin_data_reg_scld_1_2to3_right_reg; -- xor vidin_data_reg_scld_1_2to3_right_reg;	
					
				when "1110" =>
					vidin_data_buf_2_sc_1(55 downto 48) <= vidin_data_reg_scld_1_2to3_right_reg; --xor vidin_data_reg_scld_1_2to3_right_reg;	
			  	
				when "1111" =>
				    vidin_data_buf_sc_1 <= vidin_data_reg_scld_1_2to3_right_reg & --xor vidin_data_reg_scld_1_2to3_right_reg) &
					vidin_data_buf_2_sc_1(55 downto 0);

		       
					vidin_addr_buf_sc_1 <= "0000" & svid_comp_switch_2to3 
								& vidin_addr_reg_2to3_reg(16 downto 3);


				end case;
			end if;
			
			if (vidin_new_data_scld_2_2to3_left_reg = '1')   then  
			
       		   	 case (svid_comp_switch_2to3 & vidin_addr_reg_2to3_reg(3 downto 1)) is
				when "0000" =>
					vidin_data_buf_2_sc_2(7 downto 0) <=vidin_data_reg_scld_2_2to3_left_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
					
				when "0001" =>
					vidin_data_buf_2_sc_2(15 downto 8) <= vidin_data_reg_scld_2_2to3_left_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
	      			
				when "0010" =>
					vidin_data_buf_2_sc_2(23 downto 16) <= vidin_data_reg_scld_2_2to3_left_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
					
				when "0011" =>
					vidin_data_buf_2_sc_2(31 downto 24) <= vidin_data_reg_scld_2_2to3_left_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
					
				when "0100" =>
					vidin_data_buf_2_sc_2(39 downto 32) <= vidin_data_reg_scld_2_2to3_left_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
					
				when "0101" =>
					vidin_data_buf_2_sc_2(47 downto 40) <= vidin_data_reg_scld_2_2to3_left_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
					
				when "0110" =>
					vidin_data_buf_2_sc_2(55 downto 48) <= vidin_data_reg_scld_2_2to3_left_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
			  	
				when "0111" =>
				    vidin_data_buf_sc_2 <= vidin_data_reg_scld_2_2to3_left_reg & --xor vidin_data_reg_scld_2_2to3_right_reg) &
					vidin_data_buf_2_sc_2(55 downto 0);

		      		vidin_addr_buf_sc_2 <= "0000" & svid_comp_switch_2to3
								& '0' & vidin_addr_reg_2to3_reg(16 downto 10)
								&(45 + ('0' & vidin_addr_reg_2to3_reg(8 downto 4)));

				when "1000" =>
					vidin_data_buf_2_sc_2(7 downto 0) <=vidin_data_reg_scld_2_2to3_right_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
					
				when "1001" =>
					vidin_data_buf_2_sc_2(15 downto 8) <= vidin_data_reg_scld_2_2to3_right_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
	      			
				when "1010" =>
					vidin_data_buf_2_sc_2(23 downto 16) <= vidin_data_reg_scld_2_2to3_right_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
					
				when "1011" =>
					vidin_data_buf_2_sc_2(31 downto 24) <= vidin_data_reg_scld_2_2to3_right_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
					
				when "1100" =>
					vidin_data_buf_2_sc_2(39 downto 32) <= vidin_data_reg_scld_2_2to3_right_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
					
				when "1101" =>
					vidin_data_buf_2_sc_2(47 downto 40) <= vidin_data_reg_scld_2_2to3_right_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
					
				when "1110" =>
					vidin_data_buf_2_sc_2(55 downto 48) <= vidin_data_reg_scld_2_2to3_right_reg; -- xor vidin_data_reg_scld_2_2to3_right_reg;
			  	
				when "1111" =>
				    vidin_data_buf_sc_2 <= vidin_data_reg_scld_2_2to3_right_reg & --xor vidin_data_reg_scld_2_2to3_right_reg) &
					vidin_data_buf_2_sc_2(55 downto 0);

		      		vidin_addr_buf_sc_2 <= "0000" & svid_comp_switch_2to3
								& '0' & vidin_addr_reg_2to3_reg(16 downto 10)
								&(45 + ('0' & vidin_addr_reg_2to3_reg(8 downto 4)));


					end case;
			end if;


			if (vidin_new_data_scld_4_2to3_left_reg = '1')   then  
			
       		   	 case ( svid_comp_switch_2to3 & vidin_addr_reg_2to3_reg(4 downto 2)) is
				when "0000" =>
					vidin_data_buf_2_sc_4(7 downto 0) <= vidin_data_reg_scld_4_2to3_left_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
					
				when "0001" =>
					vidin_data_buf_2_sc_4(15 downto 8) <= vidin_data_reg_scld_4_2to3_left_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
	      			
				when "0010" =>
					vidin_data_buf_2_sc_4(23 downto 16) <= vidin_data_reg_scld_4_2to3_left_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
					
				when "0011" =>
					vidin_data_buf_2_sc_4(31 downto 24) <= vidin_data_reg_scld_4_2to3_left_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
					
				when "0100" =>
					vidin_data_buf_2_sc_4(39 downto 32) <= vidin_data_reg_scld_4_2to3_left_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
					
				when "0101" =>
					vidin_data_buf_2_sc_4(47 downto 40) <= vidin_data_reg_scld_4_2to3_left_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
					
				when "0110" =>
					vidin_data_buf_2_sc_4(55 downto 48) <= vidin_data_reg_scld_4_2to3_left_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
			  	
				when "0111" =>
				    vidin_data_buf_sc_4 <= vidin_data_reg_scld_4_2to3_left_reg & --xor vidin_data_reg_scld_4_2to3_right_reg) &
					vidin_data_buf_2_sc_4(55 downto 0);

		       
					vidin_addr_buf_sc_4 <= "0000" & svid_comp_switch_2to3
								& (128 + ("00" & vidin_addr_reg_2to3_reg(16 downto 11)))
								& (45 + ("00" & vidin_addr_reg_2to3_reg(8 downto 5)));
				
				when "1000" =>
					vidin_data_buf_2_sc_4(7 downto 0) <= vidin_data_reg_scld_4_2to3_right_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
					
				when "1001" =>
					vidin_data_buf_2_sc_4(15 downto 8) <= vidin_data_reg_scld_4_2to3_right_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
	      			
				when "1010" =>
					vidin_data_buf_2_sc_4(23 downto 16) <= vidin_data_reg_scld_4_2to3_right_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
					
				when "1011" =>
					vidin_data_buf_2_sc_4(31 downto 24) <= vidin_data_reg_scld_4_2to3_right_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
					
				when "1100" =>
					vidin_data_buf_2_sc_4(39 downto 32) <= vidin_data_reg_scld_4_2to3_right_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
					
				when "1101" =>
					vidin_data_buf_2_sc_4(47 downto 40) <= vidin_data_reg_scld_4_2to3_right_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
					
				when "1110" =>
					vidin_data_buf_2_sc_4(55 downto 48) <= vidin_data_reg_scld_4_2to3_right_reg; -- xor vidin_data_reg_scld_4_2to3_right_reg;
			  	
				when "1111" =>
				    vidin_data_buf_sc_4 <= vidin_data_reg_scld_4_2to3_right_reg & --xor vidin_data_reg_scld_4_2to3_right_reg) &
					vidin_data_buf_2_sc_4(55 downto 0);

		       
					vidin_addr_buf_sc_4 <= "0000" & svid_comp_switch_2to3
								& (128 + ("00" & vidin_addr_reg_2to3_reg(16 downto 11)))
								& (45 + ("00" & vidin_addr_reg_2to3_reg(8 downto 5)));
				
					end case;
			end if;


		end if;
	end process;

end arch_sv_chip1;

