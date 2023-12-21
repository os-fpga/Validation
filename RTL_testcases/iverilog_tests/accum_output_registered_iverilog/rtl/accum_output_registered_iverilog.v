module accum_output_registered_iverilog (
	input  wire [19:0] a,
        input  wire [17:0] b,
	input wire clk, reset,
        output wire [37:0] z_out
    );

    parameter [79:0] MODE_BITS = 80'd0;
    
    wire [37:0] z_w;
	//wire reset;
	RS_DSP_MULTACC_REGOUT #(
    .MODE_BITS(80'h00000000000000000000)) 
        inst(.a(a), .b(b), .z(z_w),. clk(clk), .lreset(reset),
        . load_acc(1'b1) ,. feedback(3'd1), .unsigned_a(1'b1), 
        .unsigned_b(1'b1), . saturate_enable(1'b0),. shift_right(6'b0),. round(1'b0),.subtract(1'b0));
	
    assign z_out = z_w;

endmodule