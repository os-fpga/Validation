create_design mult_booth_array
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/bd_mult_slice.vhd
add_design_file ./rtl/register_chain.vhd
add_design_file ./rtl/mult_booth_array.vhd
set_top_module mult_booth_array
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
