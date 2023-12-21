module RS_DSP_MULTADD_const0_const1_add_shifted_a_to_mult_output (
	input  wire [19:0] a,
    input  wire [17:0] b,
    input wire clk, reset,
    input  wire [5:0] acc_fir,
    output wire [37:0] z_out,
    output wire [17:0] dly_b
    );
    
    wire [37:0] z_w;

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

	RS_DSP_MULTADD #(
    .MODE_BITS(80'h1000)) 
        inst(.a(a),.b(b),.z(z_w),. dly_b(dly_b),. clk(clk),. reset(reset),.load_acc(const0_0),.feedback({const1_0, const0_1, const0_2}),.acc_fir(acc_fir),.unsigned_a(const1_1),.unsigned_b(const1_2)
        ,.saturate_enable(const0_3),.shift_right({const0_4, const0_5, const0_6, const0_7, const0_8, const0_9}),.round(const0_10),.subtract(const0_11));
	
    assign z_out = z_w;

endmodule

module const1 (
    output const1);
endmodule
module const0 (
    output const0);
endmodule