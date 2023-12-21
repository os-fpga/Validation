create_design ram_simple_dp_async_read_16384x9
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/ram_simple_dp_async_read_16384x9.v
set_top_module ram_simple_dp_async_read_16384x9
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
