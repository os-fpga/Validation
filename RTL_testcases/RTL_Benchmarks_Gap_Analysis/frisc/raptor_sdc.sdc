create_clock -period 2.5 pclk
set_input_delay 0 -clock pclk [get_ports {*}]
set_output_delay 0 -clock pclk [get_ports {*}]

