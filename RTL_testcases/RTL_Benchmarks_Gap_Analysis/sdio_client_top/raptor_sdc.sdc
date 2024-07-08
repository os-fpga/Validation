create_clock -period 2.5 -name sdclk
set_input_delay 0.1 -clock sdclk [get_ports {*}]
set_output_delay 0.1 -clock sdclk [get_ports {*}]