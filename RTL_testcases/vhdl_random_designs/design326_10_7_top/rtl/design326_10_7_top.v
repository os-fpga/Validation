// `include "register_vhd.v"
// `include "alu_top_vhd.v"
// `include "decoder_top_vhd.v"
// `include "mux_top_vhd.v"
// `include "shift_reg_top_vhd.v"
// `include "rom_top_vhd.v"

module design326_10_7_top #(parameter WIDTH=32,CHANNEL=10) (clk, rst, in, out);

	localparam OUT_BUS=CHANNEL*WIDTH;
	input clk,rst;
	input [WIDTH-1:0] in;
	output [WIDTH-1:0] out;

	reg [WIDTH-1:0] d_in0;
	reg [WIDTH-1:0] d_in1;
	reg [WIDTH-1:0] d_in2;
	reg [WIDTH-1:0] d_in3;
	reg [WIDTH-1:0] d_in4;
	reg [WIDTH-1:0] d_in5;
	reg [WIDTH-1:0] d_in6;
	reg [WIDTH-1:0] d_in7;
	reg [WIDTH-1:0] d_in8;
	reg [WIDTH-1:0] d_in9;
	wire [WIDTH-1:0] d_out0;
	wire [WIDTH-1:0] d_out1;
	wire [WIDTH-1:0] d_out2;
	wire [WIDTH-1:0] d_out3;
	wire [WIDTH-1:0] d_out4;
	wire [WIDTH-1:0] d_out5;
	wire [WIDTH-1:0] d_out6;
	wire [WIDTH-1:0] d_out7;
	wire [WIDTH-1:0] d_out8;
	wire [WIDTH-1:0] d_out9;

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
		d_in5 <= tmp[(WIDTH*6)-1:WIDTH*5];
		d_in6 <= tmp[(WIDTH*7)-1:WIDTH*6];
		d_in7 <= tmp[(WIDTH*8)-1:WIDTH*7];
		d_in8 <= tmp[(WIDTH*9)-1:WIDTH*8];
		d_in9 <= tmp[(WIDTH*10)-1:WIDTH*9];
	end

	design326_10_7 #(.WIDTH(WIDTH)) design326_10_7_inst(.d_in0(d_in0),.d_in1(d_in1),.d_in2(d_in2),.d_in3(d_in3),.d_in4(d_in4),.d_in5(d_in5),.d_in6(d_in6),.d_in7(d_in7),.d_in8(d_in8),.d_in9(d_in9),.d_out0(d_out0),.d_out1(d_out1),.d_out2(d_out2),.d_out3(d_out3),.d_out4(d_out4),.d_out5(d_out5),.d_out6(d_out6),.d_out7(d_out7),.d_out8(d_out8),.d_out9(d_out9),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1^d_out2^d_out3^d_out4^d_out5^d_out6^d_out7^d_out8^d_out9;

endmodule

module design326_10_7 #(parameter WIDTH=32) (d_in0, d_in1, d_in2, d_in3, d_in4, d_in5, d_in6, d_in7, d_in8, d_in9, d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7, d_out8, d_out9, clk, rst);
	input clk;
	input rst;
	input [WIDTH-1:0] d_in0; 
	input [WIDTH-1:0] d_in1; 
	input [WIDTH-1:0] d_in2; 
	input [WIDTH-1:0] d_in3; 
	input [WIDTH-1:0] d_in4; 
	input [WIDTH-1:0] d_in5; 
	input [WIDTH-1:0] d_in6; 
	input [WIDTH-1:0] d_in7; 
	input [WIDTH-1:0] d_in8; 
	input [WIDTH-1:0] d_in9; 
	output [WIDTH-1:0] d_out0; 
	output [WIDTH-1:0] d_out1; 
	output [WIDTH-1:0] d_out2; 
	output [WIDTH-1:0] d_out3; 
	output [WIDTH-1:0] d_out4; 
	output [WIDTH-1:0] d_out5; 
	output [WIDTH-1:0] d_out6; 
	output [WIDTH-1:0] d_out7; 
	output [WIDTH-1:0] d_out8; 
	output [WIDTH-1:0] d_out9; 

	wire [WIDTH-1:0] wire_d0_0;
	wire [WIDTH-1:0] wire_d0_1;
	wire [WIDTH-1:0] wire_d0_2;
	wire [WIDTH-1:0] wire_d0_3;
	wire [WIDTH-1:0] wire_d0_4;
	wire [WIDTH-1:0] wire_d0_5;
	wire [WIDTH-1:0] wire_d1_0;
	wire [WIDTH-1:0] wire_d1_1;
	wire [WIDTH-1:0] wire_d1_2;
	wire [WIDTH-1:0] wire_d1_3;
	wire [WIDTH-1:0] wire_d1_4;
	wire [WIDTH-1:0] wire_d1_5;
	wire [WIDTH-1:0] wire_d2_0;
	wire [WIDTH-1:0] wire_d2_1;
	wire [WIDTH-1:0] wire_d2_2;
	wire [WIDTH-1:0] wire_d2_3;
	wire [WIDTH-1:0] wire_d2_4;
	wire [WIDTH-1:0] wire_d2_5;
	wire [WIDTH-1:0] wire_d3_0;
	wire [WIDTH-1:0] wire_d3_1;
	wire [WIDTH-1:0] wire_d3_2;
	wire [WIDTH-1:0] wire_d3_3;
	wire [WIDTH-1:0] wire_d3_4;
	wire [WIDTH-1:0] wire_d3_5;
	wire [WIDTH-1:0] wire_d4_0;
	wire [WIDTH-1:0] wire_d4_1;
	wire [WIDTH-1:0] wire_d4_2;
	wire [WIDTH-1:0] wire_d4_3;
	wire [WIDTH-1:0] wire_d4_4;
	wire [WIDTH-1:0] wire_d4_5;
	wire [WIDTH-1:0] wire_d5_0;
	wire [WIDTH-1:0] wire_d5_1;
	wire [WIDTH-1:0] wire_d5_2;
	wire [WIDTH-1:0] wire_d5_3;
	wire [WIDTH-1:0] wire_d5_4;
	wire [WIDTH-1:0] wire_d5_5;
	wire [WIDTH-1:0] wire_d6_0;
	wire [WIDTH-1:0] wire_d6_1;
	wire [WIDTH-1:0] wire_d6_2;
	wire [WIDTH-1:0] wire_d6_3;
	wire [WIDTH-1:0] wire_d6_4;
	wire [WIDTH-1:0] wire_d6_5;
	wire [WIDTH-1:0] wire_d7_0;
	wire [WIDTH-1:0] wire_d7_1;
	wire [WIDTH-1:0] wire_d7_2;
	wire [WIDTH-1:0] wire_d7_3;
	wire [WIDTH-1:0] wire_d7_4;
	wire [WIDTH-1:0] wire_d7_5;
	wire [WIDTH-1:0] wire_d8_0;
	wire [WIDTH-1:0] wire_d8_1;
	wire [WIDTH-1:0] wire_d8_2;
	wire [WIDTH-1:0] wire_d8_3;
	wire [WIDTH-1:0] wire_d8_4;
	wire [WIDTH-1:0] wire_d8_5;
	wire [WIDTH-1:0] wire_d9_0;
	wire [WIDTH-1:0] wire_d9_1;
	wire [WIDTH-1:0] wire_d9_2;
	wire [WIDTH-1:0] wire_d9_3;
	wire [WIDTH-1:0] wire_d9_4;
	wire [WIDTH-1:0] wire_d9_5;

	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance101(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance102(.data_in(wire_d0_1),.data_out(wire_d0_2),.clk(clk),.rst(rst));
	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance103(.data_in(wire_d0_2),.data_out(wire_d0_3),.clk(clk),.rst(rst));
	alu_top_vhd #(.WIDTH(WIDTH)) alu_top_vhd_instance104(.data_in(wire_d0_3),.data_out(wire_d0_4),.clk(clk),.rst(rst));
	mux_top_vhd #(.WIDTH(WIDTH)) mux_top_vhd_instance105(.data_in(wire_d0_4),.data_out(wire_d0_5),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance106(.data_in(wire_d0_5),.data_out(d_out0),.clk(clk),.rst(rst));

	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance210(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance211(.data_in(wire_d1_0),.data_out(wire_d1_1),.clk(clk),.rst(rst));
	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance212(.data_in(wire_d1_1),.data_out(wire_d1_2),.clk(clk),.rst(rst));
	alu_top_vhd #(.WIDTH(WIDTH)) alu_top_vhd_instance213(.data_in(wire_d1_2),.data_out(wire_d1_3),.clk(clk),.rst(rst));
	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance214(.data_in(wire_d1_3),.data_out(wire_d1_4),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance215(.data_in(wire_d1_4),.data_out(wire_d1_5),.clk(clk),.rst(rst));
	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance216(.data_in(wire_d1_5),.data_out(d_out1),.clk(clk),.rst(rst));

	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance320(.data_in(d_in2),.data_out(wire_d2_0),.clk(clk),.rst(rst));            //channel 3
	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance321(.data_in(wire_d2_0),.data_out(wire_d2_1),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance322(.data_in(wire_d2_1),.data_out(wire_d2_2),.clk(clk),.rst(rst));
	alu_top_vhd #(.WIDTH(WIDTH)) alu_top_vhd_instance323(.data_in(wire_d2_2),.data_out(wire_d2_3),.clk(clk),.rst(rst));
	alu_top_vhd #(.WIDTH(WIDTH)) alu_top_vhd_instance324(.data_in(wire_d2_3),.data_out(wire_d2_4),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance325(.data_in(wire_d2_4),.data_out(wire_d2_5),.clk(clk),.rst(rst));
	mux_top_vhd #(.WIDTH(WIDTH)) mux_top_vhd_instance326(.data_in(wire_d2_5),.data_out(d_out2),.clk(clk),.rst(rst));

	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance430(.data_in(d_in3),.data_out(wire_d3_0),.clk(clk),.rst(rst));            //channel 4
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance431(.data_in(wire_d3_0),.data_out(wire_d3_1),.clk(clk),.rst(rst));
	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance432(.data_in(wire_d3_1),.data_out(wire_d3_2),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance433(.data_in(wire_d3_2),.data_out(wire_d3_3),.clk(clk),.rst(rst));
	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance434(.data_in(wire_d3_3),.data_out(wire_d3_4),.clk(clk),.rst(rst));
	mux_top_vhd #(.WIDTH(WIDTH)) mux_top_vhd_instance435(.data_in(wire_d3_4),.data_out(wire_d3_5),.clk(clk),.rst(rst));
	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance436(.data_in(wire_d3_5),.data_out(d_out3),.clk(clk),.rst(rst));

	mux_top_vhd #(.WIDTH(WIDTH)) mux_top_vhd_instance540(.data_in(d_in4),.data_out(wire_d4_0),.clk(clk),.rst(rst));            //channel 5
	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance541(.data_in(wire_d4_0),.data_out(wire_d4_1),.clk(clk),.rst(rst));
	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance542(.data_in(wire_d4_1),.data_out(wire_d4_2),.clk(clk),.rst(rst));
	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance543(.data_in(wire_d4_2),.data_out(wire_d4_3),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance544(.data_in(wire_d4_3),.data_out(wire_d4_4),.clk(clk),.rst(rst));
	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance545(.data_in(wire_d4_4),.data_out(wire_d4_5),.clk(clk),.rst(rst));
	mux_top_vhd #(.WIDTH(WIDTH)) mux_top_vhd_instance546(.data_in(wire_d4_5),.data_out(d_out4),.clk(clk),.rst(rst));

	mux_top_vhd #(.WIDTH(WIDTH)) mux_top_vhd_instance650(.data_in(d_in5),.data_out(wire_d5_0),.clk(clk),.rst(rst));            //channel 6
	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance651(.data_in(wire_d5_0),.data_out(wire_d5_1),.clk(clk),.rst(rst));
	mux_top_vhd #(.WIDTH(WIDTH)) mux_top_vhd_instance652(.data_in(wire_d5_1),.data_out(wire_d5_2),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance653(.data_in(wire_d5_2),.data_out(wire_d5_3),.clk(clk),.rst(rst));
	alu_top_vhd #(.WIDTH(WIDTH)) alu_top_vhd_instance654(.data_in(wire_d5_3),.data_out(wire_d5_4),.clk(clk),.rst(rst));
	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance655(.data_in(wire_d5_4),.data_out(wire_d5_5),.clk(clk),.rst(rst));
	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance656(.data_in(wire_d5_5),.data_out(d_out5),.clk(clk),.rst(rst));

	alu_top_vhd #(.WIDTH(WIDTH)) alu_top_vhd_instance760(.data_in(d_in6),.data_out(wire_d6_0),.clk(clk),.rst(rst));            //channel 7
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance761(.data_in(wire_d6_0),.data_out(wire_d6_1),.clk(clk),.rst(rst));
	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance762(.data_in(wire_d6_1),.data_out(wire_d6_2),.clk(clk),.rst(rst));
	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance763(.data_in(wire_d6_2),.data_out(wire_d6_3),.clk(clk),.rst(rst));
	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance764(.data_in(wire_d6_3),.data_out(wire_d6_4),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance765(.data_in(wire_d6_4),.data_out(wire_d6_5),.clk(clk),.rst(rst));
	mux_top_vhd #(.WIDTH(WIDTH)) mux_top_vhd_instance766(.data_in(wire_d6_5),.data_out(d_out6),.clk(clk),.rst(rst));

	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance870(.data_in(d_in7),.data_out(wire_d7_0),.clk(clk),.rst(rst));            //channel 8
	mux_top_vhd #(.WIDTH(WIDTH)) mux_top_vhd_instance871(.data_in(wire_d7_0),.data_out(wire_d7_1),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance872(.data_in(wire_d7_1),.data_out(wire_d7_2),.clk(clk),.rst(rst));
	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance873(.data_in(wire_d7_2),.data_out(wire_d7_3),.clk(clk),.rst(rst));
	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance874(.data_in(wire_d7_3),.data_out(wire_d7_4),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance875(.data_in(wire_d7_4),.data_out(wire_d7_5),.clk(clk),.rst(rst));
	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance876(.data_in(wire_d7_5),.data_out(d_out7),.clk(clk),.rst(rst));

	mux_top_vhd #(.WIDTH(WIDTH)) mux_top_vhd_instance980(.data_in(d_in8),.data_out(wire_d8_0),.clk(clk),.rst(rst));            //channel 9
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance981(.data_in(wire_d8_0),.data_out(wire_d8_1),.clk(clk),.rst(rst));
	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance982(.data_in(wire_d8_1),.data_out(wire_d8_2),.clk(clk),.rst(rst));
	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance983(.data_in(wire_d8_2),.data_out(wire_d8_3),.clk(clk),.rst(rst));
	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance984(.data_in(wire_d8_3),.data_out(wire_d8_4),.clk(clk),.rst(rst));
	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance985(.data_in(wire_d8_4),.data_out(wire_d8_5),.clk(clk),.rst(rst));
	alu_top_vhd #(.WIDTH(WIDTH)) alu_top_vhd_instance986(.data_in(wire_d8_5),.data_out(d_out8),.clk(clk),.rst(rst));

	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance10090(.data_in(d_in9),.data_out(wire_d9_0),.clk(clk),.rst(rst));            //channel 10
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance10091(.data_in(wire_d9_0),.data_out(wire_d9_1),.clk(clk),.rst(rst));
	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance10092(.data_in(wire_d9_1),.data_out(wire_d9_2),.clk(clk),.rst(rst));
	alu_top_vhd #(.WIDTH(WIDTH)) alu_top_vhd_instance10093(.data_in(wire_d9_2),.data_out(wire_d9_3),.clk(clk),.rst(rst));
	decoder_top_vhd #(.WIDTH(WIDTH)) decoder_top_vhd_instance10094(.data_in(wire_d9_3),.data_out(wire_d9_4),.clk(clk),.rst(rst));
	rom_top_vhd #(.WIDTH(WIDTH)) rom_top_vhd_instance10095(.data_in(wire_d9_4),.data_out(wire_d9_5),.clk(clk),.rst(rst));
	shift_reg_top_vhd #(.WIDTH(WIDTH)) shift_reg_top_vhd_instance10096(.data_in(wire_d9_5),.data_out(d_out9),.clk(clk),.rst(rst));


endmodule