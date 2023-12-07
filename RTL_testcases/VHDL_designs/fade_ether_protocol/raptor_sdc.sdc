create_clock -period 2.5 clk_user
set_input_delay 0.1 -clock clk_user [get_ports {*}]
set_output_delay 0.1 -clock clk_user [get_ports {*}]