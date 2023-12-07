 
create_clock -period 20 [get_ports clk1]
create_clock -period 10 [get_ports clk2]

set_clock_groups -exclusive -group {clk1} -group {clk2}