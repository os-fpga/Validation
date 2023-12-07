
library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_std.all;


entity Mux is
generic(
 WIDTH : integer := 32);
port(	
    I3: 	in std_logic_vector(7 downto 0);
	I2: 	in std_logic_vector(7 downto 0);
	I1: 	in std_logic_vector(7 downto 0);
	I0: 	in std_logic_vector(7 downto 0);
	S:	in std_logic_vector(1 downto 0);
	O:	out std_logic_vector(7 downto 0));
end Mux;

architecture behv1 of Mux is
begin
    process(I3,I2,I1,I0,S)
    begin
    
        -- use case statement
        case S is
	    when "00" =>	O <= I0;
	    when "01" =>	O <= I1;
	    when "10" =>	O <= I2;
	    when "11" =>	O <= I3;
	    when others =>	O <= x"FF";
	end case;

    end process;
end behv1;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux_top_vhd is
generic(
 WIDTH : integer := 32);
port(
    data_in: in std_logic_vector(WIDTH-1 downto 0);
    clk: in std_logic;
    rst: in std_logic;
    data_out: out std_logic_vector(WIDTH-1 downto 0));
end mux_top_vhd;

architecture archi of mux_top_vhd is
    signal data_out_tmp: std_logic_vector(WIDTH-1 downto 0);
    
begin
    process(clk,rst)
    begin
        if rst = '0' then
            data_out<=(data_out_tmp'range=>'0');
        elsif (clk'event and clk='1') then
            data_out(31 downto 24)<=data_out_tmp(31 downto 24);
            data_out(23 downto 16)<=data_out_tmp(31 downto 24);
            data_out(15 downto 8)<=data_out_tmp(31 downto 24);
            data_out(7 downto 0)<=data_out_tmp(31 downto 24);
        end if;   
    end process;
    
MUX : entity work.Mux(behv1)
    generic map (
    WIDTH => WIDTH)
    port map(
    I3 => data_in(7 downto 0),
    I2 => data_in(15 downto 8),
    I1 => data_in(23 downto 16),
    I0 => data_in(31 downto 24),
    S  => data_in(1 downto 0),
    O  => data_out_tmp(31 downto 24)
);
    
end archi;