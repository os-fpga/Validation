create_clock -period 2.5 clk16x
set_input_delay 0.1 -clock clk16x [get_ports {*}]
set_output_delay 0.1 -clock clk16x [get_ports {*}]
