module add_shifted_a_to_mult_output_coeff1_input_registered (
	input  wire [19:0] a,
    input  wire [17:0] b,
    input  wire clk, reset,
    input  wire [5:0] acc_fir,
    output wire [37:0] z_out
    );
    //
    wire [37:0] z_w;
	RS_DSP_MULTADD_REGIN #(
    .MODE_BITS(80'h00000000100000000000)) 
        inst(.a(a),.b(b),.z(z_w),.clk(clk),.lreset(reset),.load_acc(1'b0),.feedback(3'd5),.acc_fir(acc_fir),.unsigned_a(1'b1),.unsigned_b(1'b1)
        ,.saturate_enable(1'b0),.shift_right(6'd0),.round(1'b0),.subtract(1'b0));
	
    assign z_out = z_w;

endmodule