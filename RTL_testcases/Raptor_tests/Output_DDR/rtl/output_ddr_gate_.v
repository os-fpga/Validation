
`timescale 1ns/1ps
module output_ddr (
    output [1:0] q_reg, 
    input D_0_i_buf, 
    input D_1_i_buf, 
    input CLK_clk_buf) ;
    (* src="output_ddr_rtl.v:6" *) wire D_0_i_buf ; 
    (* src="output_ddr_rtl.v:6" *) wire D_1_i_buf ; 
    (* src="output_ddr_rtl.v:7" *) wire CLK_i_buf ; 
    (* src="output_ddr_rtl.v:7" *) wire CLK_clk_buf ; 
    (* src="output_ddr_rtl.v:11" *) wire [1:0] q_reg ; 
    (* src="output_ddr_rtl.v:21" *) wire DDR_OUT_oddr_inst ; 
    (* src="output_ddr_rtl.v:14" *) dffre q_reg_0_inst (.D(D_0_i_buf), .R(1'b0), .E(1'b1), .C(CLK_clk_buf), .Q(q_reg[0])) ; 
    (* src="output_ddr_rtl.v:14" *) dffre q_reg_1_inst (.D(D_1_i_buf), .R(1'b0), .E(1'b1), .C(CLK_clk_buf), .Q(q_reg[1])) ; 
endmodule


