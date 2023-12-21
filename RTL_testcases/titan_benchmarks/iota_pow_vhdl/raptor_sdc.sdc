create_clock -period 2.5 CLOCK_24
set_input_delay 1 -clock CLOCK_24 [get_ports {*}]
set_output_delay 1 -clock CLOCK_24 [get_ports {*}]

create_clock -period 2.5 CLOCK_27
set_input_delay 1 -clock CLOCK_27 [get_ports {*}]
set_output_delay 1 -clock CLOCK_27 [get_ports {*}]

create_clock -period 2.5 CLOCK_50
set_input_delay 1 -clock CLOCK_50 [get_ports {*}]
set_output_delay 1 -clock CLOCK_50 [get_ports {*}]

create_clock -period 2.5 EXT_CLOCK
set_input_delay 1 -clock EXT_CLOCK [get_ports {*}]
set_output_delay 1 -clock EXT_CLOCK [get_ports {*}]

set_clock_groups -exclusive -group {CLOCK_24} -group {CLOCK_27} -group {CLOCK_50} -group {EXT_CLOCK}
