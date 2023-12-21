create_clock -period 5 clk1  
create_clock -period 5 clk2 

set_input_delay 1 -clock clk1 [get_ports {*}]
set_output_delay 1 -clock clk1 [get_ports {*}]

set_input_delay 1 -clock clk2 [get_ports {*}]
set_output_delay 1 -clock clk2 [get_ports {*}]