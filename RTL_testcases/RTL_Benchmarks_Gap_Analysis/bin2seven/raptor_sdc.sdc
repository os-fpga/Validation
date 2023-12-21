create_clock -period 2.5 clock_100Mhz
set_input_delay 0 -clock clock_100Mhz [get_ports {*}]
set_output_delay 0 -clock clock_100Mhz [get_ports {*}]

