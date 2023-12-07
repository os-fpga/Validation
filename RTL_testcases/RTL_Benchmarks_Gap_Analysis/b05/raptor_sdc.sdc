create_clock -period 2.5 CLOCK
set_input_delay 0 -clock CLOCK [get_ports {*}]
set_output_delay 0 -clock CLOCK [get_ports {*}]

