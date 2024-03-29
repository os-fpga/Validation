create_clock -period 2.5 clk_in_i
set_input_delay 0 -clock clk_in_i [get_ports {*}]
set_output_delay 0 -clock clk_in_i [get_ports {*}]

create_clock -period 2.5 clk_out_i
set_input_delay 0 -clock clk_out_i [get_ports {*}]
set_output_delay 0 -clock clk_out_i [get_ports {*}]

set_clock_groups -exclusive -group {clk_in_i} -group {clk_out_i}

set_clock_uncertainty 0.677
