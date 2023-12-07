create_design wb_conmax_top
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/wb_conmax_top.v
add_design_file ./rtl/wb_conmax_slave_if.v
add_design_file ./rtl/wb_conmax_rf.v
add_design_file ./rtl/wb_conmax_pri_enc.v
add_design_file ./rtl/wb_conmax_pri_dec.v
add_design_file ./rtl/wb_conmax_msel.v
add_design_file ./rtl/wb_conmax_master_if.v
add_design_file ./rtl/wb_conmax_defines.v
add_design_file ./rtl/wb_conmax_arb.v
add_design_file ./rtl/shift_registers.v
set_top_module wb_conmax_top
synthesize delay
pin_loc_assign_method free
packing
global_placement
place
route
sta
power
bitstream 
