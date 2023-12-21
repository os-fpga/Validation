
create_design axi_dmac
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file rtl/sync_data.v
add_design_file rtl/sync_event.v
add_design_file rtl/ad_mem_asym.v
add_design_file rtl/up_axi.v
add_design_file rtl/2d_transfer.v
add_design_file rtl/ad_mem.v
add_design_file rtl/address_generator.v
add_design_file rtl/axi_dmac_burst_memory.v
add_design_file rtl/axi_dmac_regmap.v
add_design_file rtl/axi_dmac_regmap_request.v
add_design_file rtl/axi_dmac_reset_manager.v
add_design_file rtl/axi_dmac_resize_dest.v
add_design_file rtl/axi_dmac_resize_src.v
add_design_file rtl/axi_dmac_response_manager.v
add_design_file rtl/axi_dmac_transfer.v
add_design_file rtl/axi_register_slice.v
add_design_file rtl/data_mover.v
add_design_file rtl/dest_axi_mm.v
add_design_file rtl/dest_axi_stream.v
add_design_file rtl/dest_fifo_inf.v
add_design_file rtl/request_arb.v
add_design_file rtl/request_generator.v
add_design_file rtl/resp.vh
add_design_file rtl/response_generator.v
add_design_file rtl/response_handler.v
add_design_file rtl/splitter.v
add_design_file rtl/src_axi_mm.v
add_design_file rtl/src_axi_stream.v
add_design_file rtl/src_fifo_inf.v
add_design_file rtl/sync_bits.v
add_design_file rtl/sync_gray.v
add_design_file rtl/util_axis_fifo.v
add_design_file rtl/util_axis_fifo_address_generator.v
add_design_file rtl/axi_dmac.v


set_top_module axi_dmac

target_device GEMINI_COMPACT_104x68

# add_constraint_file constraint.sdc
pin_loc_assign_method free
analyze
synthesize delay
packing
place
route

sta 

bitstream
