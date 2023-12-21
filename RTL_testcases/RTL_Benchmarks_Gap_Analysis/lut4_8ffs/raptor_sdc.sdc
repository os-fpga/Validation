create_clock -period 2.5 qck
set_input_delay 0 -clock qck [get_ports {*}]
set_output_delay 0 -clock qck [get_ports {*}]

