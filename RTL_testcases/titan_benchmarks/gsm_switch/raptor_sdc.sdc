create_clock -period 2.5 clk_33M
set_input_delay 0.1 -clock clk_33M [get_ports {*}]
set_output_delay 0.1 -clock clk_33M [get_ports {*}]
create_clock -period 2.5 clk_320M
set_input_delay 0.1 -clock clk_320M [get_ports {*}]
set_output_delay 0.1 -clock clk_320M [get_ports {*}]
create_clock -period 2.5 clk_80M
set_input_delay 0.1 -clock clk_80M [get_ports {*}]
set_output_delay 0.1 -clock clk_80M [get_ports {*}]
create_clock -period 2.5 shift_clk
set_input_delay 0.1 -clock shift_clk [get_ports {*}]
set_output_delay 0.1 -clock shift_clk [get_ports {*}]
