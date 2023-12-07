create_design adv_dbg_if
target_device GEMINI_COMPACT_104x68
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/adbg_top.v
set_top_module adbg_top
analyze
synthesize delay
packing
global_placement
place
route
sta
power
bitstream 
