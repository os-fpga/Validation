module RS_DSP_MULTACC_const1_mult_sub_from_accumulator (
	input  wire [19:0] a,
    input  wire [17:0] b,
	input wire clk, reset,
    output wire [37:0] z_out
    );

    parameter [79:0] MODE_BITS = 80'd0;
    
    wire [37:0] z_w;
	wire reset;
    wire const1_0, const1_1, const1_2;

    const1 foo0 (.const1(const1_0));
    const1 foo1 (.const1(const1_1));
    const1 foo2 (.const1(const1_2));

	RS_DSP_MULTACC #(
    .MODE_BITS(80'h00000000000000000000)) 
        inst(.a(a), .b(b), .z(z_w), .clk(clk), .lreset(reset), .load_acc(1'b1) , .feedback(3'b0), .unsigned_a(const1_0), .unsigned_b(const1_1), .saturate_enable(1'b0), .shift_right(6'b0), .round(1'b0), .subtract(const1_2));
	
    assign z_out = z_w;

endmodule

module const1(
	      input dummy1, 
	      output const1
	     );
  assign const1 = dummy1;
endmodule
