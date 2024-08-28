library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity port_bus_1to0 is 
	generic(
		corr_res_w: integer);
	port(
	clk: in std_logic;
	vidin_addr_reg: in std_logic_vector(18 downto 0);
	svid_comp_switch : in std_logic;
	vidin_new_data_scld_1_2to3_left: in std_logic;
	v_corr_05_00: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_05_01: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_05_02: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_05_03: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_05_04: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_05_05: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_00: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_01: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_02: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_03: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_04: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_05: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_06: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_07: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_08: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_09: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_10_10: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_00: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_01: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_02: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_03: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_04: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_05: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_06: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_07: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_08: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_09: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_10: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_11: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_12: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_13: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_14: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_15: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_16: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_17: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_18: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_19: in std_logic_vector(corr_res_w-1 downto 0);
	v_corr_20_20: in std_logic_vector(corr_res_w-1 downto 0);
	bus_word_1: out std_logic_vector(7 downto 0);
	bus_word_2: out std_logic_vector(7 downto 0);
	bus_word_3: out std_logic_vector(7 downto 0);
	bus_word_4: out std_logic_vector(7 downto 0);
	bus_word_5: out std_logic_vector(7 downto 0);
	bus_word_6: out std_logic_vector(7 downto 0);
	counter_out: out std_logic_vector(2 downto 0));
end port_bus_1to0;

architecture arch_port_bus_1to0 of port_bus_1to0 is

	signal bus_word_1_tmp,bus_word_2_tmp,bus_word_3_tmp,
		 bus_word_4_tmp,bus_word_5_tmp,bus_word_6_tmp: std_logic_vector(7 downto 0);
	signal vidin_addr_reg_tmp : std_logic_vector(18 downto 0);
	signal svid_comp_switch_tmp : std_logic;
	signal vidin_new_data_scld_1_2to3_left_tmp : std_logic;
--	signal vidin_new_data_scld_2_2to3_left_tmp : std_logic;
--	signal vidin_new_data_scld_4_2to3_left_tmp : std_logic;
--	signal vidin_new_data_scld_1_2to3_right_tmp : std_logic;
--	signal vidin_new_data_scld_2_2to3_right_tmp : std_logic;
--	signal vidin_new_data_scld_4_2to3_right_tmp : std_logic;
	signal counter : std_logic_vector(3 downto 0);
	signal counter_out_tmp : std_logic_vector(2 downto 0);
	
	signal v_corr_05_00_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_05_01_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_05_02_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_05_03_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_05_04_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_05_05_tmp:  std_logic_vector(corr_res_w-1 downto 0);

	signal v_corr_10_00_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_10_01_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_10_02_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_10_03_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_10_04_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_10_05_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_10_06_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_10_07_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_10_08_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_10_09_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_10_10_tmp:  std_logic_vector(corr_res_w-1 downto 0);

	signal v_corr_20_00_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_01_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_02_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_03_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_04_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_05_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_06_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_07_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_08_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_09_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_10_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_11_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_12_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_13_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_14_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_15_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_16_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_17_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_18_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_19_tmp:  std_logic_vector(corr_res_w-1 downto 0);
	signal v_corr_20_20_tmp:  std_logic_vector(corr_res_w-1 downto 0);

begin

process(clk) begin

	if (clk'event and clk = '1') then
		if vidin_new_data_scld_1_2to3_left ='1' then
				counter <= "0001";
		else 
			if counter = "1000" then
				--counter <= counter + 1;
				counter <= "1000";
			else 
				--counter <= "0111";
				counter <= counter + 1;
			end if;
		end if;
	case counter(2 downto 0) is
			when "000" => 
						counter_out_tmp <= "000";
						bus_word_1_tmp <= "00000000"; 
						bus_word_2_tmp <= "00000000"; 
						bus_word_3_tmp <= "00000000"; 
						bus_word_4_tmp <= "00000000"; 
						bus_word_5_tmp <= "00000000"; 
						bus_word_6_tmp <= "00000000"; 

			when "001" =>
						counter_out_tmp <= "001";
						bus_word_1_tmp <= vidin_addr_reg_tmp(7 downto 0); 
						bus_word_2_tmp <= vidin_addr_reg_tmp(15 downto 8);  
						bus_word_3_tmp <= vidin_addr_reg_tmp(18 downto 16) &
											svid_comp_switch_tmp &
											"0000";
						bus_word_4_tmp <= v_corr_05_00_tmp; --"00000000"; --vidin_data_reg_scld_1_2to3_left_tmp;
						bus_word_5_tmp <= v_corr_05_01_tmp; --"00000000"; --vidin_data_reg_scld_1_2to3_right_tmp;
						bus_word_6_tmp <= v_corr_05_02_tmp; --"00000000"; --vidin_data_reg_scld_1_2to3_right_tmp;

			when "010" =>
						counter_out_tmp <= "010";
						bus_word_1_tmp <=  v_corr_05_03_tmp;
						bus_word_2_tmp <=  v_corr_05_04_tmp;
						bus_word_3_tmp <=  v_corr_05_05_tmp;
						bus_word_4_tmp <=  v_corr_10_00_tmp;
						bus_word_5_tmp <=  v_corr_10_01_tmp;
						bus_word_6_tmp <=  v_corr_10_02_tmp;

			when "011" =>
						counter_out_tmp <= "011";
						bus_word_1_tmp <= v_corr_10_03_tmp;
						bus_word_2_tmp <= v_corr_10_04_tmp;
						bus_word_3_tmp <= v_corr_10_05_tmp;
						bus_word_4_tmp <= v_corr_10_06_tmp;
						bus_word_5_tmp <= v_corr_10_07_tmp;
						bus_word_6_tmp <= v_corr_10_08_tmp;

			when "100" =>
						counter_out_tmp <= "100";
						bus_word_1_tmp <= v_corr_10_09_tmp; 
						bus_word_2_tmp <= v_corr_10_10_tmp;
						bus_word_3_tmp <= v_corr_20_00_tmp; 
						bus_word_4_tmp <= v_corr_20_01_tmp;
						bus_word_5_tmp <= v_corr_20_02_tmp;
						bus_word_6_tmp <= v_corr_20_03_tmp;
			
			when "101" =>
						counter_out_tmp <= "101";
						bus_word_1_tmp <= v_corr_20_04_tmp;
						bus_word_2_tmp <= v_corr_20_05_tmp;
						bus_word_3_tmp <= v_corr_20_06_tmp;
						bus_word_4_tmp <= v_corr_20_07_tmp;
						bus_word_5_tmp <= v_corr_20_08_tmp;
						bus_word_6_tmp <= v_corr_20_09_tmp;

			when "110" =>
						counter_out_tmp <= "110";
						bus_word_1_tmp <= v_corr_20_10_tmp;
						bus_word_2_tmp <= v_corr_20_11_tmp;
						bus_word_3_tmp <= v_corr_20_12_tmp;
						bus_word_4_tmp <= v_corr_20_13_tmp;
						bus_word_5_tmp <= v_corr_20_14_tmp;
						bus_word_6_tmp <= v_corr_20_15_tmp;
			
			when "111" =>
						counter_out_tmp <= "111";
						bus_word_1_tmp <= v_corr_20_16_tmp; 
						bus_word_2_tmp <= v_corr_20_17_tmp;
						bus_word_3_tmp <= v_corr_20_18_tmp;
						bus_word_4_tmp <= v_corr_20_19_tmp;
						bus_word_5_tmp <= v_corr_20_20_tmp;
						bus_word_6_tmp <= "00000000";

			when others => 
						counter_out_tmp <= "111";
						bus_word_1_tmp <= v_corr_20_16_tmp; 
						bus_word_2_tmp <= v_corr_20_17_tmp;
						bus_word_3_tmp <= v_corr_20_18_tmp;
						bus_word_4_tmp <= v_corr_20_19_tmp;
						bus_word_5_tmp <= v_corr_20_20_tmp;
						bus_word_6_tmp <= "00000000";

			end case;
	end if;
end process;

process (clk) begin
	 if (clk'event and clk = '1') then
		
		counter_out <= counter_out_tmp;
		bus_word_1 <= bus_word_1_tmp;
		bus_word_2 <= bus_word_2_tmp;
		bus_word_3 <= bus_word_3_tmp;
		bus_word_4 <= bus_word_4_tmp;
		bus_word_5 <= bus_word_5_tmp;
		bus_word_6 <= bus_word_6_tmp;

		--if counter = "0000" then
		if vidin_new_data_scld_1_2to3_left ='1' then

				vidin_addr_reg_tmp <= vidin_addr_reg;
				svid_comp_switch_tmp <= svid_comp_switch;
				
				v_corr_05_00_tmp <= v_corr_05_00; 
				v_corr_05_01_tmp <= v_corr_05_01; 
				v_corr_05_02_tmp <= v_corr_05_02; 
				v_corr_05_03_tmp <= v_corr_05_03; 
				v_corr_05_04_tmp <= v_corr_05_04; 
				v_corr_05_05_tmp <= v_corr_05_05; 

				v_corr_10_00_tmp <= v_corr_10_00; 
				v_corr_10_01_tmp <= v_corr_10_01; 
				v_corr_10_02_tmp <= v_corr_10_02; 
				v_corr_10_03_tmp <= v_corr_10_03; 
				v_corr_10_04_tmp <= v_corr_10_04; 
				v_corr_10_05_tmp <= v_corr_10_05; 
				v_corr_10_06_tmp <= v_corr_10_06; 
				v_corr_10_07_tmp <= v_corr_10_07; 
				v_corr_10_08_tmp <= v_corr_10_08; 
				v_corr_10_09_tmp <= v_corr_10_09; 
				v_corr_10_10_tmp <= v_corr_10_10; 

				v_corr_20_00_tmp <= v_corr_20_00; 
				v_corr_20_01_tmp <= v_corr_20_01; 
				v_corr_20_02_tmp <= v_corr_20_02; 
				v_corr_20_03_tmp <= v_corr_20_03; 
				v_corr_20_04_tmp <= v_corr_20_04; 
				v_corr_20_05_tmp <= v_corr_20_05; 
				v_corr_20_06_tmp <= v_corr_20_06; 
				v_corr_20_07_tmp <= v_corr_20_07; 
				v_corr_20_08_tmp <= v_corr_20_08; 
				v_corr_20_09_tmp <= v_corr_20_09; 
				v_corr_20_10_tmp <= v_corr_20_10; 
				v_corr_20_11_tmp <= v_corr_20_11; 
				v_corr_20_12_tmp <= v_corr_20_12; 
				v_corr_20_13_tmp <= v_corr_20_13; 
				v_corr_20_14_tmp <= v_corr_20_14; 
				v_corr_20_15_tmp <= v_corr_20_15; 
				v_corr_20_16_tmp <= v_corr_20_16; 
				v_corr_20_17_tmp <= v_corr_20_17; 
				v_corr_20_18_tmp <= v_corr_20_18; 
				v_corr_20_19_tmp <= v_corr_20_19; 
				v_corr_20_20_tmp <= v_corr_20_20; 

				--vidin_data_reg_scld_1_2to3_left_rz_tmp <= vidin_data_reg_scld_1_2to3_left_rz;
				--vidin_data_reg_scld_2_2to3_left_rz_tmp <= vidin_data_reg_scld_2_2to3_left_rz;
				--vidin_data_reg_scld_4_2to3_left_rz_tmp <= vidin_data_reg_scld_4_2to3_left_rz;
				--v-idin_data_reg_scld_1_2to3_right_rz_tmp <= vidin_data_reg_scld_1_2to3_right_rz;
				--vidin_data_reg_scld_2_2to3_right_rz_tmp <= vidin_data_reg_scld_2_2to3_right_rz;
				--vidin_data_reg_scld_4_2to3_right_rz_tmp <= vidin_data_reg_scld_4_2to3_right_rz;

	end if;
	end if;
end process;

end arch_port_bus_1to0;
