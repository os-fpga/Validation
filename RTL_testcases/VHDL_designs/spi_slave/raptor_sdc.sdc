create_clock -period 2.5 OPB_Clk
set_input_delay 0.1 -clock OPB_Clk [get_ports {*}]
set_output_delay 0.1 -clock OPB_Clk [get_ports {*}]
create_clock -period 2.5 sclk
set_input_delay 0.1 -clock sclk [get_ports {*}]
set_output_delay 0.1 -clock sclk [get_ports {*}]