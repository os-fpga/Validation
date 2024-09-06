create_clock -period 10 clk_pll_in

create_generated_clock -source [get_clocks clk_pll_in] -divide_by 1 [get_nets pll_clk]

create_generated_clock -source [get_clocks pll_clk] -divide_by 1 [get_nets fabric_clk_div]

set_input_delay  1 -clock fabric_clk_div [get_ports {reset}]
set_input_delay  1 -clock pll_clk [get_ports {enable_n}]

set_input_delay 2 -clock fabric_clk_div [get_ports data_i_serdes[0]]
set_input_delay 2 -clock fabric_clk_div [get_ports data_i_serdes[1]]
set_input_delay 2 -clock fabric_clk_div [get_ports data_i_serdes[2]]
set_input_delay 2 -clock fabric_clk_div [get_ports data_i_serdes[3]]

set_output_delay 2 -clock fabric_clk_div  [get_ports data_o[0]]
set_output_delay 2 -clock fabric_clk_div  [get_ports data_o[1]]
set_output_delay 2 -clock fabric_clk_div  [get_ports data_o[2]]
set_output_delay 2 -clock fabric_clk_div  [get_ports data_o[3]]

set_output_delay 1 -clock pll_clk [get_ports {ready}]


