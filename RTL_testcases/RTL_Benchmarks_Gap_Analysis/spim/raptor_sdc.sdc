create_clock -period 2.5 sclk_in
set_input_delay 0 -clock sclk_in [get_ports {*}]
set_output_delay 0 -clock sclk_in [get_ports {*}]

create_clock -period 2.5 m_avmm_clk
set_input_delay 0 -clock m_avmm_clk [get_ports {*}]
set_output_delay 0 -clock m_avmm_clk [get_ports {*}]

set_clock_groups -exclusive -group {sclk_in} -group {m_avmm_clk}

set_clock_uncertainty 0.677
