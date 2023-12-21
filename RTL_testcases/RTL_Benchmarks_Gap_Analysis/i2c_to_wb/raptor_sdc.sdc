create_clock -period 2.5 i2c_clk_in
set_input_delay 0.1 -clock i2c_clk_in [get_ports {*}]
set_output_delay 0.1 -clock i2c_clk_in [get_ports {*}]
create_clock -period 2.5 wb_clk_i
set_input_delay 0.1 -clock wb_clk_i [get_ports {*}]
set_output_delay 0.1 -clock wb_clk_i [get_ports {*}]

