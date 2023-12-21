// `include "large_mux.v"

module design62_2_2_top #(parameter WIDTH=32,CHANNEL=2) (clk, rst, in, out);

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

	design62_2_2 #(.WIDTH(WIDTH)) design62_2_2_inst(.d_in0(d_in0),.d_in1(d_in1),.d_out0(d_out0),.d_out1(d_out1),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1;

endmodule

module design62_2_2 #(parameter WIDTH=32) (d_in0, d_in1, d_out0, d_out1, clk, rst);
	input clk;
	input rst;
	input [WIDTH-1:0] d_in0; 
	input [WIDTH-1:0] d_in1; 
	output [WIDTH-1:0] d_out0; 
	output [WIDTH-1:0] d_out1; 

	wire [WIDTH-1:0] wire_d0_0;
	wire [WIDTH-1:0] wire_d1_0;

	large_mux #(.WIDTH(WIDTH)) large_mux_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	large_mux #(.WIDTH(WIDTH)) large_mux_instance101(.data_in(wire_d0_0),.data_out(d_out0),.clk(clk),.rst(rst));

	large_mux #(.WIDTH(WIDTH)) large_mux_instance210(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	large_mux #(.WIDTH(WIDTH)) large_mux_instance211(.data_in(wire_d1_0),.data_out(d_out1),.clk(clk),.rst(rst));


endmodule