set_top_module GJC46

create_clock -period 10 clkGHz
create_generated_clock -source [get_clocks clkGHz] -multiply_by 50 [get_nets pll_clk]
create_generated_clock -source [get_clocks pll_clk] -divide_by 10 [get_nets fabric_clk_div]

set_input_delay 1 -clock clkGHz [get_ports {reset}]
set_input_delay 1 -clock fabric_clk_div [get_ports {reset}]
set_input_delay 1 -clock clkGHz [get_ports {enable_n}]
set_output_delay 2 -clock clkGHz [get_ports {data_i}]
set_output_delay 2 -clock fabric_clk_div [get_ports {data_o}]
set_output_delay 1 -clock fabric_clk_div [get_ports {bitslip_ctrl_n}]
set_output_delay 1 -clock clkGHz [get_ports {ready}]
