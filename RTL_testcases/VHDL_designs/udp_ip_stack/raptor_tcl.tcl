create_design UDP_Complete_nomac
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/ipv4_types.vhd
add_design_file ./rtl/arp_types.vhd
add_design_file ./rtl/axi.vhd
add_design_file ./rtl/IPv4_RX.vhd
add_design_file ./rtl/UDP_av2_complete_nomac_tb.vhd
add_design_file ./rtl/tx_client_fifo.vhd
add_design_file ./rtl/IP_complete_nomac.vhd
add_design_file ./rtl/UDP_RX_tb.vhd
add_design_file ./rtl/IPv4_TX_tb.vhd
add_design_file ./rtl/ipv4_types.vhd
add_design_file ./rtl/UDP_complete_nomac_tb.vhd
add_design_file ./rtl/xv6mac_straight.vhd
add_design_file ./rtl/arp_REQ.vhd
add_design_file ./rtl/IP_complete_nomac_tb.vhd
add_design_file ./rtl/arp_TX.vhd
add_design_file ./rtl/ten_100_1g_eth_fifo.vhd
add_design_file ./rtl/UDP_TX.vhd
add_design_file ./rtl/rx_client_fifo.vhd
add_design_file ./rtl/arp_tb.vhd
add_design_file ./rtl/IP_complete.vhd
add_design_file ./rtl/IP_av2_complete_nomac_tb.vhd
add_design_file ./rtl/arpv2.vhd
add_design_file ./rtl/arp_RX.vhd
add_design_file ./rtl/v6_emac_v2_1_fifo_block.vhd
add_design_file ./rtl/UDP_RX.vhd
add_design_file ./rtl/arp_types.vhd
add_design_file ./rtl/UDP_Complete_nomac.vhd
add_design_file ./rtl/axi.vhd
add_design_file ./rtl/arpv2_tb.vhd
add_design_file ./rtl/IPv4_TX.vhd
add_design_file ./rtl/arp_STORE_br.vhd
add_design_file ./rtl/IPv4.vhd
add_design_file ./rtl/UDP_TX_tb.vhd
add_design_file ./rtl/UDP_Complete.vhd
add_design_file ./rtl/UDP_integration_example.vhd
add_design_file ./rtl/arp_SYNC.vhd
add_design_file ./rtl/IPv4_RX_tb.vhd
add_design_file ./rtl/arp.vhd
add_design_file ./rtl/arp_STORE_tb.vhd
add_design_file ./rtl/tx_arbitrator.vhd
set_top_module UDP_Complete_nomac
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
