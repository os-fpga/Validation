create_clock -period 2.5 iCLK
set_input_delay 0.1 -clock iCLK [get_ports {*}]
set_output_delay 0.1 -clock iCLK [get_ports {*}]
