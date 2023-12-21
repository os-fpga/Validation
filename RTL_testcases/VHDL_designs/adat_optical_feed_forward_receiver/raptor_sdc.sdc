create_clock -period 2 m_clk
set_input_delay 0.1 -clock m_clk [get_ports {*}]
set_output_delay 0.1 -clock m_clk [get_ports {*}]