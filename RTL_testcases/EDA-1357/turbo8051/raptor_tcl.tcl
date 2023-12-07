create_design turbo8051
target_device GEMINI_COMPACT_82x68
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/defs/oc8051_defines.v
add_design_file ./rtl/lib/async_fifo.v
add_design_file ./rtl/lib/clk_ctl.v
add_design_file ./rtl/clkgen/clkgen.v
add_design_file ./rtl/lib/dble_reg.v
add_design_file ./rtl/lib/double_sync_low.v
add_design_file ./rtl/gmac/ctrl/eth_parser.v
add_design_file ./rtl/gmac/mac/g_cfg_mgmt.v
add_design_file ./rtl/gmac/mac/g_deferral.v
add_design_file ./rtl/gmac/mac/g_deferral_rx.v
add_design_file ./rtl/lib/g_dpath_ctrl.v
add_design_file ./rtl/gmac/mac/g_mac_core.v
add_design_file ./rtl/gmac/top/g_mac_top.v
add_design_file ./rtl/gmac/mac/g_md_intf.v
add_design_file ./rtl/gmac/mac/g_mii_intf.v
add_design_file ./rtl/gmac/crc32/g_rx_crc32.v
add_design_file ./rtl/gmac/mac/g_rx_fsm.v
add_design_file ./rtl/gmac/mac/g_rx_top.v
add_design_file ./rtl/gmac/crc32/g_tx_crc32.v
add_design_file ./rtl/gmac/mac/g_tx_fsm.v
add_design_file ./rtl/gmac/mac/g_tx_top.v
add_design_file ./rtl/8051/oc8051_timescale.v
add_design_file ./rtl/8051/oc8051_acc.v
add_design_file ./rtl/8051/oc8051_alu_src_sel.v
add_design_file ./rtl/8051/oc8051_alu_test.v
add_design_file ./rtl/8051/oc8051_b_register.v
add_design_file ./rtl/8051/oc8051_comp.v
add_design_file ./rtl/8051/oc8051_cy_select.v
add_design_file ./rtl/8051/oc8051_decoder.v
add_design_file ./rtl/8051/oc8051_divide.v
add_design_file ./rtl/8051/oc8051_dptr.v
add_design_file ./rtl/8051/oc8051_indi_addr.v
add_design_file ./rtl/8051/oc8051_int.v
add_design_file ./rtl/8051/oc8051_memory_interface.v
add_design_file ./rtl/8051/oc8051_multiply.v
add_design_file ./rtl/8051/oc8051_ports.v
add_design_file ./rtl/8051/oc8051_psw.v
add_design_file ./rtl/8051/oc8051_ram_256x8_two_bist.v
add_design_file ./rtl/8051/oc8051_ram_top.v
add_design_file ./rtl/8051/oc8051_sfr.v
add_design_file ./rtl/8051/oc8051_sp.v
add_design_file ./rtl/8051/oc8051_tc.v
add_design_file ./rtl/8051/oc8051_tc2.v
add_design_file ./rtl/8051/oc8051_top.v
add_design_file ./rtl/lib/registers.v
add_design_file ./rtl/gmac/mac/s2f_sync.v
add_design_file ./rtl/spi/spi_cfg.v
add_design_file ./rtl/spi/spi_core.v
add_design_file ./rtl/spi/spi_ctl.v
add_design_file ./rtl/spi/spi_if.v
add_design_file ./rtl/lib/stat_counter.v
add_design_file ./rtl/lib/toggle_sync.v
add_design_file ./rtl/uart/uart_cfg.v
add_design_file ./rtl/uart/uart_core.v
add_design_file ./rtl/uart/uart_rxfsm.v
add_design_file ./rtl/uart/uart_txfsm.v
add_design_file ./rtl/lib/wb_crossbar.v
add_design_file ./rtl/lib/wb_rd_mem2mem.v
add_design_file ./rtl/lib/wb_wr_mem2mem.v
add_design_file ./rtl/core/core.v
set_top_module turbo8051
add_constraint_file ./rtl/constraints.sdc
synthesize area
packing
global_placement
place
route
sta
power
bitstream 
