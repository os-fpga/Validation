library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity port_bus_2to1 is port(
	clk: in std_logic;
	vidin_addr_reg: in std_logic_vector(18 downto 0);
	svid_comp_switch : in std_logic;
	vidin_new_data_scld_1_2to3_left: in std_logic;
	vidin_data_reg_scld_1_2to3_left_rp: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_left_ip: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_left_rn: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_left_in: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_left_rp: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_left_ip: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_left_rn: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_left_in: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_left_rp: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_left_ip: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_left_rn: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_left_in: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_right_rp: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_right_ip: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_right_rn: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_1_2to3_right_in: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_right_rp: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_right_ip: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_right_rn: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_2_2to3_right_in: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_right_rp: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_right_ip: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_right_rn: in std_logic_vector(15 downto 0);
	vidin_data_reg_scld_4_2to3_right_in: in std_logic_vector(15 downto 0);
	bus_word_3: out std_logic_vector(15 downto 0);
	bus_word_4: out std_logic_vector(15 downto 0);
	bus_word_5: out std_logic_vector(15 downto 0);
	bus_word_6: out std_logic_vector(15 downto 0);
	counter_out: out std_logic_vector(2 downto 0));
end port_bus_2to1;

architecture arch_port_bus_2to1 of port_bus_2to1 is

	signal bus_word_3_tmp,
		 bus_word_4_tmp,bus_word_5_tmp,bus_word_6_tmp: std_logic_vector(15 downto 0);
	signal vidin_addr_reg_tmp : std_logic_vector(18 downto 0);
	signal svid_comp_switch_tmp : std_logic;
	signal vidin_new_data_scld_1_2to3_left_tmp : std_logic;
	signal vidin_new_data_scld_2_2to3_left_tmp : std_logic;
	signal vidin_new_data_scld_4_2to3_left_tmp : std_logic;
	signal vidin_new_data_scld_1_2to3_right_tmp : std_logic;
	signal vidin_new_data_scld_2_2to3_right_tmp : std_logic;
	signal vidin_new_data_scld_4_2to3_right_tmp : std_logic;
	signal counter : std_logic_vector(3 downto 0);
	signal counter_out_tmp : std_logic_vector(2 downto 0);
	
	--signal vidin_data_reg_scld_1_2to3_left_rz_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_2_2to3_left_rz_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_4_2to3_left_rz_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_1_2to3_right_rz_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_2_2to3_right_rz_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_4_2to3_right_rz_tmp: std_logic_vector(15 downto 0);

	--signal vidin_data_reg_scld_1_2to3_left_iz_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_2_2to3_left_iz_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_4_2to3_left_iz_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_1_2to3_right_iz_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_2_2to3_right_iz_tmp: std_logic_vector(15 downto 0);
	--signal vidin_data_reg_scld_4_2to3_right_iz_tmp: std_logic_vector(15 downto 0);

	signal vidin_data_reg_scld_1_2to3_left_rp_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_rp_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_rp_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_rp_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_rp_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_rp_tmp: std_logic_vector(15 downto 0);

	signal vidin_data_reg_scld_1_2to3_left_ip_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_ip_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_ip_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_ip_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_ip_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_ip_tmp: std_logic_vector(15 downto 0);

	signal vidin_data_reg_scld_1_2to3_left_rn_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_rn_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_rn_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_rn_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_rn_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_rn_tmp: std_logic_vector(15 downto 0);

	signal vidin_data_reg_scld_1_2to3_left_in_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_left_in_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_left_in_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_1_2to3_right_in_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_2_2to3_right_in_tmp: std_logic_vector(15 downto 0);
	signal vidin_data_reg_scld_4_2to3_right_in_tmp: std_logic_vector(15 downto 0);



begin

process(clk) begin

	if (clk'event and clk = '1') then
		if vidin_new_data_scld_1_2to3_left ='1' then
				counter <= "0001";
		else 
			--if counter = "1000" then
			--	--counter <= counter + 1;
			--	counter <= "1000";
			--else 
				--counter <= "0111";
			--	counter <= counter + 1;
			--end if;
			case counter is
				when "0000" =>
						counter <= "1000";
				when "0001" =>
						counter <= "0010";
				when "0010" =>
						counter <= "0011";
				when "0011" =>
						counter <= "0100";
				when "0100" =>
						counter <= "0101";
				when "0101" =>
						counter <= "0110";
				when "0110" =>
						counter <= "0111";
				when "0111" =>
						counter <= "1000";
				when "1000" =>
						counter <= "1000";
				when others =>
						counter <= "1000";
			end case;
		end if;
	end if;
end process;

process(clk) begin

	if (clk'event and clk = '1') then
	case counter(2 downto 0) is
			
			when "000" => 
						counter_out_tmp <= "000";
						--bus_word_1_tmp <= "0000000000000000"; 
						--bus_word_2_tmp <= "0000000000000000"; 
						bus_word_3_tmp <= "0000000000000000"; 
						bus_word_4_tmp <= "0000000000000000"; 
						bus_word_5_tmp <= "0000000000000000"; 
						bus_word_6_tmp <= "0000000000000000"; 

		

			when "001" =>
						counter_out_tmp <= "001";
						bus_word_3_tmp <= vidin_addr_reg_tmp(15 downto 0); 
						bus_word_4_tmp <= vidin_addr_reg_tmp(18 downto 16) & 
											svid_comp_switch_tmp &
											"000000000000";
						--bus_word_3_tmp <= "0000000000000000"; --vidin_data_reg_scld_1_2to3_left_tmp;
						--bus_word_4_tmp <= "0000000000000000"; --vidin_data_reg_scld_1_2to3_left_tmp;
						bus_word_5_tmp <= "0000000000000000"; --vidin_data_reg_scld_1_2to3_right_tmp;
						bus_word_6_tmp <= "0000000000000000"; --vidin_data_reg_scld_1_2to3_right_tmp;

			when "010" =>
						counter_out_tmp <= "010";
						--bus_word_1_tmp <=  vidin_data_reg_scld_1_2to3_left_rz_tmp;
						--bus_word_2_tmp <= vidin_data_reg_scld_1_2to3_left_iz_tmp;
						bus_word_3_tmp <=  vidin_data_reg_scld_1_2to3_left_rp_tmp;
						bus_word_4_tmp <=  vidin_data_reg_scld_1_2to3_left_ip_tmp;
						bus_word_5_tmp <=  vidin_data_reg_scld_1_2to3_left_rn_tmp;
						bus_word_6_tmp <=  vidin_data_reg_scld_1_2to3_left_in_tmp;

			when "011" =>
						counter_out_tmp <= "011";
						--bus_word_1_tmp <=  vidin_data_reg_scld_1_2to3_right_rz_tmp;
						--bus_word_2_tmp <= vidin_data_reg_scld_1_2to3_right_iz_tmp;
						bus_word_3_tmp <=  vidin_data_reg_scld_1_2to3_right_rp_tmp;
						bus_word_4_tmp <=  vidin_data_reg_scld_1_2to3_right_ip_tmp;
						bus_word_5_tmp <=  vidin_data_reg_scld_1_2to3_right_rn_tmp;
						bus_word_6_tmp <=  vidin_data_reg_scld_1_2to3_right_in_tmp;

			when "100" =>
						counter_out_tmp <= "100";
						--bus_word_1_tmp <=  vidin_data_reg_scld_2_2to3_left_rz_tmp;
						--bus_word_2_tmp <= vidin_data_reg_scld_2_2to3_left_iz_tmp;
						bus_word_3_tmp <=  vidin_data_reg_scld_2_2to3_left_rp_tmp;
						bus_word_4_tmp <=  vidin_data_reg_scld_2_2to3_left_ip_tmp;
						bus_word_5_tmp <=  vidin_data_reg_scld_2_2to3_left_rn_tmp;
						bus_word_6_tmp <=  vidin_data_reg_scld_2_2to3_left_in_tmp;
			
			when "101" =>
						counter_out_tmp <= "101";
						--bus_word_1_tmp <=  vidin_data_reg_scld_2_2to3_right_rz_tmp;
						--bus_word_2_tmp <= vidin_data_reg_scld_2_2to3_right_iz_tmp;
						bus_word_3_tmp <=  vidin_data_reg_scld_2_2to3_right_rp_tmp;
						bus_word_4_tmp <=  vidin_data_reg_scld_2_2to3_right_ip_tmp;
						bus_word_5_tmp <=  vidin_data_reg_scld_2_2to3_right_rn_tmp;
						bus_word_6_tmp <=  vidin_data_reg_scld_2_2to3_right_in_tmp;

			when "110" =>
						counter_out_tmp <= "110";
						--bus_word_1_tmp <=  vidin_data_reg_scld_4_2to3_left_rz_tmp;
						--bus_word_2_tmp <= vidin_data_reg_scld_4_2to3_left_iz_tmp;
						bus_word_3_tmp <=  vidin_data_reg_scld_4_2to3_left_rp_tmp;
						bus_word_4_tmp <=  vidin_data_reg_scld_4_2to3_left_ip_tmp;
						bus_word_5_tmp <=  vidin_data_reg_scld_4_2to3_left_rn_tmp;
						bus_word_6_tmp <=  vidin_data_reg_scld_4_2to3_left_in_tmp;
			
			when "111" =>
						counter_out_tmp <= "111";
						--bus_word_1_tmp <=  vidin_data_reg_scld_4_2to3_right_rz_tmp;
						--bus_word_2_tmp <= vidin_data_reg_scld_4_2to3_right_iz_tmp;
						bus_word_3_tmp <=  vidin_data_reg_scld_4_2to3_right_rp_tmp;
						bus_word_4_tmp <=  vidin_data_reg_scld_4_2to3_right_ip_tmp;
						bus_word_5_tmp <=  vidin_data_reg_scld_4_2to3_right_rn_tmp;
						bus_word_6_tmp <=  vidin_data_reg_scld_4_2to3_right_in_tmp;


			end case;
	end if;
end process;

process (clk) begin
	 if (clk'event and clk = '1') then
		
		counter_out <= counter_out_tmp;
		--bus_word_1 <= bus_word_1_tmp;
		--bus_word_2 <= bus_word_2_tmp;
		bus_word_3 <= bus_word_3_tmp;
		bus_word_4 <= bus_word_4_tmp;
		bus_word_5 <= bus_word_5_tmp;
		bus_word_6 <= bus_word_6_tmp;

		--if counter = "0000" then
		if vidin_new_data_scld_1_2to3_left ='1' then

				vidin_addr_reg_tmp <= vidin_addr_reg;
				svid_comp_switch_tmp <= svid_comp_switch;
				
				
				--vidin_data_reg_scld_1_2to3_left_rz_tmp <= vidin_data_reg_scld_1_2to3_left_rz;
				--vidin_data_reg_scld_2_2to3_left_rz_tmp <= vidin_data_reg_scld_2_2to3_left_rz;
				--vidin_data_reg_scld_4_2to3_left_rz_tmp <= vidin_data_reg_scld_4_2to3_left_rz;
				--vidin_data_reg_scld_1_2to3_right_rz_tmp <= vidin_data_reg_scld_1_2to3_right_rz;
				--vidin_data_reg_scld_2_2to3_right_rz_tmp <= vidin_data_reg_scld_2_2to3_right_rz;
				--vidin_data_reg_scld_4_2to3_right_rz_tmp <= vidin_data_reg_scld_4_2to3_right_rz;

				--vidin_data_reg_scld_1_2to3_left_iz_tmp <= vidin_data_reg_scld_1_2to3_left_iz;
				--vidin_data_reg_scld_2_2to3_left_iz_tmp <= vidin_data_reg_scld_2_2to3_left_iz;
				--vidin_data_reg_scld_4_2to3_left_iz_tmp <= vidin_data_reg_scld_4_2to3_left_iz;
				--vidin_data_reg_scld_1_2to3_right_iz_tmp <= vidin_data_reg_scld_1_2to3_right_iz;
				--vidin_data_reg_scld_2_2to3_right_iz_tmp <= vidin_data_reg_scld_2_2to3_right_iz;
				--vidin_data_reg_scld_4_2to3_right_iz_tmp <= vidin_data_reg_scld_4_2to3_right_iz;

				vidin_data_reg_scld_1_2to3_left_rp_tmp <= vidin_data_reg_scld_1_2to3_left_rp;
				vidin_data_reg_scld_2_2to3_left_rp_tmp <= vidin_data_reg_scld_2_2to3_left_rp;
				vidin_data_reg_scld_4_2to3_left_rp_tmp <= vidin_data_reg_scld_4_2to3_left_rp;
				vidin_data_reg_scld_1_2to3_right_rp_tmp <= vidin_data_reg_scld_1_2to3_right_rp;
				vidin_data_reg_scld_2_2to3_right_rp_tmp <= vidin_data_reg_scld_2_2to3_right_rp;
				vidin_data_reg_scld_4_2to3_right_rp_tmp <= vidin_data_reg_scld_4_2to3_right_rp;


				vidin_data_reg_scld_1_2to3_left_ip_tmp <= vidin_data_reg_scld_1_2to3_left_ip;
				vidin_data_reg_scld_2_2to3_left_ip_tmp <= vidin_data_reg_scld_2_2to3_left_ip;
				vidin_data_reg_scld_4_2to3_left_ip_tmp <= vidin_data_reg_scld_4_2to3_left_ip;
				vidin_data_reg_scld_1_2to3_right_ip_tmp <= vidin_data_reg_scld_1_2to3_right_ip;
				vidin_data_reg_scld_2_2to3_right_ip_tmp <= vidin_data_reg_scld_2_2to3_right_ip;
				vidin_data_reg_scld_4_2to3_right_ip_tmp <= vidin_data_reg_scld_4_2to3_right_ip;


				vidin_data_reg_scld_1_2to3_left_rn_tmp <= vidin_data_reg_scld_1_2to3_left_rn;
				vidin_data_reg_scld_2_2to3_left_rn_tmp <= vidin_data_reg_scld_2_2to3_left_rn;
				vidin_data_reg_scld_4_2to3_left_rn_tmp <= vidin_data_reg_scld_4_2to3_left_rn;
				vidin_data_reg_scld_1_2to3_right_rn_tmp <= vidin_data_reg_scld_1_2to3_right_rn;
				vidin_data_reg_scld_2_2to3_right_rn_tmp <= vidin_data_reg_scld_2_2to3_right_rn;
				vidin_data_reg_scld_4_2to3_right_rn_tmp <= vidin_data_reg_scld_4_2to3_right_rn;
					
				vidin_data_reg_scld_1_2to3_left_in_tmp <= vidin_data_reg_scld_1_2to3_left_in;
				vidin_data_reg_scld_2_2to3_left_in_tmp <= vidin_data_reg_scld_2_2to3_left_in;
				vidin_data_reg_scld_4_2to3_left_in_tmp <= vidin_data_reg_scld_4_2to3_left_in;
				vidin_data_reg_scld_1_2to3_right_in_tmp <= vidin_data_reg_scld_1_2to3_right_in;
				vidin_data_reg_scld_2_2to3_right_in_tmp <= vidin_data_reg_scld_2_2to3_right_in;
				vidin_data_reg_scld_4_2to3_right_in_tmp <= vidin_data_reg_scld_4_2to3_right_in;


	end if;
	end if;
end process;

end arch_port_bus_2to1;
