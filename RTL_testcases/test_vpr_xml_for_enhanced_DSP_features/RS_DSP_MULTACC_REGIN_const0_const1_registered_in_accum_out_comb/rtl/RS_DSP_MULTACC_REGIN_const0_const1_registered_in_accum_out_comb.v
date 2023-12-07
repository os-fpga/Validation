module RS_DSP_MULTACC_REGIN_const0_const1_registered_in_accum_out_comb (
	input  wire [19:0] a,
    input  wire [17:0] b,
	input wire clk, reset,
    output wire [37:0] z_out
    );

    parameter [79:0] MODE_BITS = 80'd0;
    
    wire [37:0] z_w;

    wire const1_0, const1_1, const1_2, const0_0, const0_1, const0_2, const0_3, const0_4;
    const1 foo0 (.const1(const1_0));
    const1 foo1 (.const1(const1_1));
    const1 foo2 (.const1(const1_2));
    const0 foo3 (.const0(const0_0));
    const0 foo4 (.const0(const0_1));
    const0 foo5 (.const0(const0_3));
    const0 foo6 (.const0(const0_4));


	RS_DSP_MULTACC_REGIN #(
    .MODE_BITS(80'h00000000000000000000)) 
        inst(.a(a), .b(b), .z(z_w),. clk(clk), .reset(reset),. load_acc(const1_0) ,. feedback({const0_0, const0_1, const0_2}), .unsigned_a(const1_1), .unsigned_b(const1_2),. saturate_enable(1'b0),. shift_right(6'b0),. round(const0_3),.subtract(const0_4));
	
    assign z_out = z_w;

endmodule

module const1 (
    output const1);
endmodule
module const0 (
    output const0);
endmodule