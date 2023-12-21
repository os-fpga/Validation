// `include "d_latch.v"
// `include "shift_reg.v"
// `include "mod_n_counter.v"
// `include "decoder.v"
// `include "parity_generator.v"

module design138_5_3_top #(parameter WIDTH=32,CHANNEL=5) (clk, rst, in, out);

	localparam OUT_BUS=CHANNEL*WIDTH;
	input clk,rst;
	input [WIDTH-1:0] in;
	output [WIDTH-1:0] out;

	reg [WIDTH-1:0] d_in0;
	reg [WIDTH-1:0] d_in1;
	reg [WIDTH-1:0] d_in2;
	reg [WIDTH-1:0] d_in3;
	reg [WIDTH-1:0] d_in4;
	wire [WIDTH-1:0] d_out0;
	wire [WIDTH-1:0] d_out1;
	wire [WIDTH-1:0] d_out2;
	wire [WIDTH-1:0] d_out3;
	wire [WIDTH-1:0] d_out4;

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
		d_in2 <= tmp[(WIDTH*3)-1:WIDTH*2];
		d_in3 <= tmp[(WIDTH*4)-1:WIDTH*3];
		d_in4 <= tmp[(WIDTH*5)-1:WIDTH*4];
	end

	design138_5_3 #(.WIDTH(WIDTH)) design138_5_3_inst(.d_in0(d_in0),.d_in1(d_in1),.d_in2(d_in2),.d_in3(d_in3),.d_in4(d_in4),.d_out0(d_out0),.d_out1(d_out1),.d_out2(d_out2),.d_out3(d_out3),.d_out4(d_out4),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1^d_out2^d_out3^d_out4;

endmodule

module design138_5_3 #(parameter WIDTH=32) (d_in0, d_in1, d_in2, d_in3, d_in4, d_out0, d_out1, d_out2, d_out3, d_out4, clk, rst);
	input clk;
	input rst;
	input [WIDTH-1:0] d_in0; 
	input [WIDTH-1:0] d_in1; 
	input [WIDTH-1:0] d_in2; 
	input [WIDTH-1:0] d_in3; 
	input [WIDTH-1:0] d_in4; 
	output [WIDTH-1:0] d_out0; 
	output [WIDTH-1:0] d_out1; 
	output [WIDTH-1:0] d_out2; 
	output [WIDTH-1:0] d_out3; 
	output [WIDTH-1:0] d_out4; 

	wire [WIDTH-1:0] wire_d0_0;
	wire [WIDTH-1:0] wire_d0_1;
	wire [WIDTH-1:0] wire_d1_0;
	wire [WIDTH-1:0] wire_d1_1;
	wire [WIDTH-1:0] wire_d2_0;
	wire [WIDTH-1:0] wire_d2_1;
	wire [WIDTH-1:0] wire_d3_0;
	wire [WIDTH-1:0] wire_d3_1;
	wire [WIDTH-1:0] wire_d4_0;
	wire [WIDTH-1:0] wire_d4_1;

	decoder_top #(.WIDTH(WIDTH)) decoder_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	paritygenerator_top #(.WIDTH(WIDTH)) parity_generator_instance101(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	d_latch_top #(.WIDTH(WIDTH)) d_latch_instance102(.data_in(wire_d0_1),.data_out(d_out0),.clk(clk),.rst(rst));

	shift_reg_top #(.WIDTH(WIDTH)) shift_reg_instance210(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	decoder_top #(.WIDTH(WIDTH)) decoder_instance211(.data_in(wire_d1_0),.data_out(wire_d1_1),.clk(clk),.rst(rst));
	paritygenerator_top #(.WIDTH(WIDTH)) parity_generator_instance212(.data_in(wire_d1_1),.data_out(d_out1),.clk(clk),.rst(rst));

	mod_n_counter #(.WIDTH(WIDTH)) mod_n_counter_instance320(.data_in(d_in2),.data_out(wire_d2_0),.clk(clk),.rst(rst));            //channel 3
	decoder_top #(.WIDTH(WIDTH)) decoder_instance321(.data_in(wire_d2_0),.data_out(wire_d2_1),.clk(clk),.rst(rst));
	d_latch_top #(.WIDTH(WIDTH)) d_latch_instance322(.data_in(wire_d2_1),.data_out(d_out2),.clk(clk),.rst(rst));

	shift_reg_top #(.WIDTH(WIDTH)) shift_reg_instance430(.data_in(d_in3),.data_out(wire_d3_0),.clk(clk),.rst(rst));            //channel 4
	d_latch_top #(.WIDTH(WIDTH)) d_latch_instance431(.data_in(wire_d3_0),.data_out(wire_d3_1),.clk(clk),.rst(rst));
	paritygenerator_top #(.WIDTH(WIDTH)) parity_generator_instance432(.data_in(wire_d3_1),.data_out(d_out3),.clk(clk),.rst(rst));

	paritygenerator_top #(.WIDTH(WIDTH)) parity_generator_instance540(.data_in(d_in4),.data_out(wire_d4_0),.clk(clk),.rst(rst));            //channel 5
	d_latch_top #(.WIDTH(WIDTH)) d_latch_instance541(.data_in(wire_d4_0),.data_out(wire_d4_1),.clk(clk),.rst(rst));
	mod_n_counter #(.WIDTH(WIDTH)) mod_n_counter_instance542(.data_in(wire_d4_1),.data_out(d_out4),.clk(clk),.rst(rst));


endmodule