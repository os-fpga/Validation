library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity wrapper_norm_corr_20 is 
	generic(
		sh_reg_w :integer);
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
end wrapper_norm_corr_20;

architecture arch_wrapper_norm_corr_20 of wrapper_norm_corr_20 is       

--constant sh_reg_w : natural :=8;

signal d_l_1_nrm,d_l_2_nrm,d_r_1_nrm,d_r_2_nrm:std_logic_vector(sh_reg_w-1 downto 0);
		
component wrapper_corr_20
	generic(
		sh_reg_w :integer);
	port(
 	 	clk : in std_logic;
		wen : in std_logic;
		d_l_1 : in std_logic_vector(7 downto 0);
		d_l_2 : in std_logic_vector(7 downto 0);
		d_r_1: in std_logic_vector(7 downto 0);
		d_r_2: in std_logic_vector(7 downto 0);
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

component wrapper_norm  
		generic(
			sh_reg_w :integer);
		port(
			clk: in std_logic;
			nd: in std_logic;
			din_1: in std_logic_vector(15 downto 0);
			din_2: in std_logic_vector(15 downto 0);
			dout_1: out std_logic_vector(sh_reg_w-1 downto 0);
			dout_2: out std_logic_vector(sh_reg_w-1 downto 0));
end component;

begin

norm_inst_left: wrapper_norm
					generic map(sh_reg_w)
					port map(
						clk => clk,
						nd => wen,
						din_1 => d_l_1,
						din_2 => d_l_2,
						dout_1 => d_l_1_nrm,
						dout_2 => d_l_2_nrm);

norm_inst_right: wrapper_norm
					generic map(sh_reg_w)
					port map(
						clk => clk,
						nd => wen,
						din_1 => d_r_1,
						din_2 => d_r_2,
						dout_1 => d_r_1_nrm,
						dout_2 => d_r_2_nrm);

corr_20_inst: 	wrapper_corr_20
					generic map(sh_reg_w)
					port map(
						clk => clk, 
						wen => wen,
						d_l_1 => d_l_1_nrm,
						d_l_2 => d_l_2_nrm,
						d_r_1 => d_r_1_nrm,
						d_r_2 => d_r_2_nrm,
						corr_out_0 => corr_out_0,
						corr_out_1 => corr_out_1,
						corr_out_2 => corr_out_2,
						corr_out_3 => corr_out_3,
						corr_out_4 => corr_out_4,
						corr_out_5 => corr_out_5,
						corr_out_6 => corr_out_6,
						corr_out_7 => corr_out_7,
						corr_out_8 => corr_out_8,
						corr_out_9 => corr_out_9,
						corr_out_10 => corr_out_10,
						corr_out_11 => corr_out_11,
						corr_out_12 => corr_out_12,
						corr_out_13 => corr_out_13,
						corr_out_14 => corr_out_14,
						corr_out_15 => corr_out_15,
						corr_out_16 => corr_out_16,
						corr_out_17 => corr_out_17,
						corr_out_18 => corr_out_18,
						corr_out_19 => corr_out_19,
						corr_out_20 => corr_out_20);

end arch_wrapper_norm_corr_20;
