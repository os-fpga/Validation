create_clock -period 2.5 clk_ast_adc_i
set_input_delay 0 -clock clk_ast_adc_i [get_ports {*}]
set_output_delay 0 -clock clk_ast_adc_i [get_ports {*}]

create_clock -period 2.5 clk_ast_alert_i
set_input_delay 0 -clock clk_ast_alert_i [get_ports {*}]
set_output_delay 0 -clock clk_ast_alert_i [get_ports {*}]

create_clock -period 2.5 clk_ast_es_i
set_input_delay 0 -clock clk_ast_es_i [get_ports {*}]
set_output_delay 0 -clock clk_ast_es_i [get_ports {*}]

create_clock -period 2.5 clk_ast_rng_i
set_input_delay 0 -clock clk_ast_rng_i [get_ports {*}]
set_output_delay 0 -clock clk_ast_rng_i [get_ports {*}]

create_clock -period 2.5 clk_ast_tlul_i
set_input_delay 0 -clock clk_ast_tlul_i [get_ports {*}]
set_output_delay 0 -clock clk_ast_tlul_i [get_ports {*}]

create_clock -period 2.5 clk_ast_ext_i
set_input_delay 0 -clock clk_ast_ext_i [get_ports {*}]
set_output_delay 0 -clock clk_ast_ext_i [get_ports {*}]

set_clock_groups -exclusive -group {clk_ast_adc_i} -group {clk_ast_alert_i} -group {clk_ast_es_i} -group {clk_ast_rng_i} -group {clk_ast_tlul_i} -group {clk_ast_ext_i}
