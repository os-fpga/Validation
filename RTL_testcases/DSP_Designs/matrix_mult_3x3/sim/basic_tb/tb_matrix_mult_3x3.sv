`include "../../rtl/matrix_mult_3x3.v"
module tb_matrix_mult_3x3 ();
	
	reg [143:0] A;
	reg [143:0] B;
	
	wire [143:0] Result;
	
	matrix_mult_3x3 inst(.A(A), .B(B), .Result(Result));
	
	initial begin
		
		//Initial inputs
		A={16'd1,16'd2,16'd3,16'd4,16'd5,16'd6,16'd7,16'd8,16'd9};
		B={16'd7,16'd3,16'd5,16'd12,16'd11,16'd17,16'd20,16'd3,16'd0};

		#20;
		
		A={16'd1,16'd2,16'd3,16'd4,16'd5,16'd6,16'd7,16'd7,16'd7};
		B={16'd7,16'd3,16'd5,16'd12,16'd11,16'd17,16'd20,16'd3,16'd0};

		#20;
		
		A={16'd0,16'd2,16'd3,16'd4,16'd5,16'd6,16'd7,16'd7,16'd7};
		B={16'd7,16'd0,16'd0,16'd0,16'd0,16'd0,16'd0,16'd0,16'd0};

		#20;

		A={16'd0,16'd2,16'd3,16'd4,16'd5,16'd6,16'd7,16'd7,16'd7};
		B={16'd0,16'd0,16'd0,16'd0,16'd0,16'd0,16'd0,16'd0,16'd0};

		#100;
		$finish;
		
	end

	initial begin
		$dumpfile("tb.vcd");
		$dumpvars;
	end

endmodule