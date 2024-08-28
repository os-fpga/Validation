library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity find_max is 
	port(
		clk: in std_logic;
		wen: in std_logic;
		d_in: type_array_11_20;
		d_out : out std_logic_vector(7 downto 0);
		indx_out : out std_logic_vector(4 downto 0));
end find_max;

architecture arch_find_max of find_max is
		signal d_in_tmp: type_array_11_20; 
		signal res_1_1 : std_logic_vector(10 downto 0);
		signal res_1_2 : std_logic_vector(10 downto 0);
		signal res_1_3 : std_logic_vector(10 downto 0);
		signal res_1_4 : std_logic_vector(10 downto 0);
		signal res_1_5 : std_logic_vector(10 downto 0);
		signal res_1_6 : std_logic_vector(10 downto 0);
		signal res_1_7 : std_logic_vector(10 downto 0);
		signal res_1_8 : std_logic_vector(10 downto 0);
		signal res_1_9 : std_logic_vector(10 downto 0);
		signal res_1_10 : std_logic_vector(10 downto 0);
		signal res_1_11 : std_logic_vector(10 downto 0);
		signal res_2_1 : std_logic_vector(10 downto 0);
		signal res_2_2 : std_logic_vector(10 downto 0);		
		signal res_2_3 : std_logic_vector(10 downto 0);
		signal res_2_4 : std_logic_vector(10 downto 0);
		signal res_2_5 : std_logic_vector(10 downto 0);
		signal res_2_6 : std_logic_vector(10 downto 0);
		signal res_3_1 : std_logic_vector(10 downto 0);
		signal res_3_2 : std_logic_vector(10 downto 0);
		signal res_3_3 : std_logic_vector(10 downto 0);
		signal res_4_1 : std_logic_vector(10 downto 0);
		signal res_4_2 : std_logic_vector(10 downto 0);
		signal res_5_1 : std_logic_vector(10 downto 0);
		signal indx_1_1,indx_1_2,indx_1_3,indx_1_4,indx_1_5: std_logic_vector(4 downto 0);
		signal indx_1_6,indx_1_7,indx_1_8,indx_1_9,indx_1_10, indx_1_11: std_logic_vector(4 downto 0);
		signal indx_2_1,indx_2_2,indx_2_3,indx_2_4,indx_2_5, indx_2_6: std_logic_vector(4 downto 0);
		signal indx_3_1,indx_3_2,indx_3_3: std_logic_vector(4 downto 0);
		signal indx_4_1,indx_4_2: std_logic_vector(4 downto 0);
		signal indx_5_1 : std_logic_vector(4 downto 0);

begin
process(clk) begin
	if (clk'event and clk = '1') then
		if wen = '1' then 
			for i in 0 to 20 loop 
				d_in_tmp(i) <= d_in(i);
			end loop;
			
			d_out <= res_5_1(10 downto 3);
			indx_out <= indx_5_1;
		end if;

--------------------------------------------------------------
------------   first stage of comparators --------------------
--------------------------------------------------------------

		if d_in(0) > d_in(1) then
			res_1_1 <= d_in(0);
			indx_1_1 <= "00000"; 
		else 
			res_1_1 <= d_in(1);
			indx_1_1 <= "00001"; 
		end if;

		if d_in(2) > d_in(3) then
			res_1_2 <= d_in(2);
			indx_1_2 <= "00010"; 
		else 
			res_1_2 <= d_in(3);
			indx_1_2 <= "00011"; 
		end if;

		if d_in(4) > d_in(5) then
			res_1_3 <= d_in(4);
			indx_1_3 <= "00100"; 
		else 
			res_1_3 <= d_in(5);
			indx_1_3 <= "00101"; 
		end if;

		if d_in(6) > d_in(7) then
			res_1_4 <= d_in(6);
			indx_1_4 <= "00110"; 
		else 
			res_1_4 <= d_in(7);
			indx_1_4 <= "00111"; 
		end if;

		if d_in(8) > d_in(9) then
			res_1_5 <= d_in(8);
			indx_1_5 <= "01000"; 
		else 
			res_1_5 <= d_in(9);
			indx_1_5 <= "01001"; 
		end if;
		
		if d_in(10) > d_in(11) then
			res_1_6 <= d_in(10);
			indx_1_6 <= "01010"; 
		else 
			res_1_6 <= d_in(11);
			indx_1_6 <= "01011"; 
		end if;

		if d_in(12) > d_in(13) then
			res_1_7 <= d_in(12);
			indx_1_7 <= "01100"; 
		else 
			res_1_7 <= d_in(13);
			indx_1_7 <= "01101"; 
		end if;

		if d_in(14) > d_in(15) then
			res_1_8 <= d_in(14);
			indx_1_8 <= "01110"; 
		else 
			res_1_8 <= d_in(15);
			indx_1_8 <= "01111"; 
		end if;

		if d_in(16) > d_in(17) then
			res_1_9 <= d_in(16);
			indx_1_9 <= "10000"; 
		else 
			res_1_9 <= d_in(17);
			indx_1_9 <= "10001"; 
		end if;

		if d_in(18) > d_in(19) then
			res_1_10 <= d_in(18);
			indx_1_10 <= "10010"; 
		else 
			res_1_10 <= d_in(19);
			indx_1_10 <= "10011"; 
		end if;

		res_1_11 <= d_in(20);
		indx_1_11 <= "10100";

---------------------------------------------------------------
--------------------   second stage of comparators ------------
---------------------------------------------------------------

		if res_1_1 > res_1_2 then 
			res_2_1 <= res_1_1;
			indx_2_1 <= indx_1_1;
		else 
			res_2_1 <= res_1_2;
			indx_2_1 <= indx_1_2;
		end if;
		
		if res_1_3 > res_1_4 then 
			res_2_2 <= res_1_3;
			indx_2_2 <= indx_1_3;
		else 
			res_2_2 <= res_1_4;
			indx_2_2 <= indx_1_4;
		end if;

		if res_1_5 > res_1_6 then 
			res_2_3 <= res_1_5;
			indx_2_3 <= indx_1_5;
		else 
			res_2_3 <= res_1_6;
			indx_2_3 <= indx_1_6;
		end if;

		if res_1_7 > res_1_8 then 
			res_2_4 <= res_1_7;
			indx_2_4 <= indx_1_7;
		else 
			res_2_4 <= res_1_8;
			indx_2_4 <= indx_1_8;
		end if;

		if res_1_9 > res_1_10 then 
			res_2_5 <= res_1_9;
			indx_2_5 <= indx_1_9;
		else 
			res_2_5 <= res_1_10;
			indx_2_5 <= indx_1_10;
		end if;

		res_2_6 <= res_1_11;
		indx_2_6 <= indx_1_11;

-------------------------------------------------------------------
---------------------   third stage of comparators ----------------
-------------------------------------------------------------------

		if res_2_1 > res_2_2 then 
			res_3_1 <= res_2_1;
			indx_3_1 <= indx_2_1;
		else 
			res_3_1 <= res_2_2;
			indx_3_1 <= indx_2_2;
		end if;

		if res_2_3 > res_2_4 then 
			res_3_2 <= res_2_3;
			indx_3_2 <= indx_2_3;
		else 
			res_3_2 <= res_2_4;
			indx_3_2 <= indx_2_4;
		end if;

		if res_2_5 > res_2_6 then
			res_3_3 <= res_2_5;
			indx_3_3 <= indx_2_5;
		else 
			res_3_3 <= res_2_6;
			indx_3_3 <= indx_2_6;
		end if;

--------------------------------------------------------------------
---------------------  fourth stage of comparators  ----------------
--------------------------------------------------------------------

		if res_3_1 > res_3_2 then 
			res_4_1 <= res_3_1;
			indx_4_1 <= indx_3_1;
		else 
			res_4_1 <= res_3_2;
			indx_4_1 <= indx_3_2;
		end if;

		res_4_2 <= res_3_3;
		indx_4_2 <= indx_3_3;

--------------------------------------------------------------------
---------------------- fifth stage of comparators   ----------------
--------------------------------------------------------------------

		if res_4_1 > res_4_2 then 
			res_5_1 <= res_4_1;
			indx_5_1 <= indx_4_1;
		else 
			res_5_1 <= res_4_2;
			indx_5_1 <= indx_4_2;
		end if;

--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

	end if;
end process;

end arch_find_max;
