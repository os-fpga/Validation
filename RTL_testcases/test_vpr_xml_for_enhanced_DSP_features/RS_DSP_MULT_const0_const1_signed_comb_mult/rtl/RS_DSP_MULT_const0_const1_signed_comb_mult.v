module RS_DSP_MULT_const0_const1_signed_comb_mult (
	input  wire [19:0] a,
    input  wire [17:0] b,
    output wire [37:0] z_out
    );

    parameter [79:0] MODE_BITS = 80'd0;
    
    wire [37:0] z_w;

    wire const1_0, const0_0, const0_1, const0_2;
    const1 foo0 (.const1(const1_0));  
    const0 foo3 (.const0(const0_0));
    const0 foo4 (.const0(const0_1));
    const0 foo5 (.const0(const0_2));


	RS_DSP_MULT #(
    .MODE_BITS(80'h00000000000000000000)) 
        inst(.a(a), .b(b), .z(z_w) ,. feedback(3'b001), .unsigned_a(1'b0), .unsigned_b(1'b0));	
    assign z_out = z_w;

endmodule

module const1 (
    output const1);
endmodule
module const0 (
    output const0);
endmodule

