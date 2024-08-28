library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity scl_h_fltr is port(
	clk : in std_logic;
	nd : in std_logic;
	d_in_1 : in std_logic_vector(7 downto 0);
	d_in_2 : in std_logic_vector(7 downto 0);
	d_in_4 : in std_logic_vector(7 downto 0);
	d_out_1 : out std_logic_vector(7 downto 0);
	d_out_2 : out std_logic_vector(7 downto 0);
	d_out_4 : out std_logic_vector(7 downto 0));
end scl_h_fltr;

architecture arch_scl_h_fltr of scl_h_fltr is
	signal buff_out_2,buff_out_reg_2: tap_array;
	signal buff_out_4,buff_out_reg_4: tap_array;
	signal add_2_tmp_1,add_2_tmp_2,add_2_tmp : std_logic_vector(9 downto 0);
	signal add_4_tmp_1,add_4_tmp_2,add_4_tmp_3,add_4_tmp_4,
			add_4_tmp_5,add_4_tmp_6,add_4_tmp_7,add_4_tmp_8,
			add_4_tmp: std_logic_vector(11 downto 0);

	component sh_reg_1 generic(sh_reg_w :integer);
	port(clk : in std_logic;
		wen : in std_logic;
		din_1 : in std_logic_vector(sh_reg_w-1 downto 0);
		dout_1: out std_logic_vector(sh_reg_w-1 downto 0));
	end component;


begin
    buff_out_2(0) <= d_in_2;
    buff_out_4(0) <= d_in_4;

	gen0 : for i in 0 to 3 generate
					ints_sh_reg_2 : sh_reg_1
									generic map(8)
									port map(
											clk,
											nd,
											buff_out_2(i),
											buff_out_2(i+1));
	end generate;

	gen1 : for i in 0 to 7 generate
					ints_sh_reg_4 : sh_reg_1
									generic map(8)
									port map(
											clk,
											nd,
											buff_out_4(i),
											buff_out_4(i+1));
	end generate;


process(clk) begin
	if (clk'event and clk = '1') then		
		if nd = '1' then
			buff_out_reg_4(1) <= buff_out_4(1);
			buff_out_reg_4(2) <= buff_out_4(2);
			buff_out_reg_4(3) <= buff_out_4(3);
			buff_out_reg_4(4) <= buff_out_4(4);
			buff_out_reg_4(5) <= buff_out_4(5);
			buff_out_reg_4(6) <= buff_out_4(6);
			buff_out_reg_4(7) <= buff_out_4(7);
		

			buff_out_reg_2(1) <= buff_out_2(1);
			buff_out_reg_2(2) <= buff_out_2(2);
			buff_out_reg_2(3) <= buff_out_2(3);

			d_out_1 <= d_in_1;
			d_out_2 <= add_2_tmp(9 downto 2);
			d_out_4 <= add_4_tmp(11 downto 4);	
		end if;

		add_2_tmp_1 <= ("00" & buff_out_reg_2(1)) +
						("00" & buff_out_reg_2(3)); 	
		add_2_tmp_2 <= '0' & buff_out_reg_2(2) & '0';
		add_2_tmp <= add_2_tmp_1 + add_2_tmp_2;


		add_4_tmp_1 <= ("0000" & buff_out_reg_4(1)) +
						("0000" & buff_out_reg_4(7));

		add_4_tmp_2 <= ("000" & buff_out_reg_4(2) & '0') +
						("000" & buff_out_reg_4(6) & '0'); 	

		add_4_tmp_3 <= ("000" & buff_out_reg_4(3) & '0') +
						("000" & buff_out_reg_4(5) & '0'); 	

		add_4_tmp_4 <= ("0000" & buff_out_reg_4(3)) +
						("0000" & buff_out_reg_4(5));

		add_4_tmp_5 <= ("00" & buff_out_reg_4(4) & "00");

		add_4_tmp_6 <= add_4_tmp_1 + add_4_tmp_2;
		add_4_tmp_7 <= add_4_tmp_3 + add_4_tmp_4;
		add_4_tmp_8 <= add_4_tmp_5 + add_4_tmp_6;
		add_4_tmp <= add_4_tmp_7 + add_4_tmp_8;
	end if;
end process;

end arch_scl_h_fltr;
