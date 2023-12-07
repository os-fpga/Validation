
`timescale 1ns/1ps
module iserdes_1_to_4 (
    input [3:0] iserdes_out, 
    output [3:0] Q_reg, 
    input pll_fabric_clock) ;
    (* src="iserdes_1_to_4_rtl.v:7" *) wire D_i_buf ; 
    (* src="iserdes_1_to_4_rtl.v:8" *) wire IO_RST_i_buf ; 
    (* src="iserdes_1_to_4_rtl.v:9" *) wire CLK_i_buf ; 
    (* src="iserdes_1_to_4_rtl.v:12" *) wire [3:0] Q_reg ; 
    (* src="iserdes_1_to_4_rtl.v:17" *) wire [3:0] iserdes_out ; 
    (* src="iserdes_1_to_4_rtl.v:45" *) wire PLL_LOCK_PLL_inst ; 
    (* src="iserdes_1_to_4_rtl.v:16" *) wire pll_fast_clk ; 
    (* src="iserdes_1_to_4_rtl.v:15" *) wire pll_fabric_clock ; 
    (* src="iserdes_1_to_4_rtl.v:72" *) wire pll_fabric_clock_iserdes_4_inst ; 
    (* src="iserdes_1_to_4_rtl.v:67" *) wire DATA_VALID_iserdes_4_inst ; 
    (* src="iserdes_1_to_4_rtl.v:20" *) dffre Q_0_inst (.D(iserdes_out[0]), .R(1'b0), .E(1'b1), .C(pll_fabric_clock), .Q(Q_reg[0])) ; 
    (* src="iserdes_1_to_4_rtl.v:20" *) dffre Q_1_inst (.D(iserdes_out[1]), .R(1'b0), .E(1'b1), .C(pll_fabric_clock), .Q(Q_reg[1])) ; 
    (* src="iserdes_1_to_4_rtl.v:20" *) dffre Q_2_inst (.D(iserdes_out[2]), .R(1'b0), .E(1'b1), .C(pll_fabric_clock), .Q(Q_reg[2])) ; 
    (* src="iserdes_1_to_4_rtl.v:20" *) dffre Q_3_inst (.D(iserdes_out[3]), .R(1'b0), .E(1'b1), .C(pll_fabric_clock), .Q(Q_reg[3])) ; 
endmodule


