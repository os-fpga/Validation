library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity steer_fltr is port(
		clk: in std_logic;
		new_data: in std_logic;
		f1: in std_logic_vector(27 downto 0);
		f2: in std_logic_vector(27 downto 0);
		f3: in std_logic_vector(27 downto 0);
		h1: in std_logic_vector(27 downto 0);
		h2: in std_logic_vector(27 downto 0);
		h3: in std_logic_vector(27 downto 0);
		h4: in std_logic_vector(27 downto 0);
		re_z : out std_logic_vector(15 downto 0);
		im_z : out std_logic_vector(15 downto 0);
		re_p : out std_logic_vector(15 downto 0);
		im_p : out std_logic_vector(15 downto 0);
		re_n : out std_logic_vector(15 downto 0);
		im_n : out std_logic_vector(15 downto 0));
end steer_fltr;

architecture arch_steer_fltr of steer_fltr is

	signal 	f1_reg,f2_reg,f3_reg,h1_reg,h2_reg,h3_reg,h4_reg: std_logic_vector(27 downto 0);
	signal re_z_tmp_1,im_z_tmp_1,re_p_tmp_1,re_p_tmp_2,re_p_tmp_3,im_p_tmp_1,
		im_p_tmp_2,im_p_tmp_3,im_p_tmp_4 : std_logic_vector( 28 downto 0);
	signal re_z_tmp,im_z_tmp,re_p_tmp,im_p_tmp,re_n_tmp,im_n_tmp : std_logic_vector(30 downto 0);
begin
process(clk) begin
	if(clk'event and clk = '1') then
		if new_data = '1' then 
			f1_reg <= f1;
		 	f2_reg <= f2;
			f3_reg <= f3;
			h1_reg <= h1;
			h2_reg <= h2;
			h3_reg <= h3;
			h4_reg <= h4;
		end if;
	end if;
end process;



process(clk) begin
	if(clk'event and clk = '1') then
		
		re_z_tmp_1 <= f1_reg(27) & f1_reg;
		im_z_tmp_1 <= h1_reg(27) & h1_reg;

		re_p_tmp_1 <= f1_reg(27) & f1_reg(27) & f1_reg(27 downto 1);
		re_p_tmp_2 <= f3_reg(27) & f3_reg(27 downto 0);
		re_p_tmp_3 <= f2_reg(27) & f2_reg(27) & f2_reg(27 downto 1); 

		im_p_tmp_1 <= (h1_reg(27) & h1_reg(27) & h1_reg(27) & h1_reg(27 downto 2))+
			(h1_reg(27) & h1_reg(27) & h1_reg(27) & h1_reg(27) & h1_reg(27 downto 3));
		 
		im_p_tmp_2 <= (h4_reg(27) & h4_reg) +
		(h4_reg(27) & h4_reg(27) & h4_reg(27) & h4_reg(27) & h4_reg(27) & h4_reg(27 downto 4));
		
		im_p_tmp_3 <= (h3_reg(27) & h3_reg) +
		(h3_reg(27) & h3_reg(27) & h3_reg(27) & h3_reg(27) & h3_reg(27) & h3_reg(27 downto 4));
	
		im_p_tmp_4 <=  (h2_reg(27) & h2_reg(27) & h2_reg(27) & h2_reg(27 downto 2))+
			(h2_reg(27) & h2_reg(27) & h2_reg(27) & h2_reg(27) & h2_reg(27 downto 3));
		
		re_z_tmp <= re_z_tmp_1(28) & re_z_tmp_1(28) & re_z_tmp_1;
		im_z_tmp <= im_z_tmp_1(28) & im_z_tmp_1(28) & im_z_tmp_1;

		re_p_tmp <= (re_p_tmp_1(28) & re_p_tmp_1(28) & re_p_tmp_1) - 
					(re_p_tmp_2(28) & re_p_tmp_2(28) & re_p_tmp_2) + 
					(re_p_tmp_3(28) & re_p_tmp_3(28) & re_p_tmp_3);
 
		im_p_tmp <= (im_p_tmp_1(28) & im_p_tmp_1(28) & im_p_tmp_1)- 
					(im_p_tmp_2(28) & im_p_tmp_2(28) & im_p_tmp_2) + 
					(im_p_tmp_3(28) & im_p_tmp_3(28) & im_p_tmp_3) - 
					(im_p_tmp_4(28) & im_p_tmp_4(28) & im_p_tmp_4);

		re_n_tmp <= (re_p_tmp_1(28) & re_p_tmp_1(28) & re_p_tmp_1) +
					(re_p_tmp_2(28) & re_p_tmp_2(28) & re_p_tmp_2) + 
					(re_p_tmp_3(28) & re_p_tmp_3(28) & re_p_tmp_3);
 
		im_n_tmp <= (im_p_tmp_1(28) & im_p_tmp_1(28) & im_p_tmp_1) +
					(im_p_tmp_2(28) & im_p_tmp_2(28) & im_p_tmp_2) + 
					(im_p_tmp_3(28) & im_p_tmp_3(28) & im_p_tmp_3) +
					(im_p_tmp_4(28) & im_p_tmp_4(28) & im_p_tmp_4);
					


		re_z <= re_z_tmp(30 downto 15);
		im_z <= im_z_tmp(30 downto 15);
		re_p <= re_p_tmp(30 downto 15);
		im_p <= im_p_tmp(30 downto 15);
		re_n <= re_n_tmp(30 downto 15);
		im_n <= im_n_tmp(30 downto 15);

	end if;
end process;
end arch_steer_fltr;
