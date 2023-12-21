create_clock -period 2.5 sclk
set_input_delay 0 -clock sclk [get_ports {*}]
set_output_delay 0 -clock sclk [get_ports {*}]

