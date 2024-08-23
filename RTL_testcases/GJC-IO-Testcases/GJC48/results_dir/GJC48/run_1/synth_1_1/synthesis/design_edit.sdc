#############
#
# Fabric clock assignment
#
#############
# This clock need to route to fabric slot #0
# set_clock_pin -device_clock clk[0] -design_clock clk (Physical port name)
# set_clock_pin -device_clock clk[0] -design_clock $clk_buf_$ibuf_clk (Original clock primitive out-net to fabric)
set_clock_pin   -device_clock clk[0] -design_clock $clk_buf_$ibuf_clk

#############
#
# Each pin mode and location assignment
#
#############
# Clock data from object clk port O is not routed to fabric
# Pin      clk                  :: I_BUF |-> CLK_BUF

# Pin      dma_req_in[0]        :: I_BUF
# set_mode MODE_BP_DIR_A_RX     HP_1_4_2P
# set_io   dma_req_in[0]        HP_1_4_2P            --> (original)
set_io     $ibuf_dma_req_in[0]  HP_1_4_2P            -mode          MODE_BP_DIR_A_RX -internal_pin g2f_rx_in[0]_A

# Pin      dma_req_in[1]        :: I_BUF
# set_mode MODE_BP_DIR_A_RX     HP_1_6_3P
# set_io   dma_req_in[1]        HP_1_6_3P            --> (original)
set_io     $ibuf_dma_req_in[1]  HP_1_6_3P            -mode          MODE_BP_DIR_A_RX -internal_pin g2f_rx_in[0]_A

# Pin      dma_req_in[2]        :: I_BUF
# set_mode MODE_BP_DIR_A_RX     HP_1_8_4P
# set_io   dma_req_in[2]        HP_1_8_4P            --> (original)
set_io     $ibuf_dma_req_in[2]  HP_1_8_4P            -mode          MODE_BP_DIR_A_RX -internal_pin g2f_rx_in[0]_A

# Pin      dma_req_in[3]        :: I_BUF
# set_mode MODE_BP_DIR_A_RX     HP_1_10_5P
# set_io   dma_req_in[3]        HP_1_10_5P           --> (original)
set_io     $ibuf_dma_req_in[3]  HP_1_10_5P           -mode          MODE_BP_DIR_A_RX -internal_pin g2f_rx_in[0]_A

# Pin      reset_n              :: I_BUF
# set_mode MODE_BP_DIR_A_RX     HP_1_2_1P
# set_io   reset_n              HP_1_2_1P            --> (original)
set_io     $ibuf_reset_n        HP_1_2_1P            -mode          MODE_BP_DIR_A_RX -internal_pin g2f_rx_in[0]_A

# Pin      dma_ack_out[0]       :: O_BUFT
# set_mode MODE_BP_DIR_A_TX     HP_1_12_6P
# set_io   dma_ack_out[0]       HP_1_12_6P           --> (original)
set_io     $obuf_dma_ack_out[0] HP_1_12_6P           -mode          MODE_BP_DIR_A_TX -internal_pin f2g_tx_out[0]_A

# Pin      dma_ack_out[1]       :: O_BUFT
# set_mode MODE_BP_DIR_A_TX     HP_1_14_7P
# set_io   dma_ack_out[1]       HP_1_14_7P           --> (original)
set_io     $obuf_dma_ack_out[1] HP_1_14_7P           -mode          MODE_BP_DIR_A_TX -internal_pin f2g_tx_out[0]_A

# Pin      dma_ack_out[2]       :: O_BUFT
# set_mode MODE_BP_DIR_A_TX     HP_1_20_10P
# set_io   dma_ack_out[2]       HP_1_20_10P          --> (original)
set_io     $obuf_dma_ack_out[2] HP_1_20_10P          -mode          MODE_BP_DIR_A_TX -internal_pin f2g_tx_out[0]_A

# Pin      dma_ack_out[3]       :: O_BUFT
# set_mode MODE_BP_DIR_A_TX     HP_1_22_11P
# set_io   dma_ack_out[3]       HP_1_22_11P          --> (original)
set_io     $obuf_dma_ack_out[3] HP_1_22_11P          -mode          MODE_BP_DIR_A_TX -internal_pin f2g_tx_out[0]_A

#############
#
# Internal Control Signals
#
#############
# Module: I_BUF
# LinkedObject: clk
# Location: HP_1_CC_18_9P
# Port: EN
# Signal: in:f2g_in_en_{A|B}
set_io $auto_524 HP_1_CC_18_9P -mode MODE_BP_DIR_A_RX -internal_pin f2g_in_en_A

# Module: I_BUF
# LinkedObject: dma_req_in[0]
# Location: HP_1_4_2P
# Port: EN
# Signal: in:f2g_in_en_{A|B}
set_io $auto_525 HP_1_4_2P     -mode MODE_BP_DIR_A_RX -internal_pin f2g_in_en_A

# Module: I_BUF
# LinkedObject: dma_req_in[1]
# Location: HP_1_6_3P
# Port: EN
# Signal: in:f2g_in_en_{A|B}
set_io $auto_526 HP_1_6_3P     -mode MODE_BP_DIR_A_RX -internal_pin f2g_in_en_A

# Module: I_BUF
# LinkedObject: dma_req_in[2]
# Location: HP_1_8_4P
# Port: EN
# Signal: in:f2g_in_en_{A|B}
set_io $auto_527 HP_1_8_4P     -mode MODE_BP_DIR_A_RX -internal_pin f2g_in_en_A

# Module: I_BUF
# LinkedObject: dma_req_in[3]
# Location: HP_1_10_5P
# Port: EN
# Signal: in:f2g_in_en_{A|B}
set_io $auto_528 HP_1_10_5P    -mode MODE_BP_DIR_A_RX -internal_pin f2g_in_en_A

# Module: I_BUF
# LinkedObject: reset_n
# Location: HP_1_2_1P
# Port: EN
# Signal: in:f2g_in_en_{A|B}
set_io $auto_529 HP_1_2_1P     -mode MODE_BP_DIR_A_RX -internal_pin f2g_in_en_A

# Module: O_BUFT
# LinkedObject: dma_ack_out[0]
# Location: HP_1_12_6P
# Port: T
# Signal: in:f2g_tx_oe_{A|B}
set_io $auto_530 HP_1_12_6P    -mode MODE_BP_DIR_A_TX -internal_pin f2g_tx_oe_A

# Module: O_BUFT
# LinkedObject: dma_ack_out[1]
# Location: HP_1_14_7P
# Port: T
# Signal: in:f2g_tx_oe_{A|B}
set_io $auto_531 HP_1_14_7P    -mode MODE_BP_DIR_A_TX -internal_pin f2g_tx_oe_A

# Module: O_BUFT
# LinkedObject: dma_ack_out[2]
# Location: HP_1_20_10P
# Port: T
# Signal: in:f2g_tx_oe_{A|B}
set_io $auto_532 HP_1_20_10P   -mode MODE_BP_DIR_A_TX -internal_pin f2g_tx_oe_A

# Module: O_BUFT
# LinkedObject: dma_ack_out[3]
# Location: HP_1_22_11P
# Port: T
# Signal: in:f2g_tx_oe_{A|B}
set_io $auto_533 HP_1_22_11P   -mode MODE_BP_DIR_A_TX -internal_pin f2g_tx_oe_A

#############
#
# Each gearbox core clock
#
#############
