library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity scl_v_fltr is port(
	clk : in std_logic;
	nd : in std_logic;
	d_in : in std_logic_vector(7 downto 0);
	d_out_1 : out std_logic_vector(7 downto 0);
	d_out_2 : out std_logic_vector(7 downto 0);
	d_out_4 : out std_logic_vector(7 downto 0));
end scl_v_fltr;

architecture arch_scl_v_fltr of scl_v_fltr is
	signal buff_out,buff_out_reg: tap_array;
	signal add_2_tmp_1,add_2_tmp_2,add_2_tmp : std_logic_vector(9 downto 0);
	signal add_4_tmp_1,add_4_tmp_2,add_4_tmp_3,add_4_tmp_4,
			add_4_tmp_5,add_4_tmp_6,add_4_tmp_7,add_4_tmp_8,
			add_4_tmp: std_logic_vector(11 downto 0);

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
    buff_out(0) <= d_in;

	gen : for i in 0 to 7 generate
					ints_fifo_gen : my_fifo_8b
									port map(
											clk,
											buff_out(i),
											buff_out(i+1),
											nd);
	end generate;

process(clk) begin
	if (clk'event and clk = '1') then		
		if nd = '1' then
			buff_out_reg(1) <= buff_out(1);
			buff_out_reg(2) <= buff_out(2);
			buff_out_reg(3) <= buff_out(3);
			buff_out_reg(4) <= buff_out(4);
			buff_out_reg(5) <= buff_out(5);
			buff_out_reg(6) <= buff_out(6);
			buff_out_reg(7) <= buff_out(7);
		
			d_out_1 <= buff_out_reg(1);
			d_out_2 <= add_2_tmp(9 downto 2);
			d_out_4 <= add_4_tmp(11 downto 4);	
		end if;

		add_2_tmp_1 <= ("00" & buff_out_reg(1)) +
						("00" & buff_out_reg(3)); 	
		add_2_tmp_2 <= '0' & buff_out_reg(2) & '0';
		add_2_tmp <= add_2_tmp_1 + add_2_tmp_2;


		add_4_tmp_1 <= ("0000" & buff_out_reg(1)) +
						("0000" & buff_out_reg(7));

		add_4_tmp_2 <= ("000" & buff_out_reg(2) & '0') +
						("000" & buff_out_reg(6) & '0'); 	

		add_4_tmp_3 <= ("000" & buff_out_reg(3) & '0') +
						("000" & buff_out_reg(5) & '0'); 	

		add_4_tmp_4 <= ("0000" & buff_out_reg(3)) +
						("0000" & buff_out_reg(5));

		add_4_tmp_5 <= ("00" & buff_out_reg(4) & "00");

		add_4_tmp_6 <= add_4_tmp_1 + add_4_tmp_2;
		add_4_tmp_7 <= add_4_tmp_3 + add_4_tmp_4;
		add_4_tmp_8 <= add_4_tmp_5 + add_4_tmp_6;
		add_4_tmp <= add_4_tmp_7 + add_4_tmp_8;
	end if;
end process;

end arch_scl_v_fltr;
