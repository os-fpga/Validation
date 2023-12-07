create_clock -period 2.5 sclk
set_input_delay 0.1 -clock sclk [get_ports {*}]
set_output_delay 0.1 -clock sclk [get_ports {*}]

create_clock -period 2.5 s_avmm_clk
set_input_delay 0.1 -clock s_avmm_clk [get_ports {*}]
set_output_delay 0.1 -clock s_avmm_clk [get_ports {*}]

set_clock_groups -exclusive -group {sclk} -group {s_avmm_clk}
