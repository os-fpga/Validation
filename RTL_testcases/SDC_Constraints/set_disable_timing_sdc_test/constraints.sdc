 
# Define clock signal
create_clock -name clk -period 10 [get_ports clk]

# Disable timing checks for the path from clk to q
set_disable_timing -from [get_ports clk] -to [get_ports q] -rise