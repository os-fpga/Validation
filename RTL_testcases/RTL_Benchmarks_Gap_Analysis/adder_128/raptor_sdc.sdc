create_clock -period 2.5  -name rscga_virt_clk
set_input_delay 0 -clock rscga_virt_clk [get_ports {*}]
set_output_delay 0 -clock rscga_virt_clk [get_ports {*}]

