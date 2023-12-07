create_clock -period 2.5 HCLK
set_input_delay 0 -clock HCLK [get_ports {*}]
set_output_delay 0 -clock HCLK [get_ports {*}]

