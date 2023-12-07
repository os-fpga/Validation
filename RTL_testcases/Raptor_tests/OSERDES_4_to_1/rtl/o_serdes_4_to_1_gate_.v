
`timescale 1ns/1ps
module oserdes_4_to_1 (
    input [3:0] D_i_buf, 
    output [3:0] oserdes_in, 
    input pll_fabric_clock) ;
    (* src="oserdes_4_to_1_rtl.v:6" *) wire [3:0] D_i_buf ; 
    (* src="oserdes_4_to_1_rtl.v:7" *) wire IO_RST_i_buf ; 
    (* src="oserdes_4_to_1_rtl.v:8" *) wire CLK_i_buf ; 
    (* src="oserdes_4_to_1_rtl.v:8" *) wire CLK_clk_buf ; 
    (* src="oserdes_4_to_1_rtl.v:16" *) wire [3:0] oserdes_in ; 
    (* src="oserdes_4_to_1_rtl.v:44" *) wire PLL_LOCK_PLL_inst ; 
    (* src="oserdes_4_to_1_rtl.v:15" *) wire pll_fast_clk ; 
    (* src="oserdes_4_to_1_rtl.v:64" *) wire Q_oserdes_4_inst ; 
    (* src="oserdes_4_to_1_rtl.v:9" *) wire LOAD_WORD_i_buf ; 
    wire pll_fabric_clock ; 
    (* src="oserdes_4_to_1_rtl.v:19" *) dffre Q_0_inst (.D(D_i_buf[0]), .R(1'b0), .E(1'b1), .C(pll_fabric_clock), .Q(oserdes_in[0])) ; 
    (* src="oserdes_4_to_1_rtl.v:19" *) dffre Q_1_inst (.D(D_i_buf[1]), .R(1'b0), .E(1'b1), .C(pll_fabric_clock), .Q(oserdes_in[1])) ; 
    (* src="oserdes_4_to_1_rtl.v:19" *) dffre Q_2_inst (.D(D_i_buf[2]), .R(1'b0), .E(1'b1), .C(pll_fabric_clock), .Q(oserdes_in[2])) ; 
    (* src="oserdes_4_to_1_rtl.v:19" *) dffre Q_3_inst (.D(D_i_buf[3]), .R(1'b0), .E(1'b1), .C(pll_fabric_clock), .Q(oserdes_in[3])) ; 
endmodule


