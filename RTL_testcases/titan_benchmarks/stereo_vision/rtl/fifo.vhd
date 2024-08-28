-- Discription: this block creates a long fifo
-- of  lengh of the specified length as an input 
-- parameter and with a specified width
 
-- date: Oct.7 ,2001

-- By:  Ahmad darabiha

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fifo is 
	generic(
		fifo_w :integer;
		fifo_l :integer);
	port(
 	 	clk : in std_logic;
		wen : in std_logic;
		din : in std_logic_vector(fifo_w-1 downto 0);
		dout: out std_logic_vector(fifo_w-1 downto 0));
end fifo;

architecture arch_fifo of fifo is       
	signal buff: std_logic_vector((fifo_l+1)*fifo_w-1 downto 0);
	
begin
	process(clk) begin
		if (clk'event and clk = '1') then
			if wen = '1' then
					
				shift_loop: for i in fifo_l downto 1 loop
			       	buff(((i+1)*fifo_w-1) downto i*fifo_w) <= 
							buff(i*fifo_w-1 downto (i-1)*fifo_w); 
				end loop shift_loop;   
					                
				buff(fifo_w-1 downto 0) <= din;
		
				dout <= buff((fifo_l+1)*fifo_w-1 downto fifo_l*fifo_w); 
			end if;
		end if;
	end process;
end arch_fifo;				    		
