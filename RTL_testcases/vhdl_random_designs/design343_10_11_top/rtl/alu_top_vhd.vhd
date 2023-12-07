
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ALU is
generic(
 WIDTH : integer := 32);
port(	
    A:	in std_logic_vector(WIDTH-1 downto 0);
	B:	in std_logic_vector(WIDTH-1 downto 0);
	Sel:	in std_logic_vector(1 downto 0);
	Res:	out std_logic_vector(WIDTH-1 downto 0)  
);

end ALU;

---------------------------------------------------

architecture behv of ALU is
begin					   

    process(A,B,Sel)
    begin
    
	-- use case statement to achieve 
	-- different operations of ALU

	case Sel is
	    when "00" =>
		   Res <= A + B;
	    when "01" =>						
	       Res <= A + (not B) + 1;
        when "10" =>
		   Res <= A and B;
	    when "11" =>	 
		   Res <= A or B;
	    when others =>	 
		   Res <= x"FFFFFFFF";
        end case;

    end process;

end behv;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu_top_vhd is
generic(
 WIDTH : integer := 32);
port(
    data_in: in std_logic_vector(WIDTH-1 downto 0);
    clk: in std_logic;
    rst: in std_logic;
    data_out: out std_logic_vector(WIDTH-1 downto 0));
end alu_top_vhd;

architecture rtl of alu_top_vhd is
    signal data_out_tmp: std_logic_vector(WIDTH-1 downto 0);
    
begin
    process(clk,rst)
    begin
        if rst = '0' then
            data_out<=(data_out_tmp'range=>'0');
        elsif (clk'event and clk='1') then
            data_out<=data_out_tmp;
        end if;   
    end process;
    
AL : entity work.ALU(behv)
    generic map (
    WIDTH => WIDTH)
    port map(
    A => data_in(WIDTH-1 downto 0),
    B => data_in(WIDTH-1 downto 0),
    sel => data_in(1 downto 0),
    RES  => data_out_tmp(WIDTH-1 downto 0)
);
    
end rtl;