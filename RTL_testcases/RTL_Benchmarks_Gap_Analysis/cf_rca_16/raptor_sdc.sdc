create_clock -period 2.5 clock_config_c
set_input_delay 0 -clock clock_config_c [get_ports {*}]
set_output_delay 0 -clock clock_config_c [get_ports {*}]

create_clock -period 2.5 clock_main_c
set_input_delay 0 -clock clock_main_c [get_ports {*}]
set_output_delay 0 -clock clock_main_c [get_ports {*}]

set_clock_groups -exclusive -group {clock_config_c} -group {clock_main_c}
