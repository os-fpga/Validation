 
create_clock -period 20 [get_ports clk1]
create_clock -period 10 [get_ports clk2]

set_false_path -from [get_clocks {clk1}] -to [get_clocks {clk2}]
set_false_path -from [get_clocks {clk2}] -to [get_clocks {clk1}]