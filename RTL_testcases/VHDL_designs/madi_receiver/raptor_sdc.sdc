create_clock -period 8 clk_125_in
set_input_delay 0.1 -clock clk_125_in [get_ports {*}]
set_output_delay 0.1 -clock clk_125_in [get_ports {*}]
create_clock -period 2.5 madi_clk_in
set_input_delay 0.1 -clock madi_clk_in [get_ports {*}]
set_output_delay 0.1 -clock madi_clk_in [get_ports {*}]