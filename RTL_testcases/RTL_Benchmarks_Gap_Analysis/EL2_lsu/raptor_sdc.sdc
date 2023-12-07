create_clock -period 2.5 active_clk
set_input_delay 0 -clock active_clk [get_ports {*}]
set_output_delay 0 -clock active_clk [get_ports {*}]

create_clock -period 2.5 clk
set_input_delay 0 -clock clk [get_ports {*}]
set_output_delay 0 -clock clk [get_ports {*}]

set_clock_groups -exclusive -group {active_clk} -group {clk}
