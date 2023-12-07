create_clock -period 2.5 clk_main_i
set_input_delay 0 -clock clk_main_i [get_ports {*}]
set_output_delay 0 -clock clk_main_i [get_ports {*}]

create_clock -period 2.5 clk_fixed_i
set_input_delay 0 -clock clk_fixed_i [get_ports {*}]
set_output_delay 0 -clock clk_fixed_i [get_ports {*}]

create_clock -period 2.5 clk_spi_host0_i
set_input_delay 0 -clock clk_spi_host0_i [get_ports {*}]
set_output_delay 0 -clock clk_spi_host0_i [get_ports {*}]

create_clock -period 2.5 clk_spi_host1_i
set_input_delay 0 -clock clk_spi_host1_i [get_ports {*}]
set_output_delay 0 -clock clk_spi_host1_i [get_ports {*}]

set_clock_groups -exclusive -group {clk_main_i} -group {clk_fixed_i} -group {clk_spi_host0_i} -group {clk_spi_host1_i}
