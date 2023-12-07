create_clock -period 2.5 clk1
set_input_delay 0.1 -clock clk1 [get_ports {*}]
set_output_delay 0.1 -clock clk1 [get_ports {*}]
create_clock -period 2.5 clk2
set_input_delay 0.1 -clock clk2 [get_ports {*}]
set_output_delay 0.1 -clock clk2 [get_ports {*}]
create_clock -period 2.5 clk3
set_input_delay 0.1 -clock clk3 [get_ports {*}]
set_output_delay 0.1 -clock clk3 [get_ports {*}]
create_clock -period 2.5 clk4
set_input_delay 0.1 -clock clk4 [get_ports {*}]
set_output_delay 0.1 -clock clk4 [get_ports {*}]
create_clock -period 2.5 clk5
set_input_delay 0.1 -clock clk5 [get_ports {*}]
set_output_delay 0.1 -clock clk5 [get_ports {*}]