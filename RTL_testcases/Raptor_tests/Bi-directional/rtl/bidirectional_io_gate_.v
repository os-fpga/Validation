
`timescale 1ns/1ps
module bidirectional_io (
    input BIDIR_IN_i_buf, 
    output BIDIR_OUT_reg, 
    input BIDIR_i_buf, 
    output q_reg, 
    input CLK_clk_buf) ;
    (* src="bidirectional_io_rtl.v:5" *) wire BIDIR_IN_i_buf ; 
    (* src="bidirectional_io_rtl.v:6" *) wire CLK_i_buf ; 
    (* src="bidirectional_io_rtl.v:6" *) wire CLK_clk_buf ; 
    (* src="bidirectional_io_rtl.v:7" *) wire OE_i_buf ; 
    (* src="bidirectional_io_rtl.v:12" *) wire q_reg ; 
    (* src="bidirectional_io_rtl.v:9" *) wire BIDIR_i_buf ; 
    wire BIDIR_OUT_reg ; 
    (* src="bidirectional_io_rtl.v:15" *) dffre q_reg_inst (.D(BIDIR_IN_i_buf), .R(1'b0), .E(1'b1), .C(CLK_clk_buf), .Q(q_reg)) ; 
    (* src="bidirectional_io_rtl.v:16" *) dffre BIDIR_OUT_reg_inst (.D(BIDIR_i_buf), .R(1'b0), .E(1'b1), .C(CLK_clk_buf), .Q(BIDIR_OUT_reg)) ; 
endmodule


