// `include "encoder.v"

module design44_2_5_top #(parameter WIDTH=32,CHANNEL=2) (clk, rst, in, out);

	localparam OUT_BUS=CHANNEL*WIDTH;
	input clk,rst;
	input [WIDTH-1:0] in;
	output [WIDTH-1:0] out;

	reg [WIDTH-1:0] d_in0;
	reg [WIDTH-1:0] d_in1;
	wire [WIDTH-1:0] d_out0;
	wire [WIDTH-1:0] d_out1;

	reg [OUT_BUS-1:0] tmp;

	always @ (posedge clk or posedge rst) begin
		if (rst)
			tmp <= 0;
		else
			tmp <= {tmp[OUT_BUS-(WIDTH-1):0],in};
	end

	always @ (posedge clk) begin
		d_in0 <= tmp[WIDTH-1:0];
		d_in1 <= tmp[(WIDTH*2)-1:WIDTH*1];
	end

	design44_2_5 #(.WIDTH(WIDTH)) design44_2_5_inst(.d_in0(d_in0),.d_in1(d_in1),.d_out0(d_out0),.d_out1(d_out1),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1;

endmodule

module design44_2_5 #(parameter WIDTH=32) (d_in0, d_in1, d_out0, d_out1, clk, rst);
	input clk;
	input rst;
	input [WIDTH-1:0] d_in0; 
	input [WIDTH-1:0] d_in1; 
	output [WIDTH-1:0] d_out0; 
	output [WIDTH-1:0] d_out1; 

	wire [WIDTH-1:0] wire_d0_0;
	wire [WIDTH-1:0] wire_d0_1;
	wire [WIDTH-1:0] wire_d0_2;
	wire [WIDTH-1:0] wire_d0_3;
	wire [WIDTH-1:0] wire_d1_0;
	wire [WIDTH-1:0] wire_d1_1;
	wire [WIDTH-1:0] wire_d1_2;
	wire [WIDTH-1:0] wire_d1_3;

	encoder #(.WIDTH(WIDTH)) encoder_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	encoder #(.WIDTH(WIDTH)) encoder_instance101(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance102(.data_in(wire_d0_1),.data_out(wire_d0_2),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance103(.data_in(wire_d0_2),.data_out(wire_d0_3),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance104(.data_in(wire_d0_3),.data_out(d_out0),.clk(clk),.rst(rst));

	encoder #(.WIDTH(WIDTH)) encoder_instance210(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	encoder #(.WIDTH(WIDTH)) encoder_instance211(.data_in(wire_d1_0),.data_out(wire_d1_1),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance212(.data_in(wire_d1_1),.data_out(wire_d1_2),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance213(.data_in(wire_d1_2),.data_out(wire_d1_3),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance214(.data_in(wire_d1_3),.data_out(d_out1),.clk(clk),.rst(rst));


endmodule