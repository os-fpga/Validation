library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top is
    Port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        load : in STD_LOGIC;
        load_value : in STD_LOGIC_VECTOR(7 downto 0);
        count : out STD_LOGIC_VECTOR(7 downto 0)
    );
end top;

architecture rtl of top is
    component async_counter
        Port ( 
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            load : in STD_LOGIC;
            load_value : in STD_LOGIC_VECTOR(7 downto 0);
            count : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal counter_out : STD_LOGIC_VECTOR(7 downto 0);
begin
    counter: async_counter port map (clk, rst, load, load_value, counter_out);
    count <= counter_out;
end rtl;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity async_counter is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        load : in STD_LOGIC;
        load_value : in STD_LOGIC_VECTOR(7 downto 0);
        count : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity async_counter;

architecture rtl of async_counter is
    signal counter_reg : STD_LOGIC_VECTOR(7 downto 0);
begin
    process(clk, rst)
    begin
        if rst = '1' then
            counter_reg <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                counter_reg <= load_value;
            else
                counter_reg <= counter_reg + 1;
            end if;
        end if;
    end process;

    count <= counter_reg;
end architecture rtl;
