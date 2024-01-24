create_clock -period 5 clk_in
set_input_delay 1 -clock clk_in [get_ports {*}] 
set_output_delay 1 -clock clk_in [get_ports {*}] 
