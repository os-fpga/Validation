create_design ALU_HCSA
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/types.vhd
add_design_file ./rtl/types.vhd
add_design_file ./rtl/ALU_HCSA.vhd
set_top_module ALU_HCSA
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
