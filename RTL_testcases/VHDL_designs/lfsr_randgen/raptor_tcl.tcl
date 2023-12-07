create_design lfsr
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/lfsr_pkg.vhd
add_design_file ./rtl/lfsr.vhd
set_top_module lfsr
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
