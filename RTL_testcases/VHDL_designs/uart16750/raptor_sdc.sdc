create_clock -period 2.5 CLK
set_input_delay 0.1 -clock CLK [get_ports {*}]
set_output_delay 0.1 -clock CLK [get_ports {*}]
create_clock -period 2.5 RCLK
set_input_delay 0.1 -clock RCLK [get_ports {*}]
set_output_delay 0.1 -clock RCLK [get_ports {*}]