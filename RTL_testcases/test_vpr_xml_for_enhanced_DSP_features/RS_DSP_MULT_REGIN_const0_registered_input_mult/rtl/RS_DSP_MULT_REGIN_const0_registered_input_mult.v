module RS_DSP_MULT_REGIN_const0_registered_input_mult (
    input wire clk, reset,
	input  wire [19:0] a,
    input  wire [17:0] b,
    output wire [37:0] z_out
    );

    parameter [79:0] MODE_BITS = 80'd0;
    
    wire [37:0] z_w;

    wire const0_0, const0_1;
    const0 foo0 (.const0(const0_0));
    const0 foo1 (.const0(const0_1));
	RS_DSP_MULT_REGIN #(
    .MODE_BITS(80'h00000000000000000000)) 
        inst(.a(a), .b(b), .z(z_w),. clk(clk), .reset(reset) ,. feedback(3'd1), .unsigned_a(const0_1),. unsigned_b(const0_0));
	
    assign z_out = z_w;

endmodule

module const0 (
    output const0);
endmodule

module const1(const1);
output const1;
endmodule