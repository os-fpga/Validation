library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity corr is 
	generic( sh_reg_w : integer);
	port(
		clk: in std_logic;
		new_data : in std_logic;
		in_l_re : in std_logic_vector(sh_reg_w-1 downto 0);
		in_l_im : in std_logic_vector(sh_reg_w-1 downto 0);
		in_r_re : in std_logic_vector(sh_reg_w-1 downto 0);
		in_r_im : in std_logic_vector(sh_reg_w-1 downto 0);
		corr_out : out std_logic_vector(2*sh_reg_w-1 downto 0));
end corr;

architecture arch_corr of corr is

--constant sh_reg_w : natural :=8;

signal in_l_re_reg,in_l_im_reg,in_r_re_reg,in_r_im_reg : std_logic_vector(sh_reg_w-1 downto 0);
signal lrexrre,limxrim: std_logic_vector(2*sh_reg_w-1 downto 0);
signal lrexrre_rdy,limxrim_rdy: std_logic;
signal lrexrre_reg,limxrim_reg: std_logic_vector(2*sh_reg_w-1 downto 0);
signal lxr : std_logic_vector(sh_reg_w-1 downto 0);
signal corr_out_tmp : std_logic_vector(2*sh_reg_w-1 downto 0);
--signal new_data_tmp : std_logic;
------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component my_mult_8
	port (
	clk: IN std_logic;
	a: IN std_logic_VECTOR(sh_reg_w-1 downto 0);
	b: IN std_logic_VECTOR(sh_reg_w-1 downto 0);
	q: OUT std_logic_VECTOR(2*sh_reg_w-1 downto 0);
	rdy: OUT std_logic);
end component;

 --Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

	
begin
	------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
	mult1_inst_3 : my_mult_8
		port map (
			clk => clk,
			a => in_l_re, --_reg,
			b => in_r_re, --_reg,
			q => lrexrre,
			rdy => lrexrre_rdy);
	-- INST_TAG_END ------ End INSTANTIATION Template ------------

	------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
	mult1_inst_4 : my_mult_8
		port map (
			clk => clk,
			a => in_l_im, --_reg,
			b => in_r_im, --_reg,
			q => limxrim,
			rdy => limxrim_rdy);
	-- INST_TAG_END ------ End INSTANTIATION Template ------------

	
	
	--new_data_tmp <= new_data;

	process(clk) begin
		if (clk'event and clk = '1') then
			
			--new_data_tmp <= new_data;

			if new_data = '1' then
				--in_l_re_reg <= in_l_re;
				--in_l_im_reg <= in_l_im;
				--in_r_re_reg <= in_r_re;
				--in_r_im_reg <= in_r_im;
				corr_out <= corr_out_tmp;
			end if;
			
			if lrexrre_rdy = '1' then
					--lrexrre_reg <= lrexrre(2*sh_reg_w-1) & lrexrre(13 downto 7);
					lrexrre_reg <= lrexrre; 
			end if;
		
			if limxrim_rdy = '1' then
					--limxrim_reg <= limxrim(2*sh_reg_w-1) & limxrim(13 downto 7);
					limxrim_reg <= limxrim;
			end if;
			
			-- changed in norm_corr_1   may 15,2002
			-- corr_out_tmp <= lrexrre_reg - limxrim_reg;
			corr_out_tmp <= lrexrre_reg + limxrim_reg;

		end if;
	end process;
end arch_corr;


