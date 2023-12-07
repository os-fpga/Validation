module add_shifted_a_to_mult_output_accum_out_reg (
	input  wire [19:0] a,
    input  wire [17:0] b,
    input wire clk, reset,
    input  wire [5:0] acc_fir,
    output wire [37:0] z_out
    );

    parameter [79:0] MODE_BITS = 80'd0;
    
    wire [37:0] z_w;
	RS_DSP_MULTADD_REGOUT #(
    .MODE_BITS(80'h0)) 
        inst(.a(a),.b(b),.z(z_w),.clk(clk),.lreset(reset),.load_acc(1'b1),.feedback(3'd3),.acc_fir(acc_fir),.unsigned_a(1'b1),.unsigned_b(1'b1)
        ,.saturate_enable(1'b0),.shift_right(6'd0),.round(1'b0),.subtract(1'b0));
	
    assign z_out = z_w;

endmodule