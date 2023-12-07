create_clock -period 2.5 clk_i
set_input_delay 0.1 -clock clk_i [get_ports {*}]
set_output_delay 0.1 -clock clk_i [get_ports {*}]
create_clock -period 2.5 clk_aon_i
set_input_delay 0.1 -clock clk_aon_i [get_ports {*}]
set_output_delay 0.1 -clock clk_aon_i [get_ports {*}]
create_clock -period 20.8333 clk_usb_48mhz_i
set_input_delay 0.1 -clock clk_usb_48mhz_i [get_ports {*}]
set_output_delay 0.1 -clock clk_usb_48mhz_i [get_ports {*}]