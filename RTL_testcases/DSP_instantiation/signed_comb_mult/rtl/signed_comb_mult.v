module signed_comb_mult (
	input  wire [19:0] a,
    input  wire [17:0] b,
    output wire [37:0] z_out
    );

    parameter [79:0] MODE_BITS = 80'd0;

    localparam [19:0] COEFF_0 = MODE_BITS[19:0];
    localparam [19:0] COEFF_1 = MODE_BITS[39:20];
    localparam [19:0] COEFF_2 = MODE_BITS[59:40];
    localparam [19:0] COEFF_3 = MODE_BITS[79:60];
    
    wire [37:0] z_w;

	RS_DSP_MULT #(
    .MODE_BITS(80'h00000000000000000000)) 
        inst(.a(a), .b(b), .z(z_w), . feedback(3'b001), .unsigned_a(1'b0), .unsigned_b(1'b0));
	
    assign z_out = z_w;

endmodule



