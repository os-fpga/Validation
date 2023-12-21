// `include "register.v"
// `include "memory_cntrl.v"

module design108_10_15_top #(parameter WIDTH=32,CHANNEL=10) (clk, rst, in, out);

	localparam OUT_BUS=CHANNEL*WIDTH;
	input clk,rst;
	input [WIDTH-1:0] in;
	output [WIDTH-1:0] out;

	reg [WIDTH-1:0] d_in0;
	wire [WIDTH-1:0] d_out0;

	reg [OUT_BUS-1:0] tmp;

	always @ (posedge clk or posedge rst) begin
		if (rst)
			tmp <= 0;
		else
			tmp <= {tmp[OUT_BUS-(WIDTH-1):0],in};
	end

	always @ (posedge clk) begin
		d_in0 <= tmp[WIDTH-1:0];
		// d_in1 <= tmp[(WIDTH*2)-1:WIDTH*1];
		// d_in2 <= tmp[(WIDTH*3)-1:WIDTH*2];
		// d_in3 <= tmp[(WIDTH*4)-1:WIDTH*3];
		// d_in4 <= tmp[(WIDTH*5)-1:WIDTH*4];
		// d_in5 <= tmp[(WIDTH*6)-1:WIDTH*5];
		// d_in6 <= tmp[(WIDTH*7)-1:WIDTH*6];
		// d_in7 <= tmp[(WIDTH*8)-1:WIDTH*7];
		// d_in8 <= tmp[(WIDTH*9)-1:WIDTH*8];
		// d_in9 <= tmp[(WIDTH*10)-1:WIDTH*9];
	end

	design108_10_15 #(.WIDTH(WIDTH)) design108_10_15_inst(.d_in0(d_in0),.clk(clk),.rst(rst),.d_out0(d_out0));

	assign out = d_out0;

endmodule

module design108_10_15 #(parameter WIDTH=32) (d_in0, d_out0, clk, rst);
	input clk;
	input rst;
	input [WIDTH-1:0] d_in0;
	output [WIDTH-1:0] d_out0; 

	wire [WIDTH-1:0] wire_d0_0;

	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance102(.data_in(wire_d0_0),.data_out(d_out0),.clk(clk),.rst(rst));

endmodule