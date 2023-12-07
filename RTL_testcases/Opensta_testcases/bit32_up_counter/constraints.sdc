create_clock -period 10 clk1  
create_clock -period 10 clk2 
create_clock -period 10 clk3
create_clock -period 10 clk4

set_input_delay 1 -clock clk1 [get_ports {*}]
set_output_delay 1 -clock clk1 [get_ports {*}]

set_input_delay 1 -clock clk2 [get_ports {*}]
set_output_delay 1 -clock clk2 [get_ports {*}]

set_input_delay 1 -clock clk3 [get_ports {*}]
set_output_delay 1 -clock clk3 [get_ports {*}]

set_input_delay 1 -clock clk4 [get_ports {*}]
set_output_delay 1 -clock clk4 [get_ports {*}]

set_false_path -from clk1 -to clk2
set_false_path -from clk3 -to clk4