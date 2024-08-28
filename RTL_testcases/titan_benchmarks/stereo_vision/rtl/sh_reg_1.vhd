-- Discription: this block creates a simple
-- shift register
 
-- date: July 27 ,2002
-- By:  Ahmad darabiha
-- copy from sh_reg.vhd changed to only 1-in-1-out 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sh_reg_1 is 
	generic(sh_reg_w :integer);
	port(clk : in std_logic;
		wen : in std_logic;
		din_1 : in std_logic_vector(sh_reg_w-1 downto 0);
		dout_1: out std_logic_vector(sh_reg_w-1 downto 0));
end sh_reg_1;

architecture arch_sh_reg_1 of sh_reg_1 is       
	
begin
	process(clk) begin
		if (clk'event and clk = '1') then
			if wen = '1' then
				dout_1 <= din_1;
			end if;
		end if;
	end process;
end arch_sh_reg_1;				    		
