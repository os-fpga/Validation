library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity wrapper_norm_corr_10 is 
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
		corr_out_10: out std_logic_vector(2*sh_reg_w-1 downto 0));
end wrapper_norm_corr_10;

architecture arch_wrapper_norm_corr_10 of wrapper_norm_corr_10 is       

--constant sh_reg_w : natural :=8;

signal d_l_1_nrm,d_l_2_nrm,d_r_1_nrm,d_r_2_nrm:std_logic_vector(sh_reg_w-1 downto 0);
		
component wrapper_corr_10
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
		corr_out_2 : out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_3 : out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_4 : out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_5 : out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_6 : out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_7 : out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_8 : out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_9 : out std_logic_vector(2*sh_reg_w-1 downto 0);
		corr_out_10:  out std_logic_vector(2*sh_reg_w-1 downto 0));
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

corr_5_inst: 	wrapper_corr_10
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
						corr_out_10 => corr_out_10);

end arch_wrapper_norm_corr_10;
