create_design i2c_core_v02
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/i2c_master_v01.vhd
add_design_file ./rtl/i2c_core_v02.vhd
set_top_module i2c_core_v02
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
