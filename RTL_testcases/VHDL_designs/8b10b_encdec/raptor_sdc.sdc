create_clock -period 2.5 SBYTECLK
set_input_delay 0.1 -clock SBYTECLK [get_ports {*}]
set_output_delay 0.1 -clock SBYTECLK [get_ports {*}]