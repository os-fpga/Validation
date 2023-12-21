create_clock -period 2.5 WbClk
set_input_delay 0.1 -clock WbClk[get_ports {*}]
set_output_delay 0.1 -clock WbClk [get_ports {*}]
