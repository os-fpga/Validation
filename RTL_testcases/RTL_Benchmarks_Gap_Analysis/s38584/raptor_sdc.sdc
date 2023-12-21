create_clock -period 2.5 blif_clk_net
set_input_delay 0 -clock blif_clk_net [get_ports {*}]
set_output_delay 0 -clock blif_clk_net [get_ports {*}]

