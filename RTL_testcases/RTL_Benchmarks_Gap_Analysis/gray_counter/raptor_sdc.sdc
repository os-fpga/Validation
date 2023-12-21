create_clock -period 2.5 clk_counter
set_input_delay 0.1 -clock clk_counter [get_ports {*}]
set_output_delay 0.1 -clock clk_counter [get_ports {*}]
