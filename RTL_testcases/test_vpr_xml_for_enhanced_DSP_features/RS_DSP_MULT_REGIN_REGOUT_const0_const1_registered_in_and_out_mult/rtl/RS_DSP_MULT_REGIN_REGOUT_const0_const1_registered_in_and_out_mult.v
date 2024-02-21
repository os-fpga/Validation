module RS_DSP_MULT_REGIN_REGOUT_const0_const1_registered_in_and_out_mult (
    input wire clk, reset,
	input  wire [19:0] a,
    input  wire [17:0] b,
    output wire [37:0] z_out
    );

    parameter [79:0] MODE_BITS = 80'd0;
    
    wire [37:0] z_w;

    wire const1_0, const0_0, const0_1, const0_2, const0_3;
    const1 foo0 (.const1(const1_0));
    const0 foo1 (.const0(const0_3));
    const0 foo2 (.const0(const0_0));
    const0 foo3 (.const0(const0_1));
    const0 foo4 (.const0(const0_2));

	RS_DSP_MULT_REGIN_REGOUT #(
    .MODE_BITS(80'h00000000000000000000)) 
        inst(.a(a), .b(b), .z(z_w), .clk(clk), .lreset(reset) , .feedback({const0_0, const0_1, const1_0}), .unsigned_a(const0_2), .unsigned_b(const0_3));
	
    assign z_out = z_w;

endmodule

module const1 (
    input dummy1,
    output const1);
    assign const1 = dummy1;
endmodule
module const0 (
    input dummy0,
    output const0);
    assign const0 = dummy0;
endmodule
