create_clock -period 2.5 pixelclk
set_input_delay 0.1 -clock pixelclk [get_ports {*}]
set_output_delay 0.1 -clock pixelclk [get_ports {*}]
create_clock -period 2.5 gpmc_clk
set_input_delay 0.1 -clock gpmc_clk [get_ports {*}]
set_output_delay 0.1 -clock gpmc_clk [get_ports {*}]
