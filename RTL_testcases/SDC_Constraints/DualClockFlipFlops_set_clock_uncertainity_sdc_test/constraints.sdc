 
create_clock -period 20 [get_ports clk1]
create_clock -period 10 [get_ports clk2]

set_clock_uncertainty -from [get_clocks {clk}]  -to [get_clocks {clk2}] 0.1