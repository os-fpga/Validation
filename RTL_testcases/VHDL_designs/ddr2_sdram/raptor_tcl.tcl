create_design Top_Modul_VHDL
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/DDR2_Ram_Core_data_path_0.vhd
add_design_file ./rtl/Clock_VHDL.vhd
add_design_file ./rtl/DDR2_Ram_Core_fifo_1_wr_en_0.vhd
add_design_file ./rtl/DDR2_Ram_Core_ram8d_0.vhd
add_design_file ./rtl/DDR2_Ram_Core_data_read_controller_0.vhd
add_design_file ./rtl/DDR2_Ram_Core_clk_dcm.vhd
add_design_file ./rtl/DDR2_Ram_Core_data_path_iobs_0.vhd
add_design_file ./rtl/DDR2_Ram_Core_tap_dly.vhd
add_design_file ./rtl/DDR2_Ram_Core_cal_ctl.vhd
add_design_file ./rtl/Buttons_VHDL.vhd
add_design_file ./rtl/DDR2_Ram_Core_controller_0.vhd
add_design_file ./rtl/DDR2_Ram_Core_data_write_0.vhd
add_design_file ./rtl/DDR2_Control_VHDL.vhd
add_design_file ./rtl/DDR2_Read_VHDL.vhd
add_design_file ./rtl/DDR2_Ram_Core_data_read_0.vhd
add_design_file ./rtl/DDR2_Ram_Core.vhd
add_design_file ./rtl/DDR2_Ram_Core_infrastructure.vhd
add_design_file ./rtl/DDR2_Ram_Core_top_0.vhd
add_design_file ./rtl/DDR2_Ram_Core_infrastructure_top.vhd
add_design_file ./rtl/Top_Modul_VHDL.vhd
add_design_file ./rtl/DDR2_Ram_Core_wr_gray_cntr.vhd
add_design_file ./rtl/DDR2_Ram_Core_infrastructure_iobs_0.vhd
add_design_file ./rtl/DDR2_Ram_Core_iobs_0.vhd
add_design_file ./rtl/DDR2_Ram_Core_s3_dqs_iob.vhd
add_design_file ./rtl/DDR2_Ram_Core_cal_top.vhd
add_design_file ./rtl/DDR2_Ram_Core_s3_dm_iob.vhd
add_design_file ./rtl/DDR2_Ram_Core_rd_gray_cntr.vhd
add_design_file ./rtl/DDR2_Ram_Core_s3_dq_iob.vhd
add_design_file ./rtl/DDR2_Write_VHDL.vhd
add_design_file ./rtl/DDR2_Ram_Core_controller_iobs_0.vhd
add_design_file ./rtl/DDR2_Ram_Core_dqs_delay_0.vhd
add_design_file ./rtl/DDR2_Ram_Core_parameters_0.vhd
add_design_file ./rtl/DDR2_Ram_Core_fifo_0_wr_en_0.vhd
set_top_module Top_Modul_VHDL
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
