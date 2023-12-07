create_clock -period 2.5 clk2M
set_input_delay 0.1 -clock clk2M [get_ports {*}]
set_output_delay 0.1 -clock clk2M [get_ports {*}]
