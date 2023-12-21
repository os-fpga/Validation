create_design arp_responder
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/arp_package.vhd
add_design_file ./rtl/edge_detector.vhd
add_design_file ./rtl/arp_responder.vhd
set_top_module arp_responder
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
