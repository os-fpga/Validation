create_clock -period 2.5 clk4
set_input_delay 0.1 -clock clk4 [get_ports {*}]
set_output_delay 0.1 -clock clk4 [get_ports {*}]