module RS_DSP_MULTADD_REGIN_const0_const1_add_shifted_a_to_mult_output_accum_in_reg (
	input  wire [19:0] a,
    input  wire [17:0] b,
    input wire clk, reset,
    input  wire [5:0] acc_fir,
    output wire [37:0] z_out,
    output wire [17:0] dly_b
    );

    parameter [79:0] MODE_BITS = 80'd0;
    
    wire [37:0] z_w;

    wire const1_0, const1_1, const1_2, const1_3, const1_4, const0_0, const0_1, const0_2, const0_3;
    const1 foo0 (.const1(const1_0));
    const1 foo1 (.const1(const1_1));
    const1 foo2 (.const1(const1_2));
    const1 foo7 (.const1(const1_3));
    const1 foo8 (.const1(const1_4));
    const0 foo3 (.const0(const0_0));
    const0 foo4 (.const0(const0_1));
    const0 foo5 (.const0(const0_3));
    const0 foo6 (.const0(const0_4));

	RS_DSP_MULTADD_REGIN #(
    .MODE_BITS(80'h0)) 
        inst(.a(a),.b(b),.z(z_w),.clk(clk),.reset(reset),.load_acc(const1_0),.feedback({const0_0, const1_1, const1_2}),.acc_fir(acc_fir),.unsigned_a(const1_3),.unsigned_b(const1_4)
        ,.saturate_enable(const0_1),.shift_right(6'd0),.round(const0_2),.subtract(const0_3));
	
    assign z_out = z_w;

endmodule

module const1 (
    output const1);
endmodule
module const0 (
    output const0);
endmodule