create_clock -period 2.5 aclk_i
set_input_delay 0.1 -clock aclk_i [get_ports {*}]
set_output_delay 0.1 -clock aclk_i [get_ports {*}]

