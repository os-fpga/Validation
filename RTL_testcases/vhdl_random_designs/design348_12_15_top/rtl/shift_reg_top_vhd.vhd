
library ieee ;
use ieee.std_logic_1164.all;

---------------------------------------------------

entity shift_reg is
generic (
    WIDTH : integer := 32);
port(	
    I:		in std_logic_vector (WIDTH-1 downto 0);
	clock:		in std_logic;
	shift:		in std_logic;
	Q:		out std_logic_vector (WIDTH-1 downto 0)
);
end shift_reg;

---------------------------------------------------

architecture behv of shift_reg is

    -- initialize the declared signal
    signal S: std_logic_vector(33 downto 0):="1111111111111111111111111111111111";

begin
    
    process(I, clock, shift, S)
    begin

	-- everything happens upon the clock changing
	if clock'event and clock='1' then
	    if shift = '1' then
		S <= I & S(31 downto 30);
	    end if;
	end if;

    end process;
	
    -- concurrent assignment
    Q <= S (33 downto 2);

end behv;

----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity shift_reg_top_vhd is
generic(
 WIDTH : integer := 32);
port(
    data_in: in std_logic_vector(WIDTH-1 downto 0);
    clk: in std_logic;
    rst: in std_logic;
    data_out: out std_logic_vector(WIDTH-1 downto 0));
end shift_reg_top_vhd;

architecture archi of shift_reg_top_vhd is
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
    
SHIFT : entity work.shift_reg(behv)
    generic map (
    WIDTH => WIDTH)
    port map(
    I => data_in(WIDTH-1 downto 0),
    clock => clk,
    shift => data_in(0),
    Q  => data_out_tmp(WIDTH-1 downto 0)
);
    
end archi;