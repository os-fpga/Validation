library ieee;
use ieee.std_logic_1164.all;

entity uoft_stereo_vision is port(
	y_in : in std_logic_vector(15 downto 0);
	x_in : in std_logic_vector(15 downto 0);
	tm3_vidin_vpo : in std_logic_vector(15 downto 0);
	tm3_vidin_rts0 : in std_logic;
	tm3_vidin_cref : in std_logic;
	tm3_vidin_href : in std_logic;
	tm3_vidin_vs : in std_logic;
	tm3_vidin_llc : in std_logic;
	tm3_clk_v2 : in std_logic;
	tm3_clk_v0 : in std_logic;
	depth_out : out std_logic_vector(15 downto 0);
	tm3_vidout_blank : out std_logic;
	tm3_vidout_vsync : out std_logic;
	tm3_vidout_hsync : out std_logic;
	tm3_vidout_clock : out std_logic;
	tm3_vidout_blue : out std_logic_vector(9 downto 0);
	tm3_vidout_green : out std_logic_vector(9 downto 0);
	tm3_vidout_red : out std_logic_vector(9 downto 0);
	tm3_sram_adsp0 : out std_logic;
	tm3_sram_oe0 : out std_logic_vector(1 downto 0);
	tm3_sram_we0 : out std_logic_vector(7 downto 0);
	tm3_sram_addr0 : out std_logic_vector(18 downto 0);
	tm3_sram_data0 : inout std_logic_vector(63 downto 0);

	tm3_sram_adsp1 : out std_logic;
	tm3_sram_oe1 : out std_logic_vector(1 downto 0);
	tm3_sram_we1 : out std_logic_vector(7 downto 0);
	tm3_sram_addr1 : out std_logic_vector(18 downto 0);
	tm3_sram_data1 : inout std_logic_vector(63 downto 0);

	tm3_sram_adsp2 : out std_logic;
	tm3_sram_oe2 : out std_logic_vector(1 downto 0);
	tm3_sram_we2 : out std_logic_vector(7 downto 0);
	tm3_sram_addr2 : out std_logic_vector(18 downto 0);
	tm3_sram_data2 : inout std_logic_vector(63 downto 0);

	tm3_vidin_scl : out std_logic;
	tm3_vidin_sda : inout std_logic);
end;

architecture arch_uoft_stereo_vision of uoft_stereo_vision is
	signal v_d_reg_s4_right_2to0 : std_logic_vector(7 downto 0);
	signal v_d_reg_s2_right_2to0 : std_logic_vector(7 downto 0);
	signal v_d_reg_s1_right_2to0 : std_logic_vector(7 downto 0);
	signal v_nd_s4_right_2to0 : std_logic;
	signal v_nd_s2_right_2to0 : std_logic;
	signal v_nd_s1_right_2to0 : std_logic;
	signal v_d_reg_s4_left_2to0 : std_logic_vector(7 downto 0);
	signal v_d_reg_s2_left_2to0 : std_logic_vector(7 downto 0);
	signal v_d_reg_s1_left_2to0 : std_logic_vector(7 downto 0);
	signal v_nd_s4_left_2to0 : std_logic;
	signal v_nd_s2_left_2to0 : std_logic;
	signal v_nd_s1_left_2to0 : std_logic;
	signal counter_out_1to0 : std_logic_vector(2 downto 0);
	signal bus_word_6_1to0 : std_logic_vector(7 downto 0);
	signal bus_word_5_1to0 : std_logic_vector(7 downto 0);
	signal bus_word_4_1to0 : std_logic_vector(7 downto 0);
	signal bus_word_3_1to0 : std_logic_vector(7 downto 0);
	signal bus_word_2_1to0 : std_logic_vector(7 downto 0);
	signal bus_word_1_1to0 : std_logic_vector(7 downto 0);
	signal vidin_addr_reg_2to0 : std_logic_vector(3 downto 0);
	signal vidin_rgb_reg_fifo_right : std_logic_vector(7 downto 0);
	signal vidin_rgb_reg_fifo_left : std_logic_vector(7 downto 0);
	signal vidin_new_data_fifo : std_logic;
	signal bus_word_6_2to1 : std_logic_vector(15 downto 0);
	signal bus_word_5_2to1 : std_logic_vector(15 downto 0);
	signal bus_word_4_2to1 : std_logic_vector(15 downto 0);
	signal bus_word_3_2to1 : std_logic_vector(15 downto 0);
	signal counter_out_2to1 : std_logic_vector(2 downto 0);
	signal svid_comp_switch : std_logic;
	signal vidin_addr_reg : std_logic_vector(18 downto 0);
	signal vidin_rgb_reg : std_logic_vector(7 downto 0);
	signal vidin_new_data : std_logic;

component sv_chip0
	port(
	tm3_clk_v0 : in std_logic;
	tm3_sram_data : inout std_logic_vector(63 downto 0);
	tm3_sram_addr : out std_logic_vector(18 downto 0);
	tm3_sram_we : out std_logic_vector(7 downto 0);
	tm3_sram_oe : out std_logic_vector(1 downto 0);
	tm3_sram_adsp : out std_logic;
	bus_word_1_1to0 : in std_logic_vector(7 downto 0);
	bus_word_2_1to0 : in std_logic_vector(7 downto 0);
	bus_word_3_1to0 : in std_logic_vector(7 downto 0);
	bus_word_4_1to0 : in std_logic_vector(7 downto 0);
	bus_word_5_1to0 : in std_logic_vector(7 downto 0);
	bus_word_6_1to0 : in std_logic_vector(7 downto 0);
	counter_out_1to0 : in std_logic_vector(2 downto 0);
	vidin_new_data_fifo : in std_logic;
	vidin_rgb_reg_fifo_left : in std_logic_vector(7 downto 0);
	vidin_rgb_reg_fifo_right : in std_logic_vector(7 downto 0);
	vidin_addr_reg_2to0 : in std_logic_vector(3 downto 0);
	v_nd_s1_left_2to0 : out std_logic;
	v_nd_s2_left_2to0 : out std_logic;
	v_nd_s4_left_2to0 : out std_logic;
	v_d_reg_s1_left_2to0 : out std_logic_vector(7 downto 0);
	v_d_reg_s2_left_2to0 : out std_logic_vector(7 downto 0);
	v_d_reg_s4_left_2to0 : out std_logic_vector(7 downto 0);
	v_nd_s1_right_2to0 : out std_logic;
	v_nd_s2_right_2to0 : out std_logic;
	v_nd_s4_right_2to0 : out std_logic;
	v_d_reg_s1_right_2to0 : out std_logic_vector(7 downto 0);
	v_d_reg_s2_right_2to0 : out std_logic_vector(7 downto 0);
	v_d_reg_s4_right_2to0 : out std_logic_vector(7 downto 0);
	tm3_vidout_red : out std_logic_vector(9 downto 0);
	tm3_vidout_green : out std_logic_vector(9 downto 0);
	tm3_vidout_blue : out std_logic_vector(9 downto 0);
	tm3_vidout_clock : out std_logic;
	tm3_vidout_hsync : out std_logic;
	tm3_vidout_vsync : out std_logic;
	tm3_vidout_blank : out std_logic;
	x_in : in std_logic_vector(15 downto 0);
	y_in : in std_logic_vector(15 downto 0);
	depth_out : out std_logic_vector(15 downto 0));
end component;


component sv_chip1
	port(
	tm3_clk_v0 : in std_logic;
	tm3_sram_data : inout std_logic_vector(63 downto 0);
	tm3_sram_addr : out std_logic_vector(18 downto 0);
	tm3_sram_we : out std_logic_vector(7 downto 0);
	tm3_sram_oe : out std_logic_vector(1 downto 0);
	tm3_sram_adsp : out std_logic;
	bus_word_3_2to1 : in std_logic_vector(15 downto 0);
	bus_word_4_2to1 : in std_logic_vector(15 downto 0);
	bus_word_5_2to1 : in std_logic_vector(15 downto 0);
	bus_word_6_2to1 : in std_logic_vector(15 downto 0);
	counter_out_2to1 : in std_logic_vector(2 downto 0);
	bus_word_1_1to0 : out std_logic_vector(7 downto 0);
	bus_word_2_1to0 : out std_logic_vector(7 downto 0);
	bus_word_3_1to0 : out std_logic_vector(7 downto 0);
	bus_word_4_1to0 : out std_logic_vector(7 downto 0);
	bus_word_5_1to0 : out std_logic_vector(7 downto 0);
	bus_word_6_1to0 : out std_logic_vector(7 downto 0);
	counter_out_1to0 : out std_logic_vector(2 downto 0));
end component;


component sv_chip2
	port(
	tm3_clk_v0 : in std_logic;
	tm3_sram_data : inout std_logic_vector(63 downto 0);
	tm3_sram_addr : out std_logic_vector(18 downto 0);
	tm3_sram_we : out std_logic_vector(7 downto 0);
	tm3_sram_oe : out std_logic_vector(1 downto 0);
	tm3_sram_adsp : out std_logic;
	vidin_new_data : in std_logic;
	vidin_rgb_reg : in std_logic_vector(7 downto 0);
	vidin_addr_reg : in std_logic_vector(18 downto 0);
	svid_comp_switch : in std_logic;
	counter_out_2to1 : out std_logic_vector(2 downto 0);
	bus_word_3_2to1 : out std_logic_vector(15 downto 0);
	bus_word_4_2to1 : out std_logic_vector(15 downto 0);
	bus_word_5_2to1 : out std_logic_vector(15 downto 0);
	bus_word_6_2to1 : out std_logic_vector(15 downto 0);
	vidin_new_data_fifo : out std_logic;
	vidin_rgb_reg_fifo_left : out std_logic_vector(7 downto 0);
	vidin_rgb_reg_fifo_right : out std_logic_vector(7 downto 0);
	vidin_addr_reg_2to0 : out std_logic_vector(3 downto 0);
	v_nd_s1_left_2to0 : in std_logic;
	v_nd_s2_left_2to0 : in std_logic;
	v_nd_s4_left_2to0 : in std_logic;
	v_d_reg_s1_left_2to0 : in std_logic_vector(7 downto 0);
	v_d_reg_s2_left_2to0 : in std_logic_vector(7 downto 0);
	v_d_reg_s4_left_2to0 : in std_logic_vector(7 downto 0);
	v_nd_s1_right_2to0 : in std_logic;
	v_nd_s2_right_2to0 : in std_logic;
	v_nd_s4_right_2to0 : in std_logic;
	v_d_reg_s1_right_2to0 : in std_logic_vector(7 downto 0);
	v_d_reg_s2_right_2to0 : in std_logic_vector(7 downto 0);
	v_d_reg_s4_right_2to0 : in std_logic_vector(7 downto 0));
end component;


component sv_chip3
	port(
	tm3_clk_v0 : in std_logic;
	tm3_clk_v2 : in std_logic;
	tm3_vidin_llc : in std_logic;
	tm3_vidin_vs : in std_logic;
	tm3_vidin_href : in std_logic;
	tm3_vidin_cref : in std_logic;
	tm3_vidin_rts0 : in std_logic;
	tm3_vidin_vpo : in std_logic_vector(15 downto 0);
	tm3_vidin_sda : inout std_logic;
	tm3_vidin_scl : out std_logic;
	vidin_new_data : out std_logic;
	vidin_rgb_reg : out std_logic_vector(7 downto 0);
	vidin_addr_reg : out std_logic_vector(18 downto 0);
	svid_comp_switch : out std_logic);
end component;

begin


sv_chip0_inst: sv_chip0 port map (
	tm3_clk_v0 => tm3_clk_v0,
	tm3_sram_data => tm3_sram_data0,
	tm3_sram_addr => tm3_sram_addr0,
	tm3_sram_we => tm3_sram_we0,
	tm3_sram_oe => tm3_sram_oe0,
	tm3_sram_adsp => tm3_sram_adsp0,
	bus_word_1_1to0 => bus_word_1_1to0,
	bus_word_2_1to0 => bus_word_2_1to0,
	bus_word_3_1to0 => bus_word_3_1to0,
	bus_word_4_1to0 => bus_word_4_1to0,
	bus_word_5_1to0 => bus_word_5_1to0,
	bus_word_6_1to0 => bus_word_6_1to0,
	counter_out_1to0 => counter_out_1to0,
	vidin_new_data_fifo => vidin_new_data_fifo,
	vidin_rgb_reg_fifo_left => vidin_rgb_reg_fifo_left,
	vidin_rgb_reg_fifo_right => vidin_rgb_reg_fifo_right,
	vidin_addr_reg_2to0 => vidin_addr_reg_2to0,
	v_nd_s1_left_2to0 => v_nd_s1_left_2to0,
	v_nd_s2_left_2to0 => v_nd_s2_left_2to0,
	v_nd_s4_left_2to0 => v_nd_s4_left_2to0,
	v_d_reg_s1_left_2to0 => v_d_reg_s1_left_2to0,
	v_d_reg_s2_left_2to0 => v_d_reg_s2_left_2to0,
	v_d_reg_s4_left_2to0 => v_d_reg_s4_left_2to0,
	v_nd_s1_right_2to0 => v_nd_s1_right_2to0,
	v_nd_s2_right_2to0 => v_nd_s2_right_2to0,
	v_nd_s4_right_2to0 => v_nd_s4_right_2to0,
	v_d_reg_s1_right_2to0 => v_d_reg_s1_right_2to0,
	v_d_reg_s2_right_2to0 => v_d_reg_s2_right_2to0,
	v_d_reg_s4_right_2to0 => v_d_reg_s4_right_2to0,
	tm3_vidout_red => tm3_vidout_red,
	tm3_vidout_green => tm3_vidout_green,
	tm3_vidout_blue => tm3_vidout_blue,
	tm3_vidout_clock => tm3_vidout_clock,
	tm3_vidout_hsync => tm3_vidout_hsync,
	tm3_vidout_vsync => tm3_vidout_vsync,
	tm3_vidout_blank => tm3_vidout_blank,
	x_in => x_in,
	y_in => y_in,
	depth_out => depth_out);

sv_chip1_inst: sv_chip1 port map (
	tm3_clk_v0 => tm3_clk_v0,
	tm3_sram_data => tm3_sram_data1,
	tm3_sram_addr => tm3_sram_addr1,
	tm3_sram_we => tm3_sram_we1,
	tm3_sram_oe => tm3_sram_oe1,
	tm3_sram_adsp => tm3_sram_adsp1,
	bus_word_3_2to1 => bus_word_3_2to1,
	bus_word_4_2to1 => bus_word_4_2to1,
	bus_word_5_2to1 => bus_word_5_2to1,
	bus_word_6_2to1 => bus_word_6_2to1,
	counter_out_2to1 => counter_out_2to1,
	bus_word_1_1to0 => bus_word_1_1to0,
	bus_word_2_1to0 => bus_word_2_1to0,
	bus_word_3_1to0 => bus_word_3_1to0,
	bus_word_4_1to0 => bus_word_4_1to0,
	bus_word_5_1to0 => bus_word_5_1to0,
	bus_word_6_1to0 => bus_word_6_1to0,
	counter_out_1to0 => counter_out_1to0);

sv_chip2_inst: sv_chip2 port map (
	tm3_clk_v0 => tm3_clk_v0,
	tm3_sram_data => tm3_sram_data2,
	tm3_sram_addr => tm3_sram_addr2,
	tm3_sram_we => tm3_sram_we2,
	tm3_sram_oe => tm3_sram_oe2,
	tm3_sram_adsp => tm3_sram_adsp2,
	vidin_new_data => vidin_new_data,
	vidin_rgb_reg => vidin_rgb_reg,
	vidin_addr_reg => vidin_addr_reg,
	svid_comp_switch => svid_comp_switch,
	counter_out_2to1 => counter_out_2to1,
	bus_word_3_2to1 => bus_word_3_2to1,
	bus_word_4_2to1 => bus_word_4_2to1,
	bus_word_5_2to1 => bus_word_5_2to1,
	bus_word_6_2to1 => bus_word_6_2to1,
	vidin_new_data_fifo => vidin_new_data_fifo,
	vidin_rgb_reg_fifo_left => vidin_rgb_reg_fifo_left,
	vidin_rgb_reg_fifo_right => vidin_rgb_reg_fifo_right,
	vidin_addr_reg_2to0 => vidin_addr_reg_2to0,
	v_nd_s1_left_2to0 => v_nd_s1_left_2to0,
	v_nd_s2_left_2to0 => v_nd_s2_left_2to0,
	v_nd_s4_left_2to0 => v_nd_s4_left_2to0,
	v_d_reg_s1_left_2to0 => v_d_reg_s1_left_2to0,
	v_d_reg_s2_left_2to0 => v_d_reg_s2_left_2to0,
	v_d_reg_s4_left_2to0 => v_d_reg_s4_left_2to0,
	v_nd_s1_right_2to0 => v_nd_s1_right_2to0,
	v_nd_s2_right_2to0 => v_nd_s2_right_2to0,
	v_nd_s4_right_2to0 => v_nd_s4_right_2to0,
	v_d_reg_s1_right_2to0 => v_d_reg_s1_right_2to0,
	v_d_reg_s2_right_2to0 => v_d_reg_s2_right_2to0,
	v_d_reg_s4_right_2to0 => v_d_reg_s4_right_2to0);

sv_chip3_inst: sv_chip3 port map (
	tm3_clk_v0 => tm3_clk_v0,
	tm3_clk_v2 => tm3_clk_v2,
	tm3_vidin_llc => tm3_vidin_llc,
	tm3_vidin_vs => tm3_vidin_vs,
	tm3_vidin_href => tm3_vidin_href,
	tm3_vidin_cref => tm3_vidin_cref,
	tm3_vidin_rts0 => tm3_vidin_rts0,
	tm3_vidin_vpo => tm3_vidin_vpo,
	tm3_vidin_sda => tm3_vidin_sda,
	tm3_vidin_scl => tm3_vidin_scl,
	vidin_new_data => vidin_new_data,
	vidin_rgb_reg => vidin_rgb_reg,
	vidin_addr_reg => vidin_addr_reg,
	svid_comp_switch => svid_comp_switch);

end arch_uoft_stereo_vision;
