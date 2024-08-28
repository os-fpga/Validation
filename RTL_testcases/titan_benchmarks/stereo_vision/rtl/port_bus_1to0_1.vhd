library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity port_bus_1to0_1 is 
	generic( corr_res_w:integer);
	port(
	clk: in std_logic;
	vidin_addr_reg: out std_logic_vector(18 downto 0);
	svid_comp_switch : out std_logic;
	vidin_new_data_scld_1_1to0: out std_logic;
	v_corr_20: out type_array_8_20;
	vidin_new_data_scld_2_1to0: out std_logic;
	v_corr_10: out type_array_8_10;
	vidin_new_data_scld_4_1to0: out std_logic;
	v_corr_05: out type_array_8_5;
	bus_word_1: in std_logic_vector(7 downto 0);
	bus_word_2: in std_logic_vector(7 downto 0);
	bus_word_3: in std_logic_vector(7 downto 0);
	bus_word_4: in std_logic_vector(7 downto 0);
	bus_word_5: in std_logic_vector(7 downto 0);
	bus_word_6: in std_logic_vector(7 downto 0);
	counter_out: in std_logic_vector(2 downto 0));
end port_bus_1to0_1;

architecture arch_port_bus_1to0_1 of port_bus_1to0_1 is

	signal bus_word_1_tmp,bus_word_2_tmp,bus_word_3_tmp,
		bus_word_4_tmp,bus_word_5_tmp,bus_word_6_tmp: std_logic_vector(7 downto 0);
	--signal bus_word_1_reg,bus_word_2_reg,bus_word_3_reg,
	--	bus_word_4_reg,bus_word_5_reg,bus_word_6_reg: std_logic_vector(15 downto 0);
	signal vidin_addr_reg_tmp : std_logic_vector(18 downto 0);
	signal svid_comp_switch_tmp : std_logic;
	signal vidin_new_data_scld_1_1to0_tmp : std_logic;
	signal vidin_new_data_scld_2_1to0_tmp : std_logic;
	signal vidin_new_data_scld_4_1to0_tmp : std_logic;
	--signal vidin_new_data_scld_1_1to0_right_tmp : std_logic;
	--signal vidin_new_data_scld_2_1to0_right_tmp : std_logic;
	--signal vidin_new_data_scld_4_1to0_right_tmp : std_logic;
	signal counter_out_tmp : std_logic_vector(2 downto 0);
	--signal counter_out_reg : std_logic_vector(2 downto 0);
	--signal vidin_data_reg_scld_1_1to0_left_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_2_1to0_left_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_4_1to0_left_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_1_1to0_right_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_2_1to0_right_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_4_1to0_right_tmp: std_logic_vector(15 downto 0);
	signal v_corr_20_tmp: type_array_8_20;

	signal v_corr_10_tmp: type_array_8_10;

	signal v_corr_05_tmp:  type_array_8_5;
	


begin

process(clk) begin

	if (clk'event and clk = '1') then
		case counter_out_tmp(2 downto 0) is
			
			when "000" => 
						
			when "001" =>
						vidin_addr_reg_tmp(7 downto 0) <= bus_word_1_tmp;
						vidin_addr_reg_tmp(15 downto 8) <= bus_word_2_tmp;
						vidin_addr_reg_tmp(18 downto 16) <= bus_word_3_tmp(7 downto 5);
						svid_comp_switch_tmp  <= bus_word_3_tmp(4);
						v_corr_05_tmp(0) <= bus_word_4_tmp;
						v_corr_05_tmp(1) <= bus_word_5_tmp;
						v_corr_05_tmp(2) <= bus_word_6_tmp;
				

			when "010" =>
					 	v_corr_05_tmp(3) <= bus_word_1_tmp;
						v_corr_05_tmp(4) <= bus_word_2_tmp;
						v_corr_05_tmp(5) <= bus_word_3_tmp;
						v_corr_10_tmp(0) <= bus_word_4_tmp;
						v_corr_10_tmp(1) <= bus_word_5_tmp;
						v_corr_10_tmp(2) <= bus_word_6_tmp;

			when "011" =>
						v_corr_10_tmp(3) <= bus_word_1_tmp;
						v_corr_10_tmp(4) <= bus_word_2_tmp;
						v_corr_10_tmp(5) <= bus_word_3_tmp;
						v_corr_10_tmp(6) <= bus_word_4_tmp;
						v_corr_10_tmp(7) <= bus_word_5_tmp;
						v_corr_10_tmp(8) <= bus_word_6_tmp;

			when "100" =>
						v_corr_10_tmp(9) <= bus_word_1_tmp;
						v_corr_10_tmp(10) <= bus_word_2_tmp;
						v_corr_20_tmp(0) <= bus_word_3_tmp;
						v_corr_20_tmp(1) <= bus_word_4_tmp;
						v_corr_20_tmp(2) <= bus_word_5_tmp;
						v_corr_20_tmp(3) <= bus_word_6_tmp;

			when "101" =>
						v_corr_20_tmp(4) <= bus_word_1_tmp;
						v_corr_20_tmp(5) <= bus_word_2_tmp;
						v_corr_20_tmp(6) <= bus_word_3_tmp;
						v_corr_20_tmp(7) <= bus_word_4_tmp;
						v_corr_20_tmp(8) <= bus_word_5_tmp;
						v_corr_20_tmp(9) <= bus_word_6_tmp;

			when "110" =>
						v_corr_20_tmp(10) <= bus_word_1_tmp;
						v_corr_20_tmp(11) <= bus_word_2_tmp;
						v_corr_20_tmp(12) <= bus_word_3_tmp;
						v_corr_20_tmp(13) <= bus_word_4_tmp;
						v_corr_20_tmp(14) <= bus_word_5_tmp;
						v_corr_20_tmp(15) <= bus_word_6_tmp;
	
			when "111" =>
						v_corr_20_tmp(16) <= bus_word_1_tmp;
						v_corr_20_tmp(17) <= bus_word_2_tmp;
						v_corr_20_tmp(18) <= bus_word_3_tmp;
						v_corr_20_tmp(19) <= bus_word_4_tmp;
						v_corr_20_tmp(20) <= bus_word_5_tmp;
						--v_corr_20_20_tmp <= bus_word_6_tmp;

			when others => 
						v_corr_20_tmp(16) <= bus_word_1_tmp;
						v_corr_20_tmp(17) <= bus_word_2_tmp;
						v_corr_20_tmp(18) <= bus_word_3_tmp;
						v_corr_20_tmp(19) <= bus_word_4_tmp;
						v_corr_20_tmp(20) <= bus_word_5_tmp;

			end case;
	end if;
end process;

process (clk) begin
	 if (clk'event and clk = '1') then
		counter_out_tmp <= counter_out;
		bus_word_1_tmp <= bus_word_1;
		bus_word_2_tmp <= bus_word_2;
		bus_word_3_tmp <= bus_word_3;
		bus_word_4_tmp <= bus_word_4;
		bus_word_5_tmp <= bus_word_5;
		bus_word_6_tmp <= bus_word_6;

	end if;
end process;

process (clk) begin
	 if (clk'event and clk = '1') then
		if counter_out_tmp = "001" then

				vidin_addr_reg <= vidin_addr_reg_tmp;
				svid_comp_switch <= svid_comp_switch_tmp;
				if (vidin_addr_reg_tmp(8 downto 0) /= "000000000") then
					vidin_new_data_scld_1_1to0 <= '1';
					if (vidin_addr_reg_tmp(0) = '0' and  vidin_addr_reg_tmp(9) = '0') then
						vidin_new_data_scld_2_1to0 <= '1'; 
						if (vidin_addr_reg_tmp(1) = '0' and  vidin_addr_reg_tmp(10) = '0') then	
							vidin_new_data_scld_4_1to0 <= '1'; 
						else 
							vidin_new_data_scld_4_1to0 <= '0';
						end if;
					else 
						vidin_new_data_scld_2_1to0 <= '0';
						vidin_new_data_scld_4_1to0 <= '0';
					end if;
				else 
						vidin_new_data_scld_1_1to0 <= '0';
						vidin_new_data_scld_4_1to0 <= '0';
						vidin_new_data_scld_2_1to0 <= '0';
					
				end if;
				v_corr_05(0) <= v_corr_05_tmp(0); 
				v_corr_05(1) <= v_corr_05_tmp(1); 
				v_corr_05(2) <= v_corr_05_tmp(2); 
				v_corr_05(3) <= v_corr_05_tmp(3); 
				v_corr_05(4) <= v_corr_05_tmp(4); 
				v_corr_05(5) <= v_corr_05_tmp(5); 
				
				v_corr_10(0) <= v_corr_10_tmp(0); 
				v_corr_10(1) <= v_corr_10_tmp(1); 
				v_corr_10(2) <= v_corr_10_tmp(2); 
				v_corr_10(3) <= v_corr_10_tmp(3); 
				v_corr_10(4) <= v_corr_10_tmp(4); 
				v_corr_10(5) <= v_corr_10_tmp(5); 
				v_corr_10(6) <= v_corr_10_tmp(6); 
				v_corr_10(7) <= v_corr_10_tmp(7); 
				v_corr_10(8) <= v_corr_10_tmp(8); 
				v_corr_10(9) <= v_corr_10_tmp(9); 
				v_corr_10(10) <= v_corr_10_tmp(10); 
						
				v_corr_20(0) <= v_corr_20_tmp(0); 
				v_corr_20(1) <= v_corr_20_tmp(1); 
				v_corr_20(2) <= v_corr_20_tmp(2); 
				v_corr_20(3) <= v_corr_20_tmp(3); 
				v_corr_20(4) <= v_corr_20_tmp(4); 
				v_corr_20(5) <= v_corr_20_tmp(5); 
				v_corr_20(6) <= v_corr_20_tmp(6); 
				v_corr_20(7) <= v_corr_20_tmp(7); 
				v_corr_20(8) <= v_corr_20_tmp(8); 
				v_corr_20(9) <= v_corr_20_tmp(9); 
				v_corr_20(10) <= v_corr_20_tmp(10); 
				v_corr_20(11) <= v_corr_20_tmp(11); 
				v_corr_20(12) <= v_corr_20_tmp(12); 
				v_corr_20(13) <= v_corr_20_tmp(13); 
				v_corr_20(14) <= v_corr_20_tmp(14); 
				v_corr_20(15) <= v_corr_20_tmp(15); 
				v_corr_20(16) <= v_corr_20_tmp(16); 
				v_corr_20(17) <= v_corr_20_tmp(17); 
				v_corr_20(18) <= v_corr_20_tmp(18); 
				v_corr_20(19) <= v_corr_20_tmp(19); 
				v_corr_20(20) <= v_corr_20_tmp(20); 
								
		else 
				vidin_new_data_scld_1_1to0 <= '0';
				vidin_new_data_scld_2_1to0 <= '0';
				vidin_new_data_scld_4_1to0 <= '0';
		
		end if;
	end if;
end process;

end arch_port_bus_1to0_1;
