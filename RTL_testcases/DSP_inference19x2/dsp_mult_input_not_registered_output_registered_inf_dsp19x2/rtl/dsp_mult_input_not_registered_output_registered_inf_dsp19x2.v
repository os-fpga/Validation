 
module dsp_mult_input_not_registered_output_registered_inf_dsp19x2(clk, reset, A1, A2, B1, B2, P);
	input  clk, reset;
	input  [9:0] A1;
	input  [9:0] A2;
	input  [8:0] B1;
	input  [8:0] B2;
	output reg [37:0] P;
	reg    [31:0] mult1;
	reg    [31:0] mult2;

	always @ (*)  begin
		mult1  = A1 * B1;
        mult2  = A2 * B2;
	end

	always@(posedge clk, negedge reset) begin
	 if(reset == 0)
	 	P <= 0;
	 else 
	    P <= {mult2[18:0],mult1[18:0]};
	end

endmodule 