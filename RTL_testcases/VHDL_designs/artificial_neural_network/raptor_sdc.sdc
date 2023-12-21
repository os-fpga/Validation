create_clock -period 2.5 inputs_s_axis_aclk
set_input_delay 0.1 -clock inputs_s_axis_aclk [get_ports {*}]
set_output_delay 0.1 -clock inputs_s_axis_aclk [get_ports {*}]
create_clock -period 2.5 outputs_m_axis_aclk
set_input_delay 0.1 -clock outputs_m_axis_aclk [get_ports {*}]
set_output_delay 0.1 -clock outputs_m_axis_aclk [get_ports {*}]
create_clock -period 2.5 wyb_s_axi_aclk
set_input_delay 0.1 -clock wyb_s_axi_aclk [get_ports {*}]
set_output_delay 0.1 -clock wyb_s_axi_aclk [get_ports {*}]