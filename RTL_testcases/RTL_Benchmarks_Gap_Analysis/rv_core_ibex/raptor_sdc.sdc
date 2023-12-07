create_clock -period 2.5 clk_i
set_input_delay 0.1 -clock clk_i [get_ports {*}]
set_output_delay 0.1 -clock clk_i [get_ports {*}]
create_clock -period 2.5 clk_edn_i
set_input_delay 0.1 -clock clk_edn_i [get_ports {*}]
set_output_delay 0.1 -clock clk_edn_i [get_ports {*}]
create_clock -period 2.5 clk_esc_i
set_input_delay 0.1 -clock clk_esc_i [get_ports {*}]
set_output_delay 0.1 -clock clk_esc_i [get_ports {*}]