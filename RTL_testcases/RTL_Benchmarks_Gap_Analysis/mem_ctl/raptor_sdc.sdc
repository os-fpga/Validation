create_clock -period 2.5 clk_i
set_input_delay 0 -clock clk_i [get_ports {*}]
set_output_delay 0 -clock clk_i [get_ports {*}]
create_clock -period 2.5 mc_clk_i
set_input_delay 0 -clock mc_clk_i [get_ports {*}]
set_output_delay 0 -clock mc_clk_i [get_ports {*}]