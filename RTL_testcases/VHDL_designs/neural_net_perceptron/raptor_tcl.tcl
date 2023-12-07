create_design p0300_m00000_s_v03_top_level_blk
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/memory_vhd_v03_pkg.vhd
add_design_file ./rtl/p0300_m00020_s_v03_perceptron_blk.vhd
add_design_file ./rtl/p0300_m00033_s_v01_for_loop_memwi_fsm.vhd
add_design_file ./rtl/p0300_m00102_s_v01_mem_w.vhd
add_design_file ./rtl/p0300_m00023_s_v02_cal_w_fsm.vhd
add_design_file ./rtl/p0300_m00021_s_v03_wishbone_fsm.vhd
add_design_file ./rtl/p0300_m00022_s_v02_cal_y_fsm.vhd
add_design_file ./rtl/p0300_m00034_s_v01_for_loop_memwj_fsm.vhd
add_design_file ./rtl/p0300_m00027_s_v01_train_fsm.vhd
add_design_file ./rtl/p0300_m00026_s_v02_rd_wr_fsm.vhd
add_design_file ./rtl/p0300_m00028_s_v02_latency_fsm.vhd
add_design_file ./rtl/p0300_m00024_s_v02_test_fsm.vhd
add_design_file ./rtl/p0300_m00025_s_v02_init_fsm.vhd
add_design_file ./rtl/p0300_m00000_s_v03_top_level_blk.vhd
add_design_file ./rtl/p0300_m00101_m_v01_mem_t.vhd
add_design_file ./rtl/p0300_m00103_s_v01_mem_s.vhd
add_design_file ./rtl/p0300_m00100_s_v01_mem_gen_blk.vhd
set_top_module p0300_m00000_s_v03_top_level_blk
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
