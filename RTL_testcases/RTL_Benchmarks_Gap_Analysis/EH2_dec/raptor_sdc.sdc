create_clock -period 2.5 clk
set_input_delay 0 -clock clk [get_ports {*}]
set_output_delay 0 -clock clk [get_ports {*}]

create_clock -period 2.5 free_clk
set_input_delay 0 -clock free_clk [get_ports {*}]
set_output_delay 0 -clock free_clk [get_ports {*}]

create_clock -period 2.5 free_l2clk
set_input_delay 0 -clock free_l2clk [get_ports {*}]
set_output_delay 0 -clock free_l2clk [get_ports {*}]

create_clock -period 2.5 active_thread_l2clk
set_input_delay 0 -clock active_thread_l2clk [get_ports {*}]
set_output_delay 0 -clock active_thread_l2clk [get_ports {*}]

set_clock_groups -exclusive -group {clk} -group {free_clk} -group {free_l2clk} -group {active_thread_l2clk}
