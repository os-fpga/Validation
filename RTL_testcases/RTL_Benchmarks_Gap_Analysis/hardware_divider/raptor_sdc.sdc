create_clock -period 2.5 i_clk
set_input_delay 0.1 -clock i_clk [get_ports {*}]
set_output_delay 0.1 -clock i_clk [get_ports {*}]