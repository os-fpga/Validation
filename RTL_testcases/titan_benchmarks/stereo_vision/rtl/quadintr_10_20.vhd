library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity quadintr_10_20 is 
	generic( sh_reg_w : integer);
	port(
		clk: in std_logic;
		new_data : in std_logic;
		din : in type_array_8_10;
		dout : out type_array_16_20);
end quadintr_10_20;

architecture arch_quadintr_10_20 of quadintr_10_20 is
signal dinr : type_array_8_10;
signal tmp_1, tmp_2, tmp_3 : type_array_8_20;
signal add_tmp,doutr : type_array_9_20;

begin
process(clk) begin
	if (clk'event and clk = '1') then		
		if new_data = '1' then
			for i in 0 to 10 loop
				dinr(i) <= din(i);
			end loop;
			for i in 0 to 20 loop 
				dout(i)(15 downto 9) <= (others => doutr(i)(8)); --"0000000"; -- & doutr(i);
				dout(i)(8 downto 0) <= doutr(i);
			end loop;
		end if;

		for i in 0 to 8 loop
				doutr(i*2) <= dinr(i)(sh_reg_w-1) & dinr(i);
				tmp_1(i*2+1) <= (dinr(i)(sh_reg_w-1) & dinr(i)(sh_reg_w-1) & dinr(i)(sh_reg_w-1 downto 2)) +
								(dinr(i)(sh_reg_w-1) & dinr(i)(sh_reg_w-1) & dinr(i)(sh_reg_w-1) & dinr(i)(sh_reg_w-1 downto 3));
				
				tmp_2(i*2+1) <= (dinr(i+1)(sh_reg_w-1)& dinr(i+1)(sh_reg_w-1 downto 1)) +
								(dinr(i+1)(sh_reg_w-1)& dinr(i+1)(sh_reg_w-1) & dinr(i+1)(sh_reg_w-1 downto 2));
				
				tmp_3(i*2+1) <= (dinr(i+2)(sh_reg_w-1)& dinr(i+2)(sh_reg_w-1) & dinr(i+2)(sh_reg_w-1) & dinr(i+2)(sh_reg_w-1 downto 3));

				add_tmp(i*2+1) <= (tmp_1(i*2+1)(sh_reg_w-1) & tmp_1(i*2+1)) + 
								  (tmp_2(i*2+1)(sh_reg_w-1) & tmp_2(i*2+1));

				doutr(i*2+1) <= add_tmp(i*2+1) -
								(tmp_3(i*2+1)(sh_reg_w-1) & tmp_3(i*2+1));
		end loop;

		doutr(18) <= dinr(9)(sh_reg_w-1) & dinr(9);

		tmp_1(19) <= (dinr(8)(sh_reg_w-1)& dinr(8)(sh_reg_w-1) & dinr(8)(sh_reg_w-1) & dinr(8)(sh_reg_w-1 downto 3));

		tmp_2(19) <= (dinr(9)(sh_reg_w-1)& dinr(9)(sh_reg_w-1 downto 1)) +
				(dinr(9)(sh_reg_w-1)& dinr(9)(sh_reg_w-1) & dinr(9)(sh_reg_w-1 downto 2));
				
		tmp_3(19) <= (dinr(10)(sh_reg_w-1) & dinr(10)(sh_reg_w-1) & dinr(10)(sh_reg_w-1 downto 2)) +
			(dinr(10)(sh_reg_w-1) & dinr(10)(sh_reg_w-1) & dinr(10)(sh_reg_w-1) & dinr(10)(sh_reg_w-1 downto 3));

		add_tmp(19) <= (tmp_2(19)(sh_reg_w-1) & tmp_2(19)) + 
						  (tmp_3(19)(sh_reg_w-1) & tmp_3(19));

		doutr(19) <= add_tmp(19) - (tmp_1(19)(sh_reg_w-1) & tmp_1(19));

		doutr(20) <= dinr(10)(sh_reg_w-1) & dinr(10);
	end if;
end process;
end arch_quadintr_10_20;


