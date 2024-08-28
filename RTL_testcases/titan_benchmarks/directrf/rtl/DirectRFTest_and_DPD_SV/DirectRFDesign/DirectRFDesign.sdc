create_clock -period 2.717 -name {clk} [get_ports {clk}]
create_generated_clock -name {bus_clk} [get_ports {bus_clk}] -source clk -divide_by 4 -multiply_by 1
