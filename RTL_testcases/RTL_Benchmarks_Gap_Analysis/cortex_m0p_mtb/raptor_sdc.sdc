create_clock -period 2.5 FCLK
set_input_delay 0.1 -clock FCLK [get_ports {*}]
set_output_delay 0.1 -clock FCLK [get_ports {*}]
create_clock -period 2.5 SCLK
set_input_delay 0.1 -clock SCLK [get_ports {*}]
set_output_delay 0.1 -clock SCLK [get_ports {*}]
create_clock -period 2.5 HCLK
set_input_delay 0.1 -clock HCLK [get_ports {*}]
set_output_delay 0.1 -clock HCLK [get_ports {*}]
create_clock -period 2.5 DCLK
set_input_delay 0.1 -clock DCLK [get_ports {*}]
set_output_delay 0.1 -clock DCLK [get_ports {*}]
