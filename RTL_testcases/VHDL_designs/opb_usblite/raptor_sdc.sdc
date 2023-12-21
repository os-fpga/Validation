create_clock -period 2.5 Clk
set_input_delay 0.1 -clock Clk [get_ports {*}]
set_output_delay 0.1 -clock Clk [get_ports {*}]
create_clock -period 2.5 Usb_Clk
set_input_delay 0.1 -clock Usb_Clk [get_ports {*}]
set_output_delay 0.1 -clock Usb_Clk [get_ports {*}]
