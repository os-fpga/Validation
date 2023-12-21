create_clock -period 2.5 -name clock_c
set_input_delay 0 -clock clock_c [get_ports {*}]
set_output_delay 0 -clock clock_c [get_ports {*}]
