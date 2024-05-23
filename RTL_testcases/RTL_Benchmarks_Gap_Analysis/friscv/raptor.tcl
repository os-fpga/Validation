create_design friscv
target_device GEMINI_COMPACT_104x68
add_include_path rtl

add_design_file rtl/friscv_alu.sv
add_design_file rtl/friscv_apb_interconnect.sv
add_design_file rtl/friscv_axi_or_tracker.sv
add_design_file rtl/friscv_bit_sync.sv
add_design_file rtl/friscv_bus_perf.sv
add_design_file rtl/friscv_cache_block_fetcher.sv
add_design_file rtl/friscv_cache_blocks.sv
add_design_file rtl/friscv_cache_flusher.sv
add_design_file rtl/friscv_cache_io_fetcher.sv
add_design_file rtl/friscv_cache_memctrl.sv
add_design_file rtl/friscv_cache_ooo_mgt.sv
add_design_file rtl/friscv_cache_prefetcher.sv
add_design_file rtl/friscv_cache_pusher.sv
add_design_file rtl/friscv_checkers.sv
add_design_file rtl/friscv_clint.sv
add_design_file rtl/friscv_control.sv
add_design_file rtl/friscv_control_h.sv
add_design_file rtl/friscv_csr.sv
add_design_file rtl/friscv_dcache.sv
add_design_file rtl/friscv_debug_h.sv
add_design_file rtl/friscv_decoder.sv
add_design_file rtl/friscv_div.sv
add_design_file rtl/friscv_gpios.sv
add_design_file rtl/friscv_h.sv
add_design_file rtl/friscv_icache.sv
add_design_file rtl/friscv_io_subsystem.sv
add_design_file rtl/friscv_m_ext.sv
add_design_file rtl/friscv_mem_router.sv
add_design_file rtl/friscv_memfy.sv
add_design_file rtl/friscv_memfy_h.sv
add_design_file rtl/friscv_mpu.sv
add_design_file rtl/friscv_pipeline.sv
add_design_file rtl/friscv_pmp_region.sv
add_design_file rtl/friscv_processing.sv
add_design_file rtl/friscv_pulser.sv
add_design_file rtl/friscv_ram.sv
add_design_file rtl/friscv_rambe.sv
add_design_file rtl/friscv_registers.sv
add_design_file rtl/friscv_rv32i_core.sv
add_design_file rtl/friscv_rv32i_platform.sv
add_design_file rtl/friscv_scfifo.sv
add_design_file rtl/friscv_stats.sv
add_design_file rtl/friscv_uart.sv

set_top_module friscv_rv32i_core
synthesize delay
packing
place
route
sta
power
bitstream 
 
