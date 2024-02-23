module RS_DSP_MULT_REGIN_REGOUT_registered_in_and_out_mult (
    input wire clk, reset,
	input  wire [19:0] a,
    input  wire [17:0] b,
    output wire [37:0] z_out
    );

    parameter [79:0] MODE_BITS = 80'd0;
    
    wire [37:0] z_w;

	RS_DSP_MULT_REGIN_REGOUT #(
    .MODE_BITS(80'h00000000000000000000)) 
        inst(.a(a), .b(b), .z(z_w), .clk(clk), .lreset(reset) ,.feedback(3'd1), .unsigned_a(1'b0), .unsigned_b(1'b0));
	
    assign z_out = z_w;

endmodule
