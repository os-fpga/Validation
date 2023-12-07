create_design CompressorTop
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/LZRWcompressor.vhd
add_design_file ./rtl/hash.vhd
add_design_file ./rtl/history.vhd
add_design_file ./rtl/LZRWcompressor.vhd
add_design_file ./rtl/outputEncoder.vhd
add_design_file ./rtl/comparator.vhd
add_design_file ./rtl/outputFIFO.vhd
add_design_file ./rtl/inputFIFO.vhd
add_design_file ./rtl/CompressorTop.vhd
set_top_module CompressorTop
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
