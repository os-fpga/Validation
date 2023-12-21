create_clock -period 2.5 clk
set_input_delay 1 -clock clk [get_ports {*}]
set_output_delay 1 -clock clk [get_ports {*}]

create_clock -period 2.5 lsu_bus_clk_en
set_input_delay 1 -clock lsu_bus_clk_en [get_ports {*}]
set_output_delay 1 -clock lsu_bus_clk_en [get_ports {*}]

create_clock -period 2.5 ifu_bus_clk_en
set_input_delay 1 -clock ifu_bus_clk_en [get_ports {*}]
set_output_delay 1 -clock ifu_bus_clk_en [get_ports {*}]

create_clock -period 2.5 dbg_bus_clk_en
set_input_delay 1 -clock dbg_bus_clk_en [get_ports {*}]
set_output_delay 1 -clock dbg_bus_clk_en [get_ports {*}]

create_clock -period 2.5 dma_bus_clk_en
set_input_delay 1 -clock dma_bus_clk_en [get_ports {*}]
set_output_delay 1 -clock dma_bus_clk_en [get_ports {*}]

set_clock_groups -exclusive -group {clk} -group {lsu_bus_clk_en} -group {ifu_bus_clk_en} -group {dbg_bus_clk_en} -group {dma_bus_clk_en}
