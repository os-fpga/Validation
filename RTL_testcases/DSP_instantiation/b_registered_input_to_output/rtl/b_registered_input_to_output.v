module b_registered_input_to_output (
	input  wire [19:0] a,
    input  wire [17:0] b,
	input wire clk, reset,
    output wire [17:0] dly_b,
    output wire [37:0] z_out
    );

    parameter [83:0] MODE_BITS = 84'd0;
    
    wire [37:0] z_w;
	RS_DSP #(.MODE_BITS(84'h000000000000000000000)) 
        inst(.a(a), .b(b), .acc_fir(6'd0), .z(z_w), .dly_b(dly_b), .clk(clk), 
        .lreset(reset) , .feedback(3'd1), .load_acc(1'b0),
        .unsigned_a(1'b1), .unsigned_b(1'b1), .saturate_enable(1'b0), .shift_right(6'b0),
        .round(1'b0), .subtract(1'b0));
    assign z_out = z_w;

endmodule