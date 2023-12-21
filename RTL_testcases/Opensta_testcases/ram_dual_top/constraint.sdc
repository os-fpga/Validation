create_clock -period 5 clk1  
create_clock -period 5 clk2 
create_clock -period 5 clk3  
create_clock -period 5 clk4  
create_clock -period 5 clk5 

set_input_delay 1 -clock clk1 [get_ports {*}]
set_output_delay 1 -clock clk1 [get_ports {*}]

set_input_delay 1 -clock clk2 [get_ports {*}]
set_output_delay 1 -clock clk2 [get_ports {*}]

set_input_delay 1 -clock clk3 [get_ports {*}]
set_output_delay 1 -clock clk3 [get_ports {*}]

set_input_delay 1 -clock clk4 [get_ports {*}]
set_output_delay 1 -clock clk4 [get_ports {*}]

set_input_delay 1 -clock clk5 [get_ports {*}]
set_output_delay 1 -clock clk5 [get_ports {*}]