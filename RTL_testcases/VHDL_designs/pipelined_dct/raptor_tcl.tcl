create_design DCT_AAN
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/DCT8AAN2.vhd
add_design_file ./rtl/DCT_AAN.vhd
add_design_file ./rtl/DCT_BUF.vhd
add_design_file ./rtl/DCT8AAN1.vhd
set_top_module DCT_AAN
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
