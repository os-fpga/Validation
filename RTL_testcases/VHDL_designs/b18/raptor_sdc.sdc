create_clock -period 2.5 clock
set_input_delay -clock clock -max 0.1 [get_ports {*}]
set_output_delay -clock clock -max 0.1 [get_ports {*}]