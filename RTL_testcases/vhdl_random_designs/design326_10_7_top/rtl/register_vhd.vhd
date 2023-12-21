
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

---------------------------------------------------

entity register_vhd is

generic(WIDTH: natural :=32);
port(  data_in:	in std_logic_vector(WIDTH-1 downto 0);
	   clk:	in std_logic;
	   rst:	in std_logic;
	   data_out:	out std_logic_vector(WIDTH-1 downto 0)
);
end register_vhd;

----------------------------------------------------

architecture behv of register_vhd is

    signal data_out_tmp: std_logic_vector(WIDTH-1 downto 0);

begin

    process(data_in, clk, rst)
    begin

	if rst = '1' then
            data_out_tmp <= (data_out_tmp'range => '0');
	elsif (clk='1' and clk'event) then
		data_out_tmp <= data_in;
	end if;

    end process;

    -- concurrent statement
    data_out <= data_out_tmp;

end behv;

---------------------------------------------------