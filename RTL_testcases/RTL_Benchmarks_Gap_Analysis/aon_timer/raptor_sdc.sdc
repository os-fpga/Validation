create_clock -period 2.5 clk_aon_i
set_input_delay 0 -clock clk_aon_i [get_ports {*}]
set_output_delay 0 -clock clk_aon_i [get_ports {*}]

