library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lp_fltr_v1 is port(
	clk: in std_logic;
	din: in std_logic_vector(fltr_din_w-1 downto 0);
	dout_1: out std_logic_vector(fltr_din_w-1 downto 0);
	dout_2: out std_logic_vector(fltr_din_w-1 downto 0);
	nd: in std_logic);
end lp_fltr_v1;

architecture arch_lp_fltr_v1 of lp_fltr_v1 is
	
	signal din_1_reg, buff_out_1, buff_out_2 : std_logic_vector(fltr_din_w-1 downto 0); 
	signal din_2_reg,din_3_reg: std_logic_vector(fltr_din_w-1 downto 0); 
	signal add_tmp_1,add_tmp_2: std_logic_vector(fltr_din_w+1 downto 0); 

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


begin
	ints_fifo_1 : my_fifo_8b
			port map(
					clk,
					din,
					buff_out_1,
					nd);

	ints_fifo_2 : my_fifo_8b
			port map(
					clk,
					buff_out_1,
					buff_out_2,
					nd);

	process(clk) begin
		if (clk'event and clk = '1') then	
			if nd = '1' then
				din_1_reg <= din;
				din_2_reg <= buff_out_1;
				din_3_reg <= buff_out_2;			
	
				dout_1 <= din; --add_tmp_1(fltr_din_w downto 1); --din;
				dout_2 <= add_tmp_2(fltr_din_w+1 downto 2); --buff_out_1;			
			end if;

			add_tmp_1 <=  (din_3_reg(fltr_din_w-1) & din_3_reg(fltr_din_w-1) & din_3_reg) +
					(din_1_reg(fltr_din_w-1) & din_1_reg(fltr_din_w-1) & din_1_reg);
			
			add_tmp_2 <= add_tmp_1 +
					(din_2_reg(fltr_din_w-1) & din_2_reg & '0');
		end if;
	end process;
end arch_lp_fltr_v1;
