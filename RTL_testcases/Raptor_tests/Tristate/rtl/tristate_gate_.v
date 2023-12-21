
`timescale 1ns/1ps
module tristate (
    input D_i_buf, 
    output q_reg, 
    input CLK_clk_buf) ;
    (* src="tristate_rtl.v:5" *) wire D_i_buf ; 
    (* src="tristate_rtl.v:6" *) wire CLK_i_buf ; 
    (* src="tristate_rtl.v:6" *) wire CLK_clk_buf ; 
    (* src="tristate_rtl.v:7" *) wire OE_i_buf ; 
    (* src="tristate_rtl.v:11" *) wire q_reg ; 
    (* src="tristate_rtl.v:14" *) dffre q_reg_inst (.D(D_i_buf), .R(1'b0), .E(1'b1), .C(CLK_clk_buf), .Q(q_reg)) ; 
endmodule


