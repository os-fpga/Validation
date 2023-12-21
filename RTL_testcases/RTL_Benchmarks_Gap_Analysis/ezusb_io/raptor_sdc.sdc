create_clock -period 2.5 ifclk_in
set_input_delay 0.1 -clock ifclk_in [get_ports {*}]
set_output_delay 0.1 -clock ifclk_in [get_ports {*}]

