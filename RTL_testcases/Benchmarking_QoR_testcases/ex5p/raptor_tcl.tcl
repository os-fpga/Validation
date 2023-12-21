create_design ex5p -type gate-level
target_device GEMINI_COMPACT_104x68
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
read_netlist ./rtl/ex5p.blif
set_top_module ex5p
synthesize delay
pnr_netlist_lang blif
packing
global_placement
place
route
sta
bitstream 
