-- originally created by Marcus van Ierssel

-- modified by Ahmad Darabiha, Feb. 2002

-- this circuit receives the rgbvideo  signal
-- from video input and send it to chip #2
-- for buffring and processing.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sv_chip3 is port(
	tm3_clk_v0: in std_logic;
	tm3_clk_v2: in std_logic;
	tm3_vidin_llc : in std_logic;
	tm3_vidin_vs : in std_logic;
	tm3_vidin_href : in std_logic;
	tm3_vidin_cref : in std_logic;
	tm3_vidin_rts0 : in std_logic;
	tm3_vidin_vpo : in std_logic_vector(15 downto 0);
	tm3_vidin_sda : inout std_logic;
	tm3_vidin_scl : out std_logic;
	vidin_new_data : out std_logic;
	vidin_rgb_reg: out std_logic_vector(7 downto 0);
	vidin_addr_reg: out std_logic_vector(18 downto 0);
    svid_comp_switch : out std_logic);
end sv_chip3;

architecture arch_sv_chip3 of sv_chip3 is
	signal temp_reg1,temp_reg2 : std_logic;
	signal svid_comp_state : std_logic_vector(2 downto 0);
	signal horiz: std_logic_vector(9 downto 0);
	signal vert: std_logic_vector(7 downto 0);
	signal creg1,creg2,creg3 : std_logic;
	signal vidin_addr_reg1 : std_logic_vector(18 downto 0);
	signal vidin_rgb_reg1, vidin_rgb_reg2 : std_logic_vector(23 downto 0);

	component ibuf port(
		i: in std_logic;
		o: out std_logic);
	end component;
	
	component bufg port(
		i: in std_logic;
		o: out std_logic);
	end component;

	type reg_states is( reg_prog1,reg_prog2,reg_prog3,reg_prog4,reg_prog5,
			reg_prog6,reg_prog7,reg_prog8,reg_prog9,reg_prog10,reg_prog11,
			reg_prog12,reg_prog13,reg_prog14,reg_prog15,reg_prog16,reg_prog17,
			reg_prog18,reg_prog19,reg_prog20,reg_prog21,reg_prog22,reg_prog23,
			reg_prog24,reg_prog25,reg_prog26,reg_prog_end);
	signal rst,rst_done : std_logic;
	signal iicaddr, iicdata : std_logic_vector(7 downto 0);
	signal vidin_llc, vidin_llc_int : std_logic;
	signal iic_state : std_logic_vector(6 downto 0);
	signal iic_stop,iic_start : std_logic;
	signal reg_prog_state, reg_prog_nextstate : reg_states;
	--signal left_tmp_1 : std_logic_vector(7 downto 0);
	--signal left_tmp_2 : std_logic_vector(7 downto 0);


begin
	
	ibuf_inst: ibuf port map(tm3_vidin_llc,vidin_llc_int);
	bufg_inst: bufg port map(vidin_llc_int, vidin_llc);
	
--	process(tm3_clk_v0) begin
--		if(tm3_clk_v0='1' and tm3_clk_v0'event) then
--			if vidin_new_data='1' then
				--vidin_rgb_reg_fifo_left_32 <= vidin_rgb_reg_fifo_left_23;
				--left_tmp_1 <= vidin_rgb_reg_fifo_left_23;
				--left_tmp_1 <= left_tmp_2;
--				vidin_rgb_reg_fifo_right_32 <= 	vidin_rgb_reg_fifo_right_23;
		
--				vidin_rgb_reg_fifo_left_32 <= vidin_rgb_reg_fifo_left_23;
--			end if;
--		end if;
--	end process;

	process(vidin_llc) begin
		if (vidin_llc'event and vidin_llc = '1') then
			if tm3_vidin_href = '0' then
				horiz <= "0000000000";
			else
				if (tm3_vidin_cref = '0')  then
					horiz <= horiz + 1;
				end if;
			end if;

			if tm3_vidin_vs = '1' then
				vert <= "00000000";
			else
			  if ((tm3_vidin_href = '0') AND (horiz /= "0000000000")) then
				vert <= vert + 1;
			    end if;
			end if;
			

			--if (tm3_vidin_cref = '1') then
			--	vidin_rgb_reg1(7 downto 0) <= (horiz(7) xor vert(6)) & 
			--									(horiz(7) xor vert(6)) & 
			--									(horiz(7) xor vert(6)) &
			--									"00000"; --horiz(4 downto 3) & vert(3 downto 1); 	

			--										--(horiz(6) xor vert(5)) &
			--										--(horiz(5 downto 2) + vert(4 downto 1)) &
			--										--"00";

			--										--(horiz(6) xor vert(5)) &
			--										--(horiz(6) xor vert(5)) &
			--										--(horiz(6) xor vert(5)) &
			--										--(horiz(6) xor vert(5));
			--

			--vidin_rgb_reg1(7 downto 0) <= horiz(3 downto 0) & "0000";

			--vidin_rgb_reg2 <= vidin_rgb_reg1;
			
			--else
			--vidin_rgb_reg1(15 downto 8) <= "00000000";
			--vidin_rgb_reg1(23 downto 16) <= "00000000";
			--vidin_addr_reg1 <= vert & not(tm3_vidin_rts0) & horiz;
			--end if;
			
			if (tm3_vidin_cref = '1') then
			vidin_rgb_reg1(23 downto 19) <= tm3_vidin_vpo(15 downto 11);
			vidin_rgb_reg1(15 downto 13) <= tm3_vidin_vpo(10 downto 8);
			vidin_rgb_reg1(18 downto 16) <= tm3_vidin_vpo(7 downto 5);
			vidin_rgb_reg1(9 downto 8) <= tm3_vidin_vpo(4 downto 3);
			vidin_rgb_reg1(2 downto 0) <= tm3_vidin_vpo(2 downto 0);
			vidin_rgb_reg2 <= vidin_rgb_reg1;
			else
			vidin_rgb_reg1(12 downto 10) <= tm3_vidin_vpo(7 downto 5);
			vidin_rgb_reg1(7 downto 3) <= tm3_vidin_vpo(4 downto 0);
			vidin_addr_reg1 <= vert & not(tm3_vidin_rts0) & horiz;
			end if;
		end if;
	end process;
	
	
	process(tm3_clk_v0) begin
		if (tm3_clk_v0'event and tm3_clk_v0 = '1') then
			creg1 <= tm3_vidin_cref;
			creg2 <= creg1;
			creg3 <= creg2;
			if (creg2 = '0') and (creg3 = '1') 
					 and (vidin_addr_reg1(10) = '0') 
					 and (vidin_addr_reg1(0) = '0') then
				vidin_new_data <= '1';
				vidin_rgb_reg <= vidin_rgb_reg2(7 downto 0);
				vidin_addr_reg <= ("00" & vidin_addr_reg1(18 downto 11)) 
							& vidin_addr_reg1(9 downto 1);
			else
				vidin_new_data <= '0';
			end if;
			
		end if;
	end process;

	process(tm3_clk_v2) begin
		if (tm3_clk_v2'event and tm3_clk_v2 = '1') then
		iic_stop <= '0';
		case (iic_state) is
			when "0000000" => -- stop
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '1';
			when "0000001" =>
				tm3_vidin_sda <= '1';
				tm3_vidin_scl <= '1';
			when "0000010" => -- start
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '1';
			when "0000011" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';

			when "0000100" =>
				tm3_vidin_sda <= '0'; -- address 48
				tm3_vidin_scl <= '1'; -- 0
			when "0000101" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';
			when "0000110" =>
				tm3_vidin_sda <= '1';
				tm3_vidin_scl <= '0';
			when "0000111" =>
				tm3_vidin_sda <= '1';
				tm3_vidin_scl <= '1'; -- 1
			when "0001000" =>
				tm3_vidin_sda <= '1';
				tm3_vidin_scl <= '0';
			when "0001001" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';
			when "0001010" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '1'; -- 0
			when "0001011" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';
			when "0001100" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '1'; -- 0
			when "0001101" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';
			when "0001110" =>
				tm3_vidin_sda <= '1';
				tm3_vidin_scl <= '0';
			when "0001111" =>
				tm3_vidin_sda <= '1';
				tm3_vidin_scl <= '1'; -- 1
			when "0010000" =>
				tm3_vidin_sda <= '1';
				tm3_vidin_scl <= '0';
			when "0010001" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';
			when "0010010" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '1'; -- 0
			when "0010011" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';
			when "0010100" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '1'; -- 0
			when "0010101" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';
			when "0010110" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '1'; -- 0
			when "0010111" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';

			when "0011000" =>
				tm3_vidin_sda <= '0'; -- ack
				tm3_vidin_scl <= '1'; 
			when "0011001" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';

			when "0011010" =>
				tm3_vidin_sda <= iicaddr(7); -- subaddress
				tm3_vidin_scl <= '0';
			when "0011011" =>
				tm3_vidin_sda <= iicaddr(7);
				tm3_vidin_scl <= '1';
			when "0011100" =>
				tm3_vidin_sda <= iicaddr(7);
				tm3_vidin_scl <= '0';
			when "0011101" =>
				tm3_vidin_sda <= iicaddr(6);
				tm3_vidin_scl <= '0';
			when "0011110" =>
				tm3_vidin_sda <= iicaddr(6);
				tm3_vidin_scl <= '1';
			when "0011111" =>
				tm3_vidin_sda <= iicaddr(6);
				tm3_vidin_scl <= '0';
			when "0100000" =>
				tm3_vidin_sda <= iicaddr(5);
				tm3_vidin_scl <= '0';
			when "0100001" =>
				tm3_vidin_sda <= iicaddr(5);
				tm3_vidin_scl <= '1';
			when "0100010" =>
				tm3_vidin_sda <= iicaddr(5);
				tm3_vidin_scl <= '0';
			when "0100011" =>
				tm3_vidin_sda <= iicaddr(4);
				tm3_vidin_scl <= '0';
			when "0100100" =>
				tm3_vidin_sda <= iicaddr(4);
				tm3_vidin_scl <= '1';
			when "0100101" =>
				tm3_vidin_sda <= iicaddr(4);
				tm3_vidin_scl <= '0';
			when "0100110" =>
				tm3_vidin_sda <= iicaddr(3);
				tm3_vidin_scl <= '0';
			when "0100111" =>
				tm3_vidin_sda <= iicaddr(3);
				tm3_vidin_scl <= '1';
			when "0101000" =>
				tm3_vidin_sda <= iicaddr(3);
				tm3_vidin_scl <= '0';
			when "0101001" =>
				tm3_vidin_sda <= iicaddr(2);
				tm3_vidin_scl <= '0';
			when "0101010" =>
				tm3_vidin_sda <= iicaddr(2);
				tm3_vidin_scl <= '1';
			when "0101011" =>
				tm3_vidin_sda <= iicaddr(2);
				tm3_vidin_scl <= '0';
			when "0101100" =>
				tm3_vidin_sda <= iicaddr(1);
				tm3_vidin_scl <= '0';
			when "0101101" =>
				tm3_vidin_sda <= iicaddr(1);
				tm3_vidin_scl <= '1';
			when "0101110" =>
				tm3_vidin_sda <= iicaddr(1);
				tm3_vidin_scl <= '0';
			when "0101111" =>
				tm3_vidin_sda <= iicaddr(0);
				tm3_vidin_scl <= '0';
			when "0110000" =>
				tm3_vidin_sda <= iicaddr(0);
				tm3_vidin_scl <= '1';
			when "0110001" =>
				tm3_vidin_sda <= iicaddr(0);
				tm3_vidin_scl <= '0';
			when "0110010" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';

			when "0110011" =>
				tm3_vidin_sda <= '0'; -- ack
				tm3_vidin_scl <= '1'; 
			when "0110100" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';

			when "0110101" =>
				tm3_vidin_sda <= iicdata(7); -- data
				tm3_vidin_scl <= '0';
			when "0110110" =>
				tm3_vidin_sda <= iicdata(7);
				tm3_vidin_scl <= '1';
			when "0110111" =>
				tm3_vidin_sda <= iicdata(7);
				tm3_vidin_scl <= '0';
			when "0111000" =>
				tm3_vidin_sda <= iicdata(6);
				tm3_vidin_scl <= '0';
			when "0111001" =>
				tm3_vidin_sda <= iicdata(6);
				tm3_vidin_scl <= '1';
			when "0111010" =>
				tm3_vidin_sda <= iicdata(6);
				tm3_vidin_scl <= '0';
			when "0111011" =>
				tm3_vidin_sda <= iicdata(5);
				tm3_vidin_scl <= '0';
			when "0111100" =>
				tm3_vidin_sda <= iicdata(5);
				tm3_vidin_scl <= '1';
			when "0111101" =>
				tm3_vidin_sda <= iicdata(5);
				tm3_vidin_scl <= '0';
			when "0111110" =>
				tm3_vidin_sda <= iicdata(4);
				tm3_vidin_scl <= '0';
			when "0111111" =>
				tm3_vidin_sda <= iicdata(4);
				tm3_vidin_scl <= '1';
			when "1000000" =>
				tm3_vidin_sda <= iicdata(4);
				tm3_vidin_scl <= '0';
			when "1000001" =>
				tm3_vidin_sda <= iicdata(3);
				tm3_vidin_scl <= '0';
			when "1000010" =>
				tm3_vidin_sda <= iicdata(3);
				tm3_vidin_scl <= '1';
			when "1000011" =>
				tm3_vidin_sda <= iicdata(3);
				tm3_vidin_scl <= '0';
			when "1000100" =>
				tm3_vidin_sda <= iicdata(2);
				tm3_vidin_scl <= '0';
			when "1000101" =>
				tm3_vidin_sda <= iicdata(2);
				tm3_vidin_scl <= '1';
			when "1000110" =>
				tm3_vidin_sda <= iicdata(2);
				tm3_vidin_scl <= '0';
			when "1000111" =>
				tm3_vidin_sda <= iicdata(1);
				tm3_vidin_scl <= '0';
			when "1001000" =>
				tm3_vidin_sda <= iicdata(1);
				tm3_vidin_scl <= '1';
			when "1001001" =>
				tm3_vidin_sda <= iicdata(1);
				tm3_vidin_scl <= '0';
			when "1001010" =>
				tm3_vidin_sda <= iicdata(0);
				tm3_vidin_scl <= '0';
			when "1001011" =>
				tm3_vidin_sda <= iicdata(0);
				tm3_vidin_scl <= '1';
			when "1001100" =>
				tm3_vidin_sda <= iicdata(0);
				tm3_vidin_scl <= '0';
			when "1001101" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';

			when "1001110" =>
				tm3_vidin_sda <= '0'; -- ack
				tm3_vidin_scl <= '1'; 
			when "1001111" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '0';

			when "1010000" =>
				tm3_vidin_sda <= '0';
				tm3_vidin_scl <= '1';
			when "1010001" =>
				iic_stop <= '1';
				tm3_vidin_sda <= '1'; -- stop
				tm3_vidin_scl <= '1';

			when others =>
				iic_stop <= '1';
				tm3_vidin_sda <= '1';
				tm3_vidin_scl <= '1';
		end case;
	end if;
	end process;

	process(reg_prog_state,iic_stop) begin
		rst_done <= '0';
		case(reg_prog_state) is
			when reg_prog1 =>
				rst_done <= '1';
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog2;
				else
					reg_prog_nextstate <= reg_prog1;
				end if;
			
			when reg_prog2 =>
				iicaddr <= "00000010"; -- subaddr 02
				iicdata <= "11000" & "00" & svid_comp_state(0);
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog3;
				else
					reg_prog_nextstate <= reg_prog2;
				end if;
			when reg_prog3 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog4;
				else
					reg_prog_nextstate <= reg_prog3;
				end if;
			when reg_prog4 =>
				iicaddr <= "00000011"; -- subaddr 03
				iicdata <= "00100011"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog5;
				else
					reg_prog_nextstate <= reg_prog4;
				end if;
			when reg_prog5 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog6;
				else
					reg_prog_nextstate <= reg_prog5;
				end if;
			when reg_prog6 =>
				iicaddr <= "00000110"; -- subaddr 06
				iicdata <= "11101011"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog7;
				else
					reg_prog_nextstate <= reg_prog6;
				end if;
			when reg_prog7 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog8;
				else
					reg_prog_nextstate <= reg_prog7;
				end if;
			when reg_prog8 =>
				iicaddr <= "00000111"; -- subaddr 07
				iicdata <= "11100000"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog9;
				else
					reg_prog_nextstate <= reg_prog8;
				end if;
			when reg_prog9 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog10;
				else
					reg_prog_nextstate <= reg_prog9;
				end if;
			when reg_prog10 =>
				iicaddr <= "00001000"; -- subaddr 08
				iicdata <= "10000000"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog11;
				else
					reg_prog_nextstate <= reg_prog10;
				end if;
			when reg_prog11 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog12;
				else
					reg_prog_nextstate <= reg_prog11;
				end if;
			when reg_prog12 =>
				iicaddr <= "00001001"; -- subaddr 09
				iicdata <= "00000001"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog13;
				else
					reg_prog_nextstate <= reg_prog12;
				end if;
			when reg_prog13 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog14;
				else
					reg_prog_nextstate <= reg_prog13;
				end if;
			when reg_prog14 =>
				iicaddr <= "00001010"; -- subaddr 0a
				iicdata <= "10000000"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog15;
				else
					reg_prog_nextstate <= reg_prog14;
				end if;
			when reg_prog15 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog16;
				else
					reg_prog_nextstate <= reg_prog15;
				end if;
			when reg_prog16 =>
				iicaddr <= "00001011"; -- subaddr 0b
				iicdata <= "01000111"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog17;
				else
					reg_prog_nextstate <= reg_prog16;
				end if;
			when reg_prog17 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog18;
				else
					reg_prog_nextstate <= reg_prog17;
				end if;
			when reg_prog18 =>
				iicaddr <= "00001100"; -- subaddr 0c
				iicdata <= "01000000"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog19;
				else
					reg_prog_nextstate <= reg_prog18;
				end if;
			when reg_prog19 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog20;
				else
					reg_prog_nextstate <= reg_prog19;
				end if;
			when reg_prog20 =>
				iicaddr <= "00001110"; -- subaddr 0e
				iicdata <= "00000001"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog21;
				else
					reg_prog_nextstate <= reg_prog20;
				end if;
			when reg_prog21 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog22;
				else
					reg_prog_nextstate <= reg_prog21;
				end if;
			when reg_prog22 =>
				iicaddr <= "00010000"; -- subaddr 10
				iicdata <= "00000000"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog23;
				else
					reg_prog_nextstate <= reg_prog22;
				end if;
			when reg_prog23 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog24;
				else
					reg_prog_nextstate <= reg_prog23;
				end if;
			when reg_prog24 =>
				iicaddr <= "00010001"; -- subaddr 11
				iicdata <= "00011100"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog25;
				else
					reg_prog_nextstate <= reg_prog24;
				end if;
			when reg_prog25 =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '1';
				if iic_stop = '0' then
					reg_prog_nextstate <= reg_prog26;
				else
					reg_prog_nextstate <= reg_prog25;
				end if;
			when reg_prog26 =>
				iicaddr <= "00010010"; -- subaddr 12
				iicdata <= "00001001"; 
				iic_start <= '0';
				if iic_stop = '1' then
					reg_prog_nextstate <= reg_prog_end;
				else
					reg_prog_nextstate <= reg_prog26;
				end if;
			when reg_prog_end =>
				iicaddr <= "00000000";
				iicdata <= "00000000"; 
				iic_start <= '0';
				reg_prog_nextstate <= reg_prog_end;
		end case;
	end process;
			

	process(tm3_clk_v2) begin
		if (tm3_clk_v2'event and tm3_clk_v2 = '1') then
			if rst_done = '1' then
				rst <= '1';
			end if;
			
			temp_reg1 <= tm3_vidin_rts0;
			temp_reg2 <= temp_reg1;
			
			if rst = '0' then
				reg_prog_state <= reg_prog1;
			elsif (temp_reg1 = '0') and (temp_reg2 = '1') then
				reg_prog_state <= reg_prog1;
				svid_comp_state <= not(svid_comp_state);
				svid_comp_switch <= svid_comp_state(2) ;
			else	 
				reg_prog_state <= reg_prog_nextstate;
			end if;
			if iic_stop = '0' then
				iic_state <= iic_state + 1;
			elsif iic_start = '1' then
				iic_state <= "0000001";
			end if;
		end if;
	end process;

end arch_sv_chip3;

