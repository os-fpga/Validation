create_clock -period 2.5 clk_i
set_input_delay 0 -clock clk_i [get_ports {*}]
set_output_delay 0 -clock clk_i [get_ports {*}]

create_clock -period 2.5 clk_aon_i
set_input_delay 0 -clock clk_aon_i [get_ports {*}]
set_output_delay 0 -clock clk_aon_i [get_ports {*}]

create_clock -period 2.5 clk_io_div4_i
set_input_delay 0 -clock clk_io_div4_i [get_ports {*}]
set_output_delay 0 -clock clk_io_div4_i [get_ports {*}]

create_clock -period 2.5 clk_main_i
set_input_delay 0 -clock clk_main_i [get_ports {*}]
set_output_delay 0 -clock clk_main_i [get_ports {*}]

create_clock -period 2.5 clk_io_i
set_input_delay 0 -clock clk_io_i [get_ports {*}]
set_output_delay 0 -clock clk_io_i [get_ports {*}]

create_clock -period 2.5 clk_io_div2_i
set_input_delay 0 -clock clk_io_div2_i [get_ports {*}]
set_output_delay 0 -clock clk_io_div2_i [get_ports {*}]

create_clock -period 2.5 clk_usb_i
set_input_delay 0 -clock clk_usb_i [get_ports {*}]
set_output_delay 0 -clock clk_usb_i [get_ports {*}]

set_clock_groups -exclusive -group {clk_i} -group {clk_aon_i} -group {clk_io_div4_i} -group {clk_main_i} -group {clk_io_i} -group {clk_io_div2_i} -group {clk_usb_i}
