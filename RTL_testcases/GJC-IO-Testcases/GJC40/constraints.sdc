
create_clock -period 10 clk_pll_in
create_generated_clock -source clk_pll_in -divide_by 1 pll_clk
create_generated_clock -source pll_clk -divide_by 1 fabric_clk_div

set_input_delay 1 -clock fabric_clk_div [get_ports {reset}]
set_input_delay 1 -clock fabric_clk_div [get_ports {enable_n}]
set_output_delay 2 -clock fabric_clk_div [get_ports {data_i}]
set_output_delay 2 -clock fabric_clk_div [get_ports {data_o}]
set_output_delay 2 -clock fabric_clk_div [get_ports {ready}]

