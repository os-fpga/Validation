library ieee;
use work.basic_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity combine_res is port(
		clk : in std_logic;
		wen: in std_logic;
		din_1: in std_logic_vector(7 downto 0);  -- scale_1 is 8 bite wide
		din_2: in std_logic_vector(8 downto 0); -- scale 2 and 4 are 9 bit wide
		din_3: in std_logic_vector(8 downto 0);
		dout: out std_logic_vector(10 downto 0)); 
end combine_res;

architecture arch_combine_res of combine_res is

signal din_1_reg,din_2_reg,din_3_reg : std_logic_vector(8 downto 0);
signal add_tmp, dout_reg : std_logic_vector(10 downto 0);

begin

process(clk) begin
	if (clk'event and clk = '1') then
		if wen = '1' then
			din_1_reg <= din_1(7) & din_1;
			din_2_reg <= din_2;
			din_3_reg <= din_3;

			dout <= dout_reg;
		end if;

		add_tmp <= (din_1_reg(8) & din_1_reg(8) & din_1_reg) + 
					(din_2_reg(8) & din_2_reg(8) & din_2_reg);
		
		dout_reg <= add_tmp + (din_3_reg(8) & din_3_reg(8) & din_3_reg);
	end if;
	
	end process;

end arch_combine_res;
