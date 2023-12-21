create_design dac_dsm2_top
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/dac_dsm2.vhd
add_design_file ./rtl/dac_dsm2_top.vhd
set_top_module dac_dsm2_top
synthesize delay
packing
global_placement
place
route
sta
power
bitstream 
