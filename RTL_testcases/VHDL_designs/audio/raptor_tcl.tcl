create_design HD_ADPCM_Codec
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/HD_ADPCM_Codec.vhd
set_top_module HD_ADPCM_Codec
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
