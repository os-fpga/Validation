module RS_DSP_MULTACC_REGIN_REGOUT_const0_const1_registered_in_accum_out_registered (
	input  wire [19:0] a,
    input  wire [17:0] b,
	input wire clk, reset,
    output wire [37:0] z_out
    );

    parameter [79:0] MODE_BITS = 80'd0;
    
    wire [37:0] z_w;
	wire reset;

    wire const1_0, const1_1, const1_2, const0_0, const0_1, const0_2, const0_3, const0_4, const0_5, const0_6, const0_7, const0_8, const0_9, const0_10, const0_11;
    const1 foo0 (.const1(const1_0));
    const1 foo1 (.const1(const1_1));
    const1 foo2 (.const1(const1_2));
    const0 foo3 (.const0(const0_0));
    const0 foo4 (.const0(const0_1));
    const0 foo5 (.const0(const0_3));
    const0 foo6 (.const0(const0_4));
    const0 foo7 (.const0(const0_5));
    const0 foo8 (.const0(const0_6));
    const0 foo9 (.const0(const0_7));
    const0 foo10 (.const0(const0_8));
    const0 foo11 (.const0(const0_9));
    const0 foo12 (.const0(const0_10));
    const0 foo13 (.const0(const0_11));

	RS_DSP_MULTACC_REGIN_REGOUT #(
    .MODE_BITS(80'h00000000000000000000)) 
        inst(.a(a), .b(b), .z(z_w),. clk(clk), .reset(reset),. load_acc(1'b1) ,. feedback(3'd1), .unsigned_a(1'b1), .unsigned_b(1'b1), . saturate_enable(1'b0),. shift_right(6'b0),. round(1'b0),.subtract(1'b0));
	
    assign z_out = z_w;

endmodule

module const1 (
    output const1);
endmodule
module const0 (
    output const0);
endmodule