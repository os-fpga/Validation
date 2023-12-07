
`timescale 1ns/1ps
module input_ddr (
    input [1:0] ddr_out, 
    output [1:0] Q_reg, 
    input CLK_clk_buf) ;
    (* src="input_ddr_rtl.v:6" *) wire D_i_buf ; 
    (* src="input_ddr_rtl.v:7" *) wire CLK_i_buf ; 
    (* src="input_ddr_rtl.v:7" *) wire CLK_clk_buf ; 
    (* src="input_ddr_rtl.v:12" *) wire [1:0] Q_reg ; 
    (* src="input_ddr_rtl.v:12" *) wire [1:0] ddr_out ; 
    (* src="input_ddr_rtl.v:14" *) dffre Q_0_inst (.D(ddr_out[0]), .R(1'b0), .E(1'b1), .C(CLK_clk_buf), .Q(Q_reg[0])) ; 
    (* src="input_ddr_rtl.v:14" *) dffre Q_1_inst (.D(ddr_out[1]), .R(1'b0), .E(1'b1), .C(CLK_clk_buf), .Q(Q_reg[1])) ; 
endmodule


