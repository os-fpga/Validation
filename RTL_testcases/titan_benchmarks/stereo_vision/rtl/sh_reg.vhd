-- Discription: this block creates a simple
-- shift register
 
-- date: Oct.7 ,2001
-- revised : April 8, 2002

-- By:  Ahmad darabiha

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sh_reg is 
	generic(sh_reg_w :integer);
	port(clk : in std_logic;
		wen : in std_logic;
		din_1 : in std_logic_vector(sh_reg_w-1 downto 0);
		din_2 : in std_logic_vector(sh_reg_w-1 downto 0);
		dout_1: out std_logic_vector(sh_reg_w-1 downto 0);
		dout_2: out std_logic_vector(sh_reg_w-1 downto 0));
end sh_reg;

architecture arch_sh_reg of sh_reg is       
	
begin
	process(clk) begin
		if (clk'event and clk = '1') then
			if wen = '1' then
				dout_1 <= din_1;
				dout_2 <= din_2;
			end if;
		end if;
	end process;
end arch_sh_reg;				    		
