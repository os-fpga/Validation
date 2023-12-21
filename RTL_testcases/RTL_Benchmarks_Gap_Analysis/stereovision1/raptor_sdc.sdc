create_clock -period 2.5 tm3_clk_v0
set_input_delay 0 -clock tm3_clk_v0 [get_ports {*}]
set_output_delay 0 -clock tm3_clk_v0 [get_ports {*}]

