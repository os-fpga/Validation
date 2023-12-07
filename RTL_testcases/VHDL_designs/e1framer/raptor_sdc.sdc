create_clock -period 2.5 E1_CLK_in
set_input_delay 0.1 -clock E1_CLK_in [get_ports {*}]
set_output_delay 0.1 -clock E1_CLK_in [get_ports {*}]