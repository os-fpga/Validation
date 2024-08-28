library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity port_bus_2to1_1 is port(
	clk: in std_logic;
	vidin_addr_reg: out std_logic_vector(18 downto 0);
	svid_comp_switch : out std_logic;
	vidin_new_data_scld_1_2to3_left: out std_logic;
	vidin_data_reg_scld_1_2to3_left_rp: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_left_ip: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_left_rn: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_left_in: out std_logic_vector(15 downto 0);
	vidin_new_data_scld_2_2to3_left: out std_logic;
	vidin_data_reg_scld_2_2to3_left_rp: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_left_ip: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_left_rn: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_left_in: out std_logic_vector(15 downto 0);
	vidin_new_data_scld_4_2to3_left: out std_logic;
	vidin_data_reg_scld_4_2to3_left_rp: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_left_ip: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_left_rn: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_left_in: out std_logic_vector(15 downto 0);
	vidin_new_data_scld_1_2to3_right: out std_logic;
	vidin_data_reg_scld_1_2to3_right_rp: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_right_ip: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_right_rn: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_right_in: out std_logic_vector(15 downto 0);
	vidin_new_data_scld_2_2to3_right: out std_logic;
	vidin_data_reg_scld_2_2to3_right_rp: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_right_ip: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_right_rn: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_right_in: out std_logic_vector(15 downto 0);
	vidin_new_data_scld_4_2to3_right: out std_logic;
	vidin_data_reg_scld_4_2to3_right_rp: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_right_ip: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_right_rn: out std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_right_in: out std_logic_vector(15 downto 0);
	bus_word_3: in std_logic_vector(15 downto 0);
	bus_word_4: in std_logic_vector(15 downto 0);
	bus_word_5: in std_logic_vector(15 downto 0);
	bus_word_6: in std_logic_vector(15 downto 0);
	counter_out: in std_logic_vector(2 downto 0));
end port_bus_2to1_1;

architecture arch_port_bus_2to1_1 of port_bus_2to1_1 is

	signal bus_word_3_tmp,
		bus_word_4_tmp,bus_word_5_tmp,bus_word_6_tmp: std_logic_vector(15 downto 0);
	--signal bus_word_1_reg,bus_word_2_reg,bus_word_3_reg,
	--	bus_word_4_reg,bus_word_5_reg,bus_word_6_reg: std_logic_vector(15 downto 0);
	signal vidin_addr_reg_tmp : std_logic_vector(18 downto 0);
	signal svid_comp_switch_tmp : std_logic;
	signal vidin_new_data_scld_1_2to3_left_tmp : std_logic;
	signal vidin_new_data_scld_2_2to3_left_tmp : std_logic;
	signal vidin_new_data_scld_4_2to3_left_tmp : std_logic;
	signal vidin_new_data_scld_1_2to3_right_tmp : std_logic;
	signal vidin_new_data_scld_2_2to3_right_tmp : std_logic;
	signal vidin_new_data_scld_4_2to3_right_tmp : std_logic;
	signal counter_out_tmp : std_logic_vector(2 downto 0);
	--signal counter_out_reg : std_logic_vector(2 downto 0);
	signal vidin_data_reg_scld_1_2to3_left_rp_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_left_ip_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_left_rn_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_left_in_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_rp_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_ip_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_rn_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_in_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_rp_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_ip_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_rn_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_in_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_rp_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_ip_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_rn_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_in_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_rp_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_ip_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_rn_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_in_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_rp_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_ip_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_rn_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_in_tmp: std_logic_vector(15 downto 0);



begin

process(clk) begin

	if (clk'event and clk = '1') then
		case counter_out_tmp(2 downto 0) is
			
			when "000" => 
						
						
		

			when "001" =>
						--counter_out_tmp <= "001";
						--bus_word_1_tmp <= vidin_addr_reg_tmp(15 downto 0); 
						--bus_word_2_tmp <= vidin_addr_reg_tmp(18 downto 16) & 
						--					svid_comp_switch_tmp &
						--					vidin_new_data_scld_1_2to3_left_tmp &
						--					vidin_new_data_scld_2_2to3_left_tmp &
						--					vidin_new_data_scld_4_2to3_left_tmp &
						--					vidin_new_data_scld_1_2to3_right_tmp &
						--					vidin_new_data_scld_2_2to3_right_tmp &
						--					vidin_new_data_scld_4_2to3_right_tmp &
						--					"000000";
						--bus_word_3_tmp <= "00000000" & vidin_data_reg_scld_1_2to3_left_tmp;
						--bus_word_4_tmp <= "00000000" & vidin_data_reg_scld_1_2to3_left_tmp;
						--bus_word_5_tmp <= "00000000" & vidin_data_reg_scld_1_2to3_right_tmp;
						--bus_word_6_tmp <= "00000000" & vidin_data_reg_scld_1_2to3_right_tmp;
						
						vidin_addr_reg_tmp(15 downto 0) <= bus_word_3_tmp;
						vidin_addr_reg_tmp(18 downto 16) <= bus_word_4_tmp(15 downto 13);
						svid_comp_switch_tmp  <= bus_word_4_tmp(12);
						vidin_new_data_scld_1_2to3_left_tmp <= bus_word_4_tmp(11);
						vidin_new_data_scld_2_2to3_left_tmp <= bus_word_4_tmp(10);
						vidin_new_data_scld_4_2to3_left_tmp <= bus_word_4_tmp(9);
						vidin_new_data_scld_1_2to3_right_tmp <= bus_word_4_tmp(8);
						vidin_new_data_scld_2_2to3_right_tmp <= bus_word_4_tmp(7);
						vidin_new_data_scld_4_2to3_right_tmp <= bus_word_4_tmp(6);

			when "010" =>
						vidin_data_reg_scld_1_2to3_left_rp_tmp <= bus_word_3_tmp;
						vidin_data_reg_scld_1_2to3_left_ip_tmp <= bus_word_4_tmp;
						vidin_data_reg_scld_1_2to3_left_rn_tmp <= bus_word_5_tmp;
						vidin_data_reg_scld_1_2to3_left_in_tmp <= bus_word_6_tmp;
						

			when "011" =>
						vidin_data_reg_scld_1_2to3_right_rp_tmp <= bus_word_3_tmp;
						vidin_data_reg_scld_1_2to3_right_ip_tmp <= bus_word_4_tmp;
						vidin_data_reg_scld_1_2to3_right_rn_tmp <= bus_word_5_tmp;
						vidin_data_reg_scld_1_2to3_right_in_tmp <= bus_word_6_tmp;

			when "100" =>
						vidin_data_reg_scld_2_2to3_left_rp_tmp <= bus_word_3_tmp;
						vidin_data_reg_scld_2_2to3_left_ip_tmp <= bus_word_4_tmp;
						vidin_data_reg_scld_2_2to3_left_rn_tmp <= bus_word_5_tmp;
						vidin_data_reg_scld_2_2to3_left_in_tmp <= bus_word_6_tmp;
						
			when "101" =>
						vidin_data_reg_scld_2_2to3_right_rp_tmp <= bus_word_3_tmp;
						vidin_data_reg_scld_2_2to3_right_ip_tmp <= bus_word_4_tmp;
						vidin_data_reg_scld_2_2to3_right_rn_tmp <= bus_word_5_tmp;
						vidin_data_reg_scld_2_2to3_right_in_tmp <= bus_word_6_tmp;

			when "110" =>
						vidin_data_reg_scld_4_2to3_left_rp_tmp <= bus_word_3_tmp;
						vidin_data_reg_scld_4_2to3_left_ip_tmp <= bus_word_4_tmp;
						vidin_data_reg_scld_4_2to3_left_rn_tmp <= bus_word_5_tmp;
						vidin_data_reg_scld_4_2to3_left_in_tmp <= bus_word_6_tmp;
						
			when "111" =>
						vidin_data_reg_scld_4_2to3_right_rp_tmp <= bus_word_3_tmp;
						vidin_data_reg_scld_4_2to3_right_ip_tmp <= bus_word_4_tmp;
						vidin_data_reg_scld_4_2to3_right_rn_tmp <= bus_word_5_tmp;
						vidin_data_reg_scld_4_2to3_right_in_tmp <= bus_word_6_tmP;



			end case;
	end if;
end process;

process (clk) begin
	 if (clk'event and clk = '1') then
				
		counter_out_tmp <= counter_out;
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
				vidin_new_data_scld_1_2to3_left <= '1';
				if (vidin_addr_reg_tmp(0) = '0' and  vidin_addr_reg_tmp(9) = '0') then
					vidin_new_data_scld_2_2to3_left <= '1'; 
						if (vidin_addr_reg_tmp(1) = '0' and  vidin_addr_reg_tmp(10) = '0') then	
							vidin_new_data_scld_4_2to3_left <= '1'; 
						end if;
				end if;
				vidin_new_data_scld_1_2to3_right <= '1'; --vidin_new_data_scld_1_2to3_right_tmp;
				vidin_new_data_scld_2_2to3_right <= '1'; --vidin_new_data_scld_2_2to3_right_tmp;
				vidin_new_data_scld_4_2to3_right <= '1'; --vidin_new_data_scld_4_2to3_right_tmp;

				vidin_data_reg_scld_1_2to3_left_rp <= vidin_data_reg_scld_1_2to3_left_rp_tmp;
				vidin_data_reg_scld_1_2to3_left_ip <= vidin_data_reg_scld_1_2to3_left_ip_tmp;
				vidin_data_reg_scld_1_2to3_left_rn <= vidin_data_reg_scld_1_2to3_left_rn_tmp;
				vidin_data_reg_scld_1_2to3_left_in <= vidin_data_reg_scld_1_2to3_left_in_tmp;

				vidin_data_reg_scld_2_2to3_left_rp <= vidin_data_reg_scld_2_2to3_left_rp_tmp;
				vidin_data_reg_scld_2_2to3_left_ip <= vidin_data_reg_scld_2_2to3_left_ip_tmp;
				vidin_data_reg_scld_2_2to3_left_rn <= vidin_data_reg_scld_2_2to3_left_rn_tmp;
				vidin_data_reg_scld_2_2to3_left_in <= vidin_data_reg_scld_2_2to3_left_in_tmp;

				vidin_data_reg_scld_4_2to3_left_rp <= vidin_data_reg_scld_4_2to3_left_rp_tmp;
				vidin_data_reg_scld_4_2to3_left_ip <= vidin_data_reg_scld_4_2to3_left_ip_tmp;
				vidin_data_reg_scld_4_2to3_left_rn <= vidin_data_reg_scld_4_2to3_left_rn_tmp;
				vidin_data_reg_scld_4_2to3_left_in <= vidin_data_reg_scld_4_2to3_left_in_tmp;

				vidin_data_reg_scld_1_2to3_right_rp <= vidin_data_reg_scld_1_2to3_right_rp_tmp;
				vidin_data_reg_scld_1_2to3_right_ip <= vidin_data_reg_scld_1_2to3_right_ip_tmp;
				vidin_data_reg_scld_1_2to3_right_rn <= vidin_data_reg_scld_1_2to3_right_rn_tmp;
				vidin_data_reg_scld_1_2to3_right_in <= vidin_data_reg_scld_1_2to3_right_in_tmp;

				vidin_data_reg_scld_2_2to3_right_rp <= vidin_data_reg_scld_2_2to3_right_rp_tmp;
				vidin_data_reg_scld_2_2to3_right_ip <= vidin_data_reg_scld_2_2to3_right_ip_tmp;
				vidin_data_reg_scld_2_2to3_right_rn <= vidin_data_reg_scld_2_2to3_right_rn_tmp;
				vidin_data_reg_scld_2_2to3_right_in <= vidin_data_reg_scld_2_2to3_right_in_tmp;

				vidin_data_reg_scld_4_2to3_right_rp <= vidin_data_reg_scld_4_2to3_right_rp_tmp;
				vidin_data_reg_scld_4_2to3_right_ip <= vidin_data_reg_scld_4_2to3_right_ip_tmp;
				vidin_data_reg_scld_4_2to3_right_rn <= vidin_data_reg_scld_4_2to3_right_rn_tmp;
				vidin_data_reg_scld_4_2to3_right_in <= vidin_data_reg_scld_4_2to3_right_in_tmp;

				
		else 
				vidin_new_data_scld_1_2to3_left <= '0';
				vidin_new_data_scld_2_2to3_left <= '0';
				vidin_new_data_scld_4_2to3_left <= '0';
				vidin_new_data_scld_1_2to3_right <= '0';
				vidin_new_data_scld_2_2to3_right <= '0';
				vidin_new_data_scld_4_2to3_right <= '0';

		end if;
	end if;
end process;

end arch_port_bus_2to1_1;
