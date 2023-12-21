create_clock -period 2.5 clock
set_input_delay 0.1 -clock clock [get_ports {*}]
set_output_delay 0.1 -clock clock [get_ports {*}]