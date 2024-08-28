library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity wrapper_qs_intr_10_20 is 
	port(
		clk : in std_logic;
		din: in type_array_8_10;
		wen_1:in std_logic;
		wen_4: in std_logic;
		addrin: in std_logic_vector(18 downto 0);
		dout: out type_array_16_20;
		rdy : out std_logic);
end wrapper_qs_intr_10_20;

architecture arch_wrapper_qs_intr_10_20 of wrapper_qs_intr_10_20 is
	
--	signal	wen_1,wen_4,rdy :  std_logic;
--	signal din : type_array_8_5;
	signal dout_tmp : type_array_16_20; --9_20;
--	signal dout : std_logic_vector(15 downto 0);
	signal addr_tmp: std_logic_vector(7 downto 0); 
	signal dout_tt : std_logic_vector(15 downto 0);

component quadintr_10_20  
	generic( sh_reg_w : integer);
	port(
		clk: in std_logic;
		new_data : in std_logic;
		din : in type_array_8_10;
		dout : out type_array_16_20);
end component;

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component my_ram
	port (
	addr: IN std_logic_VECTOR(7 downto 0);
	clk: IN std_logic;
	din: IN std_logic_VECTOR(15 downto 0);
	dout: OUT std_logic_VECTOR(15 downto 0);
	nd: IN std_logic;
	rfd: OUT std_logic;
	rdy: OUT std_logic;
	we: IN std_logic);
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

	


begin

--dout_tt <= "0000000" & dout_tmp(0);
addr_tmp <= addrin(8 downto 1);

my_inst_ram_0: my_ram	port map(
			 addr_tmp,
			 clk,
			 dout_tmp(0),
			 dout(0),
			 wen_1,
			 open,
			 rdy,
			 wen_4);
			

gen_label: for i in 1 to 20 generate
			my_inst_ram: my_ram	port map(
			 addr_tmp,
			 clk,
			 dout_tmp(i),
			 dout(i),
			 wen_1,
			 open,
			 open,
			 wen_4);
			--dout(i) <= "0000000000000000";
end generate;

my_inst_quadintr: quadintr_10_20 
		generic map(8)
		port map(
			clk,
			wen_4,
			din,
			dout_tmp);

--my_inst_ram: my_ram
--		port map(
--			 addr_tmp,
--			 clk,
--			 dout_tt,
--			 dout(0),
--			 wen_1,
--			 open,
--			 rdy,
--			 wen_4);
			

end arch_wrapper_qs_intr_10_20;



