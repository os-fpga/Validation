create_clock -period 2.5 csi_avalon_clk
set_input_delay 0.1 -clock csi_avalon_clk [get_ports {*}]
set_output_delay 0.1 -clock csi_avalon_clk [get_ports {*}]
create_clock -period 2.5 csi_audio_clk
set_input_delay 0.1 -clock csi_audio_clk [get_ports {*}]
set_output_delay 0.1 -clock csi_audio_clk [get_ports {*}]