create_design iicmb_m_av
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/iicmb_int_pkg.vhd
add_design_file ./rtl/iicmb_pkg.vhd
add_design_file ./rtl/conditioner_mux.vhd
add_design_file ./rtl/avalon_mm.vhd
add_design_file ./rtl/sequencer.vhd
add_design_file ./rtl/iicmb_m.vhd
add_design_file ./rtl/iicmb_m_av.vhd
add_design_file ./rtl/wishbone.vhd
add_design_file ./rtl/iicmb_int_pkg.vhd
add_design_file ./rtl/regblock.vhd
add_design_file ./rtl/iicmb_m_wb.vhd
add_design_file ./rtl/filter.vhd
add_design_file ./rtl/bus_state.vhd
add_design_file ./rtl/conditioner.vhd
add_design_file ./rtl/mbyte.vhd
add_design_file ./rtl/iicmb_pkg.vhd
add_design_file ./rtl/mbit.vhd
add_design_file ./rtl/iicmb_m_sq.vhd
set_top_module iicmb_m_av
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
