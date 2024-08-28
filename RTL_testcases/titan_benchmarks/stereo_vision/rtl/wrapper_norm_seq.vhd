library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity wrapper_norm_seq is 
		generic(
			sh_reg_w :integer);
		port(
			clk: in std_logic;
			nd: in std_logic;
			din_1: in std_logic_vector(15 downto 0);
			din_2: in std_logic_vector(15 downto 0);
			dout_1: out std_logic_vector(sh_reg_w-1 downto 0);
			dout_2: out std_logic_vector(sh_reg_w-1 downto 0));
 	 	end wrapper_norm_seq;

architecture arch_wrapper_norm_seq of wrapper_norm_seq is       

--constant sh_reg_w : natural :=8;
signal din_1_reg,din_2_reg: std_logic_vector(15 downto 0);
signal din_1_tmp1,din_2_tmp1:std_logic_vector(15 downto 0); 
signal din_1_tmp2,din_2_tmp2:std_logic_vector(15 downto 0); 
signal addin_1,addin_2 :std_logic_vector(15 downto 0); 
signal	add_out: std_logic_vector(16 downto 0);

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component my_div_16_slow
	port (
	dividend: IN std_logic_VECTOR(15 downto 0);
	divisor: IN std_logic_VECTOR(16 downto 0);
	quot: OUT std_logic_VECTOR(15 downto 0);
	remd: OUT std_logic_VECTOR(7 downto 0);
	c: IN std_logic);
end component;
-- Synplicity black box declaration

begin


------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
my_div_inst_1 : my_div_16_slow
		port map (
			 din_1_tmp2,
			 add_out,
			 open,
			 dout_1,
			 clk);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
				
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
my_div_inst_2 : my_div_16_slow
		port map (
			 din_2_tmp2,
			 add_out,
			 open,
			 dout_2,
			 clk);
-- INST_TAG_END ------ End INSTANTIATION Template ------------

process(clk) 
	begin
		if (clk'event and clk = '1') then
			if nd = '1' then
				din_1_reg <= din_1;
				din_2_reg <= din_2;
			end if;
			
			din_1_tmp1 <= din_1_reg;
			din_1_tmp2 <= din_1_tmp1;

			din_2_tmp1 <= din_2_reg;
			din_2_tmp2 <= din_2_tmp1;
			
			if (din_1_reg(15) = '0') then
				addin_1 <= din_1_reg;
			else 
				addin_1 <= "0000000000000000" - din_1_reg;
			end if;

			if (din_2_reg(15) = '0') then
				addin_2 <= din_2_reg + "0000000000000001";
			else 
				addin_2 <= "0000000000000001" - din_2_reg;
			end if;
			
			add_out <= 	(addin_1(15) & addin_1) + 
						(addin_2(15) & addin_2);

			
		end if;
	end process;
end arch_wrapper_norm_seq;





