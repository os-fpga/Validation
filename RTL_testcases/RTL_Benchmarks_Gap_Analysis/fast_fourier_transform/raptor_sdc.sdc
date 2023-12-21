create_clock -period 2.5 clock_c
set_input_delay 0.1 -clock clock_c [get_ports {*}]
set_output_delay 0.1 -clock clock_c [get_ports {*}]