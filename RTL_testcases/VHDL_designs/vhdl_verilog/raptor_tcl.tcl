create_design fifo_top
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/sync_fifo.v
add_design_file ./rtl/fifo_top.vhd
set_top_module fifo_top
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
