create_clock -period 2.5 MainClock
set_input_delay 0.1 -clock MainClock [get_ports {*}]
set_output_delay 0.1 -clock MainClock [get_ports {*}]