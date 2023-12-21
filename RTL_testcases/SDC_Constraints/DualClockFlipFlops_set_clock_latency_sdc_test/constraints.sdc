 
create_clock -period 20 [get_ports clk1]
create_clock -period 10 [get_ports clk2]

set_clock_latency -source 1.0 [get_clocks clk1]
set_clock_latency -source 1.0 [get_clocks clk2]