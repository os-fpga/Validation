create_clock -period 15 clk  
set_input_delay 6 -clock clk [get_ports {*}]  
set_output_delay 3 -clock clk [get_ports {*}]  
