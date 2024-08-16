create_clock -period 5 clk
set_clock_uncertainty 0.298
set_input_delay 1 -clock clk [get_ports {din}]
set_input_delay 1 -clock clk [get_ports {oe}]
set_output_delay 1 -clock clk [get_ports {tristate_out}]
