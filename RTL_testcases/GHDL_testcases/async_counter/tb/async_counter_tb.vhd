library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;

entity tb_top is
end tb_top;

architecture testbench of tb_top is
    signal clk, rst, load : STD_LOGIC := '0';
    signal load_value, count : STD_LOGIC_VECTOR(7 downto 0);

    component top
        Port ( 
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            load : in STD_LOGIC;
            load_value : in STD_LOGIC_VECTOR(7 downto 0);
            count : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    constant CLK_PERIOD : time := 10 ns;

    -- File for writing report
    file report_file : TEXT;
    variable report_line : LINE;
    variable report_handle : FILE_OPEN_STATUS;

begin
    clk_process: process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Open report file
    file_open(report_handle, "tb_report.txt", write_mode);
    write(report_line, "Testbench report:");
    writeline(report_file, report_line);

    uut: use entity work.top(rtl);

    stimulus_process: process
    begin
        rst <= '1';
        load <= '0';
        load_value <= (others => '0');

        wait for 20 ns;
        rst <= '0';

        wait for 50 ns;
        load <= '1';
        load_value <= "10101010";

        wait for 100 ns;
        load <= '0';

        wait for 200 ns;
        assert count = "10101011" report "Test case 1 failed" severity error;

        -- Write report
        write(report_line, "Test case 1 passed");
        writeline(report_file, report_line);

        wait;
    end process;

    -- Close report file
    file_close(report_file);

end 
testbench;
 
