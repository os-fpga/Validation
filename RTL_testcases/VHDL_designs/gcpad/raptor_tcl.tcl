create_design gcpad_basic
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/gcpad_pack-p.vhd
add_design_file ./rtl/gcpad_comp-p.vhd
add_design_file ./rtl/gcpad_tx.vhd
add_design_file ./rtl/gcpad_sampler.vhd
add_design_file ./rtl/gcpad_full.vhd
add_design_file ./rtl/gcpad_ctrl.vhd
add_design_file ./rtl/gcpad_rx.vhd
add_design_file ./rtl/gcpad_basic.vhd
set_top_module gcpad_basic
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
