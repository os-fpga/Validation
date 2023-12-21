create_clock -period 2.5 CLK_I
set_input_delay 0.1 -clock CLK_I[get_ports {*}]
set_output_delay 0.1 -clock CLK_I [get_ports {*}]
