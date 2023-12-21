create_clock -period 2.5 clk_48mhz_i
set_input_delay 0 -clock clk_48mhz_i [get_ports {*}]
set_output_delay 0 -clock clk_48mhz_i [get_ports {*}]

