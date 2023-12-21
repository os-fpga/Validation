create_clock -period 2.5 main_fifty_clock
set_input_delay 0.1 -clock main_fifty_clock [get_ports {*}]
set_output_delay 0.1 -clock main_fifty_clock [get_ports {*}]
create_clock -period 2.5 Bus2IP_Clk
set_input_delay 0.1 -clock Bus2IP_Clk [get_ports {*}]
set_output_delay 0.1 -clock Bus2IP_Clk [get_ports {*}]