module RS_DSP_MULTACC_const0_const1_mult_add_to_accumulator (
	input  wire [19:0] a,
    input  wire [17:0] b,
	input wire clk, reset,
    output wire [37:0] z_out
    );

    parameter [79:0] MODE_BITS = 80'd0;
    
    wire [37:0] z_w;
	wire reset;

    wire const1_0, const1_1, const0_0, const0_1, const0_2;
    const1 foo0 (.const1(const1_0));
    const1 foo1 (.const1(const1_1));
    const0 foo2 (.const0(const0_0));
    const0 foo3 (.const0(const0_1));
    const0 foo4 (.const0(const0_2));
	RS_DSP_MULTACC #(
    .MODE_BITS(80'h00000000000000000000)) 
        inst(.a(a), .b(b), .z(z_w),. clk(clk), .reset(reset),. load_acc(1'b1) ,. feedback(3'b0), .unsigned_a(const1_0), .unsigned_b(const1_1),. saturate_enable(const0_0),. shift_right(6'b0),. round(const0_1),.subtract(const0_2));
	
    assign z_out = z_w;

endmodule

module const1 (
    output const1);
endmodule
module const0 (
    output const0);
endmodule