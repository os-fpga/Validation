create_clock -period 2.5 ck
set_input_delay 0.1 -clock ck [get_ports {*}]
set_output_delay 0.1 -clock ck [get_ports {*}]