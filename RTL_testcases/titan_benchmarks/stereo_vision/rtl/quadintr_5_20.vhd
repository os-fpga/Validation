library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity quadintr_5_20 is 
	generic( sh_reg_w : integer);
	port(
		clk: in std_logic;
		new_data : in std_logic;
		din : in type_array_8_5;    -- scale_4 input
		dout : out type_array_16_20); -- scale_1 output 
end quadintr_5_20;

architecture arch_quadintr_5_20 of quadintr_5_20 is

-- registered input  
signal dinr : type_array_8_5;

-- temporary signals to do 5to10 interpolation
signal tmp_1, tmp_2, tmp_3 : type_array_8_10;
signal add_tmp: type_array_9_10;

-- intermediate 10 point output
signal doutr_10 : type_array_9_10;

-- temporary signals for 10to20 interpolation
signal tmp_1_10, tmp_2_10, tmp_3_10 : type_array_9_20;
signal add_tmp_10,doutr : type_array_9_20;

begin
process(clk) begin
	if (clk'event and clk = '1') then		
		if new_data = '1' then   -- register inputs and outputs
			for i in 0 to 5 loop
				dinr(i) <= din(i);
			end loop;
			for i in 0 to 20 loop 
				dout(i)(15 downto 9) <= ( others => doutr(i)(8)); --"0000000"; -- & doutr(i);
				dout(i)(8 downto 0) <= doutr(i);
			end loop;
		end if;

		for i in 0 to 3 loop
				-- for even numbers output = input
				doutr_10(i*2) <= dinr(i)(sh_reg_w-1) & dinr(i);
				
				-- temp_1 = 0.375*p1 ,  width(temp_1) = width(dinr(i))
				tmp_1(i*2+1) <= (dinr(i)(sh_reg_w-1) & dinr(i)(sh_reg_w-1) & dinr(i)(sh_reg_w-1 downto 2)) +
								(dinr(i)(sh_reg_w-1) & dinr(i)(sh_reg_w-1) & dinr(i)(sh_reg_w-1) & dinr(i)(sh_reg_w-1 downto 3));
				
				-- temp_2 = 0.75*p2 ,  width(temp_2) = width(dinr(i))
				tmp_2(i*2+1) <= (dinr(i+1)(sh_reg_w-1)& dinr(i+1)(sh_reg_w-1 downto 1)) +
								(dinr(i+1)(sh_reg_w-1)& dinr(i+1)(sh_reg_w-1) & dinr(i+1)(sh_reg_w-1 downto 2));
				
				--  temp_3 = 0.125*p3 ,  width(temp_3) = width(dinr(i))
				tmp_3(i*2+1) <= (dinr(i+2)(sh_reg_w-1)& dinr(i+2)(sh_reg_w-1) & dinr(i+2)(sh_reg_w-1) & dinr(i+2)(sh_reg_w-1 downto 3));

				-- add tmp_1 and tmp_2 and increase the width
				add_tmp(i*2+1) <= (tmp_1(i*2+1)(sh_reg_w-1) & tmp_1(i*2+1)) + 
								  (tmp_2(i*2+1)(sh_reg_w-1) & tmp_2(i*2+1));

				-- subtract tmp_3 from add_tmp,  result = 0.375p1 + 0.75p2 - 0.125p3  
				doutr_10(i*2+1) <= add_tmp(i*2+1) -
								(tmp_3(i*2+1)(sh_reg_w-1) & tmp_3(i*2+1));
		end loop;

		-- for even numbers output = input
		doutr_10(8) <= dinr(4)(sh_reg_w-1) & dinr(4);

		-- temp_1 = 0.125*p1 ,  width(temp_1) = width(dinr(i))
		tmp_1(9) <= (dinr(3)(sh_reg_w-1)& dinr(3)(sh_reg_w-1) & dinr(3)(sh_reg_w-1) & dinr(3)(sh_reg_w-1 downto 3));

		-- temp_2 = 0.75*p2 ,  width(temp_2) = width(dinr(i))
		tmp_2(9) <= (dinr(4)(sh_reg_w-1)& dinr(4)(sh_reg_w-1 downto 1)) +
				(dinr(4)(sh_reg_w-1)& dinr(4)(sh_reg_w-1) & dinr(4)(sh_reg_w-1 downto 2));

		--  temp_3 = 0.375*p3 ,  width(temp_3) = width(dinr(i))		
		tmp_3(9) <= (dinr(5)(sh_reg_w-1) & dinr(5)(sh_reg_w-1) & dinr(5)(sh_reg_w-1 downto 2)) +
			(dinr(5)(sh_reg_w-1) & dinr(5)(sh_reg_w-1) & dinr(5)(sh_reg_w-1) & dinr(5)(sh_reg_w-1 downto 3));

		-- add tmp_2 and tmp_3 and increase the width
		add_tmp(9) <= (tmp_2(9)(sh_reg_w-1) & tmp_2(9)) + 
						  (tmp_3(9)(sh_reg_w-1) & tmp_3(9));

		-- subtract tmp_1 from add_tmp,  result = -0.125p1 + 0.75p2 + 0.375p3  
		doutr_10(9) <= add_tmp(9) - (tmp_1(9)(sh_reg_w-1) & tmp_1(9));

		-- for even numbers output = input
		doutr_10(10) <= dinr(5)(sh_reg_w-1) & dinr(5);


		-- do the same as above for 10to20 interpolation
		-- the only diff. is that both input and output are 9 bit wide
		for i in 0 to 8 loop
			doutr(i*2) <= doutr_10(i);
			tmp_1_10(i*2+1) <= (doutr_10(i)(sh_reg_w) & doutr_10(i)(sh_reg_w) & doutr_10(i)(sh_reg_w downto 2)) +
							(doutr_10(i)(sh_reg_w) & doutr_10(i)(sh_reg_w) & doutr_10(i)(sh_reg_w) & doutr_10(i)(sh_reg_w downto 3));
				
			tmp_2_10(i*2+1) <= (doutr_10(i+1)(sh_reg_w)& doutr_10(i+1)(sh_reg_w downto 1)) +
							(doutr_10(i+1)(sh_reg_w)& doutr_10(i+1)(sh_reg_w) & doutr_10(i+1)(sh_reg_w downto 2));
			
			tmp_3_10(i*2+1) <= (doutr_10(i+2)(sh_reg_w)& doutr_10(i+2)(sh_reg_w) & doutr_10(i+2)(sh_reg_w) & doutr_10(i+2)(sh_reg_w downto 3));

			add_tmp_10(i*2+1) <= tmp_1_10(i*2+1) + 
							  tmp_2_10(i*2+1);

			doutr(i*2+1) <= add_tmp_10(i*2+1) -
							tmp_3_10(i*2+1);
		end loop;

		doutr(18) <= doutr_10(9);

		tmp_1_10(19) <= (doutr_10(8)(sh_reg_w)& doutr_10(8)(sh_reg_w) & doutr_10(8)(sh_reg_w) & doutr_10(8)(sh_reg_w downto 3));

		tmp_2_10(19) <= (doutr_10(9)(sh_reg_w)& doutr_10(9)(sh_reg_w downto 1)) +
				(doutr_10(9)(sh_reg_w)& doutr_10(9)(sh_reg_w) & doutr_10(9)(sh_reg_w downto 2));
				
		tmp_3_10(19) <= (doutr_10(10)(sh_reg_w) & doutr_10(10)(sh_reg_w) & doutr_10(10)(sh_reg_w downto 2)) +
			(doutr_10(10)(sh_reg_w) & doutr_10(10)(sh_reg_w) & doutr_10(10)(sh_reg_w) & doutr_10(10)(sh_reg_w downto 3));

		add_tmp_10(19) <= tmp_2_10(19) + tmp_3_10(19);

		doutr(19) <= add_tmp_10(19) - tmp_1_10(19);

		doutr(20) <= doutr_10(10);
	end if;
end process;
end arch_quadintr_5_20;


