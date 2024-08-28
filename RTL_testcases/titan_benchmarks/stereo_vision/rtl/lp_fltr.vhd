library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lp_fltr is port(
		clk: in std_logic;
		din: in std_logic_vector(fltr_din_w-1 downto 0);
		dout: out std_logic_vector(fltr_din_w-1 downto 0);
		ce : in std_logic);
end lp_fltr;

architecture arch_lp_fltr of lp_fltr is 

signal din_tmp_1 : std_logic_vector(fltr_din_w-1 downto 0);
signal din_tmp_2 : std_logic_vector(fltr_din_w-1 downto 0);
signal din_tmp_3 : std_logic_vector(fltr_din_w-1 downto 0);

signal sum_tmp_1 : std_logic_vector((fltr_din_w+2)-1 downto 0);
signal sum_tmp_2 : std_logic_vector((fltr_din_w+2)-1 downto 0);
signal sum_tmp_3 : std_logic_vector((fltr_din_w+2)-1 downto 0);

signal add_tmp_1 : std_logic_vector((fltr_din_w+2)-1 downto 0);
signal add_tmp_2 : std_logic_vector((fltr_din_w+2)-1 downto 0);


begin

process(clk) begin
		if (clk'event and clk = '1') then
			if ce= '1' then 
				din_tmp_1 <= din;
				din_tmp_2 <= din_tmp_1;
				din_tmp_3 <= din_tmp_2;
 				dout <= add_tmp_2((fltr_din_w+2)-1 DOWNTO 2);
			end if;
			sum_tmp_1 <= din_tmp_1(fltr_din_w-1) & din_tmp_1(fltr_din_w-1) & din_tmp_1;
			sum_tmp_2 <= din_tmp_2(fltr_din_w-1) & din_tmp_2 & "0";
			sum_tmp_3 <= din_tmp_3(fltr_din_w-1) & din_tmp_3(fltr_din_w-1) & din_tmp_3;
			
			add_tmp_1 <= sum_tmp_1 + sum_tmp_2;
			add_tmp_2 <= add_tmp_1 + sum_tmp_3;
		end if;	
end process;

end arch_lp_fltr;
