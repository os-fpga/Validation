// `include "encoder.v"
// `include "register.v"
// `include "memory_cntrl.v"
// `include "full_adder.v"
// `include "large_mux.v"

module design124_20_12_top #(parameter WIDTH=32,CHANNEL=20) (clk, rst, in, out);

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
	reg [WIDTH-1:0] d_in10;
	reg [WIDTH-1:0] d_in11;
	reg [WIDTH-1:0] d_in12;
	reg [WIDTH-1:0] d_in13;
	reg [WIDTH-1:0] d_in14;
	reg [WIDTH-1:0] d_in15;
	reg [WIDTH-1:0] d_in16;
	reg [WIDTH-1:0] d_in17;
	reg [WIDTH-1:0] d_in18;
	reg [WIDTH-1:0] d_in19;
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
	wire [WIDTH-1:0] d_out10;
	wire [WIDTH-1:0] d_out11;
	wire [WIDTH-1:0] d_out12;
	wire [WIDTH-1:0] d_out13;
	wire [WIDTH-1:0] d_out14;
	wire [WIDTH-1:0] d_out15;
	wire [WIDTH-1:0] d_out16;
	wire [WIDTH-1:0] d_out17;
	wire [WIDTH-1:0] d_out18;
	wire [WIDTH-1:0] d_out19;

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
		d_in10 <= tmp[(WIDTH*11)-1:WIDTH*10];
		d_in11 <= tmp[(WIDTH*12)-1:WIDTH*11];
		d_in12 <= tmp[(WIDTH*13)-1:WIDTH*12];
		d_in13 <= tmp[(WIDTH*14)-1:WIDTH*13];
		d_in14 <= tmp[(WIDTH*15)-1:WIDTH*14];
		d_in15 <= tmp[(WIDTH*16)-1:WIDTH*15];
		d_in16 <= tmp[(WIDTH*17)-1:WIDTH*16];
		d_in17 <= tmp[(WIDTH*18)-1:WIDTH*17];
		d_in18 <= tmp[(WIDTH*19)-1:WIDTH*18];
		d_in19 <= tmp[(WIDTH*20)-1:WIDTH*19];
	end

	design124_20_12 #(.WIDTH(WIDTH)) design124_20_12_inst(.d_in0(d_in0),.d_in1(d_in1),.d_in2(d_in2),.d_in3(d_in3),.d_in4(d_in4),.d_in5(d_in5),.d_in6(d_in6),.d_in7(d_in7),.d_in8(d_in8),.d_in9(d_in9),.d_in10(d_in10),.d_in11(d_in11),.d_in12(d_in12),.d_in13(d_in13),.d_in14(d_in14),.d_in15(d_in15),.d_in16(d_in16),.d_in17(d_in17),.d_in18(d_in18),.d_in19(d_in19),.d_out0(d_out0),.d_out1(d_out1),.d_out2(d_out2),.d_out3(d_out3),.d_out4(d_out4),.d_out5(d_out5),.d_out6(d_out6),.d_out7(d_out7),.d_out8(d_out8),.d_out9(d_out9),.d_out10(d_out10),.d_out11(d_out11),.d_out12(d_out12),.d_out13(d_out13),.d_out14(d_out14),.d_out15(d_out15),.d_out16(d_out16),.d_out17(d_out17),.d_out18(d_out18),.d_out19(d_out19),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1^d_out2^d_out3^d_out4^d_out5^d_out6^d_out7^d_out8^d_out9^d_out10^d_out11^d_out12^d_out13^d_out14^d_out15^d_out16^d_out17^d_out18^d_out19;

endmodule

module design124_20_12 #(parameter WIDTH=32) (d_in0, d_in1, d_in2, d_in3, d_in4, d_in5, d_in6, d_in7, d_in8, d_in9, d_in10, d_in11, d_in12, d_in13, d_in14, d_in15, d_in16, d_in17, d_in18, d_in19, d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7, d_out8, d_out9, d_out10, d_out11, d_out12, d_out13, d_out14, d_out15, d_out16, d_out17, d_out18, d_out19, clk, rst);
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
	input [WIDTH-1:0] d_in10; 
	input [WIDTH-1:0] d_in11; 
	input [WIDTH-1:0] d_in12; 
	input [WIDTH-1:0] d_in13; 
	input [WIDTH-1:0] d_in14; 
	input [WIDTH-1:0] d_in15; 
	input [WIDTH-1:0] d_in16; 
	input [WIDTH-1:0] d_in17; 
	input [WIDTH-1:0] d_in18; 
	input [WIDTH-1:0] d_in19; 
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
	output [WIDTH-1:0] d_out10; 
	output [WIDTH-1:0] d_out11; 
	output [WIDTH-1:0] d_out12; 
	output [WIDTH-1:0] d_out13; 
	output [WIDTH-1:0] d_out14; 
	output [WIDTH-1:0] d_out15; 
	output [WIDTH-1:0] d_out16; 
	output [WIDTH-1:0] d_out17; 
	output [WIDTH-1:0] d_out18; 
	output [WIDTH-1:0] d_out19; 

	wire [WIDTH-1:0] wire_d0_0;
	wire [WIDTH-1:0] wire_d0_1;
	wire [WIDTH-1:0] wire_d0_2;
	wire [WIDTH-1:0] wire_d0_3;
	wire [WIDTH-1:0] wire_d0_4;
	wire [WIDTH-1:0] wire_d0_5;
	wire [WIDTH-1:0] wire_d0_6;
	wire [WIDTH-1:0] wire_d0_7;
	wire [WIDTH-1:0] wire_d0_8;
	wire [WIDTH-1:0] wire_d0_9;
	wire [WIDTH-1:0] wire_d0_10;
	wire [WIDTH-1:0] wire_d1_0;
	wire [WIDTH-1:0] wire_d1_1;
	wire [WIDTH-1:0] wire_d1_2;
	wire [WIDTH-1:0] wire_d1_3;
	wire [WIDTH-1:0] wire_d1_4;
	wire [WIDTH-1:0] wire_d1_5;
	wire [WIDTH-1:0] wire_d1_6;
	wire [WIDTH-1:0] wire_d1_7;
	wire [WIDTH-1:0] wire_d1_8;
	wire [WIDTH-1:0] wire_d1_9;
	wire [WIDTH-1:0] wire_d1_10;
	wire [WIDTH-1:0] wire_d2_0;
	wire [WIDTH-1:0] wire_d2_1;
	wire [WIDTH-1:0] wire_d2_2;
	wire [WIDTH-1:0] wire_d2_3;
	wire [WIDTH-1:0] wire_d2_4;
	wire [WIDTH-1:0] wire_d2_5;
	wire [WIDTH-1:0] wire_d2_6;
	wire [WIDTH-1:0] wire_d2_7;
	wire [WIDTH-1:0] wire_d2_8;
	wire [WIDTH-1:0] wire_d2_9;
	wire [WIDTH-1:0] wire_d2_10;
	wire [WIDTH-1:0] wire_d3_0;
	wire [WIDTH-1:0] wire_d3_1;
	wire [WIDTH-1:0] wire_d3_2;
	wire [WIDTH-1:0] wire_d3_3;
	wire [WIDTH-1:0] wire_d3_4;
	wire [WIDTH-1:0] wire_d3_5;
	wire [WIDTH-1:0] wire_d3_6;
	wire [WIDTH-1:0] wire_d3_7;
	wire [WIDTH-1:0] wire_d3_8;
	wire [WIDTH-1:0] wire_d3_9;
	wire [WIDTH-1:0] wire_d3_10;
	wire [WIDTH-1:0] wire_d4_0;
	wire [WIDTH-1:0] wire_d4_1;
	wire [WIDTH-1:0] wire_d4_2;
	wire [WIDTH-1:0] wire_d4_3;
	wire [WIDTH-1:0] wire_d4_4;
	wire [WIDTH-1:0] wire_d4_5;
	wire [WIDTH-1:0] wire_d4_6;
	wire [WIDTH-1:0] wire_d4_7;
	wire [WIDTH-1:0] wire_d4_8;
	wire [WIDTH-1:0] wire_d4_9;
	wire [WIDTH-1:0] wire_d4_10;
	wire [WIDTH-1:0] wire_d5_0;
	wire [WIDTH-1:0] wire_d5_1;
	wire [WIDTH-1:0] wire_d5_2;
	wire [WIDTH-1:0] wire_d5_3;
	wire [WIDTH-1:0] wire_d5_4;
	wire [WIDTH-1:0] wire_d5_5;
	wire [WIDTH-1:0] wire_d5_6;
	wire [WIDTH-1:0] wire_d5_7;
	wire [WIDTH-1:0] wire_d5_8;
	wire [WIDTH-1:0] wire_d5_9;
	wire [WIDTH-1:0] wire_d5_10;
	wire [WIDTH-1:0] wire_d6_0;
	wire [WIDTH-1:0] wire_d6_1;
	wire [WIDTH-1:0] wire_d6_2;
	wire [WIDTH-1:0] wire_d6_3;
	wire [WIDTH-1:0] wire_d6_4;
	wire [WIDTH-1:0] wire_d6_5;
	wire [WIDTH-1:0] wire_d6_6;
	wire [WIDTH-1:0] wire_d6_7;
	wire [WIDTH-1:0] wire_d6_8;
	wire [WIDTH-1:0] wire_d6_9;
	wire [WIDTH-1:0] wire_d6_10;
	wire [WIDTH-1:0] wire_d7_0;
	wire [WIDTH-1:0] wire_d7_1;
	wire [WIDTH-1:0] wire_d7_2;
	wire [WIDTH-1:0] wire_d7_3;
	wire [WIDTH-1:0] wire_d7_4;
	wire [WIDTH-1:0] wire_d7_5;
	wire [WIDTH-1:0] wire_d7_6;
	wire [WIDTH-1:0] wire_d7_7;
	wire [WIDTH-1:0] wire_d7_8;
	wire [WIDTH-1:0] wire_d7_9;
	wire [WIDTH-1:0] wire_d7_10;
	wire [WIDTH-1:0] wire_d8_0;
	wire [WIDTH-1:0] wire_d8_1;
	wire [WIDTH-1:0] wire_d8_2;
	wire [WIDTH-1:0] wire_d8_3;
	wire [WIDTH-1:0] wire_d8_4;
	wire [WIDTH-1:0] wire_d8_5;
	wire [WIDTH-1:0] wire_d8_6;
	wire [WIDTH-1:0] wire_d8_7;
	wire [WIDTH-1:0] wire_d8_8;
	wire [WIDTH-1:0] wire_d8_9;
	wire [WIDTH-1:0] wire_d8_10;
	wire [WIDTH-1:0] wire_d9_0;
	wire [WIDTH-1:0] wire_d9_1;
	wire [WIDTH-1:0] wire_d9_2;
	wire [WIDTH-1:0] wire_d9_3;
	wire [WIDTH-1:0] wire_d9_4;
	wire [WIDTH-1:0] wire_d9_5;
	wire [WIDTH-1:0] wire_d9_6;
	wire [WIDTH-1:0] wire_d9_7;
	wire [WIDTH-1:0] wire_d9_8;
	wire [WIDTH-1:0] wire_d9_9;
	wire [WIDTH-1:0] wire_d9_10;
	wire [WIDTH-1:0] wire_d10_0;
	wire [WIDTH-1:0] wire_d10_1;
	wire [WIDTH-1:0] wire_d10_2;
	wire [WIDTH-1:0] wire_d10_3;
	wire [WIDTH-1:0] wire_d10_4;
	wire [WIDTH-1:0] wire_d10_5;
	wire [WIDTH-1:0] wire_d10_6;
	wire [WIDTH-1:0] wire_d10_7;
	wire [WIDTH-1:0] wire_d10_8;
	wire [WIDTH-1:0] wire_d10_9;
	wire [WIDTH-1:0] wire_d10_10;
	wire [WIDTH-1:0] wire_d11_0;
	wire [WIDTH-1:0] wire_d11_1;
	wire [WIDTH-1:0] wire_d11_2;
	wire [WIDTH-1:0] wire_d11_3;
	wire [WIDTH-1:0] wire_d11_4;
	wire [WIDTH-1:0] wire_d11_5;
	wire [WIDTH-1:0] wire_d11_6;
	wire [WIDTH-1:0] wire_d11_7;
	wire [WIDTH-1:0] wire_d11_8;
	wire [WIDTH-1:0] wire_d11_9;
	wire [WIDTH-1:0] wire_d11_10;
	wire [WIDTH-1:0] wire_d12_0;
	wire [WIDTH-1:0] wire_d12_1;
	wire [WIDTH-1:0] wire_d12_2;
	wire [WIDTH-1:0] wire_d12_3;
	wire [WIDTH-1:0] wire_d12_4;
	wire [WIDTH-1:0] wire_d12_5;
	wire [WIDTH-1:0] wire_d12_6;
	wire [WIDTH-1:0] wire_d12_7;
	wire [WIDTH-1:0] wire_d12_8;
	wire [WIDTH-1:0] wire_d12_9;
	wire [WIDTH-1:0] wire_d12_10;
	wire [WIDTH-1:0] wire_d13_0;
	wire [WIDTH-1:0] wire_d13_1;
	wire [WIDTH-1:0] wire_d13_2;
	wire [WIDTH-1:0] wire_d13_3;
	wire [WIDTH-1:0] wire_d13_4;
	wire [WIDTH-1:0] wire_d13_5;
	wire [WIDTH-1:0] wire_d13_6;
	wire [WIDTH-1:0] wire_d13_7;
	wire [WIDTH-1:0] wire_d13_8;
	wire [WIDTH-1:0] wire_d13_9;
	wire [WIDTH-1:0] wire_d13_10;
	wire [WIDTH-1:0] wire_d14_0;
	wire [WIDTH-1:0] wire_d14_1;
	wire [WIDTH-1:0] wire_d14_2;
	wire [WIDTH-1:0] wire_d14_3;
	wire [WIDTH-1:0] wire_d14_4;
	wire [WIDTH-1:0] wire_d14_5;
	wire [WIDTH-1:0] wire_d14_6;
	wire [WIDTH-1:0] wire_d14_7;
	wire [WIDTH-1:0] wire_d14_8;
	wire [WIDTH-1:0] wire_d14_9;
	wire [WIDTH-1:0] wire_d14_10;
	wire [WIDTH-1:0] wire_d15_0;
	wire [WIDTH-1:0] wire_d15_1;
	wire [WIDTH-1:0] wire_d15_2;
	wire [WIDTH-1:0] wire_d15_3;
	wire [WIDTH-1:0] wire_d15_4;
	wire [WIDTH-1:0] wire_d15_5;
	wire [WIDTH-1:0] wire_d15_6;
	wire [WIDTH-1:0] wire_d15_7;
	wire [WIDTH-1:0] wire_d15_8;
	wire [WIDTH-1:0] wire_d15_9;
	wire [WIDTH-1:0] wire_d15_10;
	wire [WIDTH-1:0] wire_d16_0;
	wire [WIDTH-1:0] wire_d16_1;
	wire [WIDTH-1:0] wire_d16_2;
	wire [WIDTH-1:0] wire_d16_3;
	wire [WIDTH-1:0] wire_d16_4;
	wire [WIDTH-1:0] wire_d16_5;
	wire [WIDTH-1:0] wire_d16_6;
	wire [WIDTH-1:0] wire_d16_7;
	wire [WIDTH-1:0] wire_d16_8;
	wire [WIDTH-1:0] wire_d16_9;
	wire [WIDTH-1:0] wire_d16_10;
	wire [WIDTH-1:0] wire_d17_0;
	wire [WIDTH-1:0] wire_d17_1;
	wire [WIDTH-1:0] wire_d17_2;
	wire [WIDTH-1:0] wire_d17_3;
	wire [WIDTH-1:0] wire_d17_4;
	wire [WIDTH-1:0] wire_d17_5;
	wire [WIDTH-1:0] wire_d17_6;
	wire [WIDTH-1:0] wire_d17_7;
	wire [WIDTH-1:0] wire_d17_8;
	wire [WIDTH-1:0] wire_d17_9;
	wire [WIDTH-1:0] wire_d17_10;
	wire [WIDTH-1:0] wire_d18_0;
	wire [WIDTH-1:0] wire_d18_1;
	wire [WIDTH-1:0] wire_d18_2;
	wire [WIDTH-1:0] wire_d18_3;
	wire [WIDTH-1:0] wire_d18_4;
	wire [WIDTH-1:0] wire_d18_5;
	wire [WIDTH-1:0] wire_d18_6;
	wire [WIDTH-1:0] wire_d18_7;
	wire [WIDTH-1:0] wire_d18_8;
	wire [WIDTH-1:0] wire_d18_9;
	wire [WIDTH-1:0] wire_d18_10;
	wire [WIDTH-1:0] wire_d19_0;
	wire [WIDTH-1:0] wire_d19_1;
	wire [WIDTH-1:0] wire_d19_2;
	wire [WIDTH-1:0] wire_d19_3;
	wire [WIDTH-1:0] wire_d19_4;
	wire [WIDTH-1:0] wire_d19_5;
	wire [WIDTH-1:0] wire_d19_6;
	wire [WIDTH-1:0] wire_d19_7;
	wire [WIDTH-1:0] wire_d19_8;
	wire [WIDTH-1:0] wire_d19_9;
	wire [WIDTH-1:0] wire_d19_10;

	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance101(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance102(.data_in(wire_d0_1),.data_out(wire_d0_2),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance103(.data_in(wire_d0_2),.data_out(wire_d0_3),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance104(.data_in(wire_d0_3),.data_out(wire_d0_4),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance105(.data_in(wire_d0_4),.data_out(wire_d0_5),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance106(.data_in(wire_d0_5),.data_out(wire_d0_6),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance107(.data_in(wire_d0_6),.data_out(wire_d0_7),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance108(.data_in(wire_d0_7),.data_out(wire_d0_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance109(.data_in(wire_d0_8),.data_out(wire_d0_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1010(.data_in(wire_d0_9),.data_out(wire_d0_10),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance1011(.data_in(wire_d0_10),.data_out(d_out0),.clk(clk),.rst(rst));

	large_mux #(.WIDTH(WIDTH)) large_mux_instance210(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	large_mux #(.WIDTH(WIDTH)) large_mux_instance211(.data_in(wire_d1_0),.data_out(wire_d1_1),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance212(.data_in(wire_d1_1),.data_out(wire_d1_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance213(.data_in(wire_d1_2),.data_out(wire_d1_3),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance214(.data_in(wire_d1_3),.data_out(wire_d1_4),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance215(.data_in(wire_d1_4),.data_out(wire_d1_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance216(.data_in(wire_d1_5),.data_out(wire_d1_6),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance217(.data_in(wire_d1_6),.data_out(wire_d1_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance218(.data_in(wire_d1_7),.data_out(wire_d1_8),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance219(.data_in(wire_d1_8),.data_out(wire_d1_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance2110(.data_in(wire_d1_9),.data_out(wire_d1_10),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance2111(.data_in(wire_d1_10),.data_out(d_out1),.clk(clk),.rst(rst));

	large_mux #(.WIDTH(WIDTH)) large_mux_instance320(.data_in(d_in2),.data_out(wire_d2_0),.clk(clk),.rst(rst));            //channel 3
	large_mux #(.WIDTH(WIDTH)) large_mux_instance321(.data_in(wire_d2_0),.data_out(wire_d2_1),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance322(.data_in(wire_d2_1),.data_out(wire_d2_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance323(.data_in(wire_d2_2),.data_out(wire_d2_3),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance324(.data_in(wire_d2_3),.data_out(wire_d2_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance325(.data_in(wire_d2_4),.data_out(wire_d2_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance326(.data_in(wire_d2_5),.data_out(wire_d2_6),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance327(.data_in(wire_d2_6),.data_out(wire_d2_7),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance328(.data_in(wire_d2_7),.data_out(wire_d2_8),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance329(.data_in(wire_d2_8),.data_out(wire_d2_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance3210(.data_in(wire_d2_9),.data_out(wire_d2_10),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance3211(.data_in(wire_d2_10),.data_out(d_out2),.clk(clk),.rst(rst));

	encoder #(.WIDTH(WIDTH)) encoder_instance430(.data_in(d_in3),.data_out(wire_d3_0),.clk(clk),.rst(rst));            //channel 4
	encoder #(.WIDTH(WIDTH)) encoder_instance431(.data_in(wire_d3_0),.data_out(wire_d3_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance432(.data_in(wire_d3_1),.data_out(wire_d3_2),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance433(.data_in(wire_d3_2),.data_out(wire_d3_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance434(.data_in(wire_d3_3),.data_out(wire_d3_4),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance435(.data_in(wire_d3_4),.data_out(wire_d3_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance436(.data_in(wire_d3_5),.data_out(wire_d3_6),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance437(.data_in(wire_d3_6),.data_out(wire_d3_7),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance438(.data_in(wire_d3_7),.data_out(wire_d3_8),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance439(.data_in(wire_d3_8),.data_out(wire_d3_9),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance4310(.data_in(wire_d3_9),.data_out(wire_d3_10),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4311(.data_in(wire_d3_10),.data_out(d_out3),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance540(.data_in(d_in4),.data_out(wire_d4_0),.clk(clk),.rst(rst));            //channel 5
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance541(.data_in(wire_d4_0),.data_out(wire_d4_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance542(.data_in(wire_d4_1),.data_out(wire_d4_2),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance543(.data_in(wire_d4_2),.data_out(wire_d4_3),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance544(.data_in(wire_d4_3),.data_out(wire_d4_4),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance545(.data_in(wire_d4_4),.data_out(wire_d4_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance546(.data_in(wire_d4_5),.data_out(wire_d4_6),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance547(.data_in(wire_d4_6),.data_out(wire_d4_7),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance548(.data_in(wire_d4_7),.data_out(wire_d4_8),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance549(.data_in(wire_d4_8),.data_out(wire_d4_9),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance5410(.data_in(wire_d4_9),.data_out(wire_d4_10),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance5411(.data_in(wire_d4_10),.data_out(d_out4),.clk(clk),.rst(rst));

	large_mux #(.WIDTH(WIDTH)) large_mux_instance650(.data_in(d_in5),.data_out(wire_d5_0),.clk(clk),.rst(rst));            //channel 6
	encoder #(.WIDTH(WIDTH)) encoder_instance651(.data_in(wire_d5_0),.data_out(wire_d5_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance652(.data_in(wire_d5_1),.data_out(wire_d5_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance653(.data_in(wire_d5_2),.data_out(wire_d5_3),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance654(.data_in(wire_d5_3),.data_out(wire_d5_4),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance655(.data_in(wire_d5_4),.data_out(wire_d5_5),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance656(.data_in(wire_d5_5),.data_out(wire_d5_6),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance657(.data_in(wire_d5_6),.data_out(wire_d5_7),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance658(.data_in(wire_d5_7),.data_out(wire_d5_8),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance659(.data_in(wire_d5_8),.data_out(wire_d5_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance6510(.data_in(wire_d5_9),.data_out(wire_d5_10),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance6511(.data_in(wire_d5_10),.data_out(d_out5),.clk(clk),.rst(rst));

	large_mux #(.WIDTH(WIDTH)) large_mux_instance760(.data_in(d_in6),.data_out(wire_d6_0),.clk(clk),.rst(rst));            //channel 7
	large_mux #(.WIDTH(WIDTH)) large_mux_instance761(.data_in(wire_d6_0),.data_out(wire_d6_1),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance762(.data_in(wire_d6_1),.data_out(wire_d6_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance763(.data_in(wire_d6_2),.data_out(wire_d6_3),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance764(.data_in(wire_d6_3),.data_out(wire_d6_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance765(.data_in(wire_d6_4),.data_out(wire_d6_5),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance766(.data_in(wire_d6_5),.data_out(wire_d6_6),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance767(.data_in(wire_d6_6),.data_out(wire_d6_7),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance768(.data_in(wire_d6_7),.data_out(wire_d6_8),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance769(.data_in(wire_d6_8),.data_out(wire_d6_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance7610(.data_in(wire_d6_9),.data_out(wire_d6_10),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance7611(.data_in(wire_d6_10),.data_out(d_out6),.clk(clk),.rst(rst));

	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance870(.data_in(d_in7),.data_out(wire_d7_0),.clk(clk),.rst(rst));            //channel 8
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance871(.data_in(wire_d7_0),.data_out(wire_d7_1),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance872(.data_in(wire_d7_1),.data_out(wire_d7_2),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance873(.data_in(wire_d7_2),.data_out(wire_d7_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance874(.data_in(wire_d7_3),.data_out(wire_d7_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance875(.data_in(wire_d7_4),.data_out(wire_d7_5),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance876(.data_in(wire_d7_5),.data_out(wire_d7_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance877(.data_in(wire_d7_6),.data_out(wire_d7_7),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance878(.data_in(wire_d7_7),.data_out(wire_d7_8),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance879(.data_in(wire_d7_8),.data_out(wire_d7_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance8710(.data_in(wire_d7_9),.data_out(wire_d7_10),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance8711(.data_in(wire_d7_10),.data_out(d_out7),.clk(clk),.rst(rst));

	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance980(.data_in(d_in8),.data_out(wire_d8_0),.clk(clk),.rst(rst));            //channel 9
	encoder #(.WIDTH(WIDTH)) encoder_instance981(.data_in(wire_d8_0),.data_out(wire_d8_1),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance982(.data_in(wire_d8_1),.data_out(wire_d8_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance983(.data_in(wire_d8_2),.data_out(wire_d8_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance984(.data_in(wire_d8_3),.data_out(wire_d8_4),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance985(.data_in(wire_d8_4),.data_out(wire_d8_5),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance986(.data_in(wire_d8_5),.data_out(wire_d8_6),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance987(.data_in(wire_d8_6),.data_out(wire_d8_7),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance988(.data_in(wire_d8_7),.data_out(wire_d8_8),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance989(.data_in(wire_d8_8),.data_out(wire_d8_9),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance9810(.data_in(wire_d8_9),.data_out(wire_d8_10),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance9811(.data_in(wire_d8_10),.data_out(d_out8),.clk(clk),.rst(rst));

	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance10090(.data_in(d_in9),.data_out(wire_d9_0),.clk(clk),.rst(rst));            //channel 10
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance10091(.data_in(wire_d9_0),.data_out(wire_d9_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance10092(.data_in(wire_d9_1),.data_out(wire_d9_2),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance10093(.data_in(wire_d9_2),.data_out(wire_d9_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance10094(.data_in(wire_d9_3),.data_out(wire_d9_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance10095(.data_in(wire_d9_4),.data_out(wire_d9_5),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance10096(.data_in(wire_d9_5),.data_out(wire_d9_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance10097(.data_in(wire_d9_6),.data_out(wire_d9_7),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance10098(.data_in(wire_d9_7),.data_out(wire_d9_8),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance10099(.data_in(wire_d9_8),.data_out(wire_d9_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance100910(.data_in(wire_d9_9),.data_out(wire_d9_10),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance100911(.data_in(wire_d9_10),.data_out(d_out9),.clk(clk),.rst(rst));

	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance110100(.data_in(d_in10),.data_out(wire_d10_0),.clk(clk),.rst(rst));            //channel 11
	encoder #(.WIDTH(WIDTH)) encoder_instance110101(.data_in(wire_d10_0),.data_out(wire_d10_1),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance110102(.data_in(wire_d10_1),.data_out(wire_d10_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance110103(.data_in(wire_d10_2),.data_out(wire_d10_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance110104(.data_in(wire_d10_3),.data_out(wire_d10_4),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance110105(.data_in(wire_d10_4),.data_out(wire_d10_5),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance110106(.data_in(wire_d10_5),.data_out(wire_d10_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance110107(.data_in(wire_d10_6),.data_out(wire_d10_7),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance110108(.data_in(wire_d10_7),.data_out(wire_d10_8),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance110109(.data_in(wire_d10_8),.data_out(wire_d10_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1101010(.data_in(wire_d10_9),.data_out(wire_d10_10),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance1101011(.data_in(wire_d10_10),.data_out(d_out10),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance120110(.data_in(d_in11),.data_out(wire_d11_0),.clk(clk),.rst(rst));            //channel 12
	encoder #(.WIDTH(WIDTH)) encoder_instance120111(.data_in(wire_d11_0),.data_out(wire_d11_1),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance120112(.data_in(wire_d11_1),.data_out(wire_d11_2),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance120113(.data_in(wire_d11_2),.data_out(wire_d11_3),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance120114(.data_in(wire_d11_3),.data_out(wire_d11_4),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance120115(.data_in(wire_d11_4),.data_out(wire_d11_5),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance120116(.data_in(wire_d11_5),.data_out(wire_d11_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance120117(.data_in(wire_d11_6),.data_out(wire_d11_7),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance120118(.data_in(wire_d11_7),.data_out(wire_d11_8),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance120119(.data_in(wire_d11_8),.data_out(wire_d11_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1201110(.data_in(wire_d11_9),.data_out(wire_d11_10),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance1201111(.data_in(wire_d11_10),.data_out(d_out11),.clk(clk),.rst(rst));

	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance130120(.data_in(d_in12),.data_out(wire_d12_0),.clk(clk),.rst(rst));            //channel 13
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance130121(.data_in(wire_d12_0),.data_out(wire_d12_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance130122(.data_in(wire_d12_1),.data_out(wire_d12_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance130123(.data_in(wire_d12_2),.data_out(wire_d12_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance130124(.data_in(wire_d12_3),.data_out(wire_d12_4),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance130125(.data_in(wire_d12_4),.data_out(wire_d12_5),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance130126(.data_in(wire_d12_5),.data_out(wire_d12_6),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance130127(.data_in(wire_d12_6),.data_out(wire_d12_7),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance130128(.data_in(wire_d12_7),.data_out(wire_d12_8),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance130129(.data_in(wire_d12_8),.data_out(wire_d12_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1301210(.data_in(wire_d12_9),.data_out(wire_d12_10),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance1301211(.data_in(wire_d12_10),.data_out(d_out12),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance140130(.data_in(d_in13),.data_out(wire_d13_0),.clk(clk),.rst(rst));            //channel 14
	register #(.WIDTH(WIDTH)) register_instance140131(.data_in(wire_d13_0),.data_out(wire_d13_1),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance140132(.data_in(wire_d13_1),.data_out(wire_d13_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance140133(.data_in(wire_d13_2),.data_out(wire_d13_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance140134(.data_in(wire_d13_3),.data_out(wire_d13_4),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance140135(.data_in(wire_d13_4),.data_out(wire_d13_5),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance140136(.data_in(wire_d13_5),.data_out(wire_d13_6),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance140137(.data_in(wire_d13_6),.data_out(wire_d13_7),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance140138(.data_in(wire_d13_7),.data_out(wire_d13_8),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance140139(.data_in(wire_d13_8),.data_out(wire_d13_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1401310(.data_in(wire_d13_9),.data_out(wire_d13_10),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance1401311(.data_in(wire_d13_10),.data_out(d_out13),.clk(clk),.rst(rst));

	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance150140(.data_in(d_in14),.data_out(wire_d14_0),.clk(clk),.rst(rst));            //channel 15
	register #(.WIDTH(WIDTH)) register_instance150141(.data_in(wire_d14_0),.data_out(wire_d14_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance150142(.data_in(wire_d14_1),.data_out(wire_d14_2),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance150143(.data_in(wire_d14_2),.data_out(wire_d14_3),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance150144(.data_in(wire_d14_3),.data_out(wire_d14_4),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance150145(.data_in(wire_d14_4),.data_out(wire_d14_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance150146(.data_in(wire_d14_5),.data_out(wire_d14_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance150147(.data_in(wire_d14_6),.data_out(wire_d14_7),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance150148(.data_in(wire_d14_7),.data_out(wire_d14_8),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance150149(.data_in(wire_d14_8),.data_out(wire_d14_9),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance1501410(.data_in(wire_d14_9),.data_out(wire_d14_10),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance1501411(.data_in(wire_d14_10),.data_out(d_out14),.clk(clk),.rst(rst));

	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance160150(.data_in(d_in15),.data_out(wire_d15_0),.clk(clk),.rst(rst));            //channel 16
	large_mux #(.WIDTH(WIDTH)) large_mux_instance160151(.data_in(wire_d15_0),.data_out(wire_d15_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance160152(.data_in(wire_d15_1),.data_out(wire_d15_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance160153(.data_in(wire_d15_2),.data_out(wire_d15_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance160154(.data_in(wire_d15_3),.data_out(wire_d15_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance160155(.data_in(wire_d15_4),.data_out(wire_d15_5),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance160156(.data_in(wire_d15_5),.data_out(wire_d15_6),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance160157(.data_in(wire_d15_6),.data_out(wire_d15_7),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance160158(.data_in(wire_d15_7),.data_out(wire_d15_8),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance160159(.data_in(wire_d15_8),.data_out(wire_d15_9),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance1601510(.data_in(wire_d15_9),.data_out(wire_d15_10),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1601511(.data_in(wire_d15_10),.data_out(d_out15),.clk(clk),.rst(rst));

	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance170160(.data_in(d_in16),.data_out(wire_d16_0),.clk(clk),.rst(rst));            //channel 17
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance170161(.data_in(wire_d16_0),.data_out(wire_d16_1),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance170162(.data_in(wire_d16_1),.data_out(wire_d16_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance170163(.data_in(wire_d16_2),.data_out(wire_d16_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance170164(.data_in(wire_d16_3),.data_out(wire_d16_4),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance170165(.data_in(wire_d16_4),.data_out(wire_d16_5),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance170166(.data_in(wire_d16_5),.data_out(wire_d16_6),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance170167(.data_in(wire_d16_6),.data_out(wire_d16_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance170168(.data_in(wire_d16_7),.data_out(wire_d16_8),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance170169(.data_in(wire_d16_8),.data_out(wire_d16_9),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance1701610(.data_in(wire_d16_9),.data_out(wire_d16_10),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance1701611(.data_in(wire_d16_10),.data_out(d_out16),.clk(clk),.rst(rst));

	encoder #(.WIDTH(WIDTH)) encoder_instance180170(.data_in(d_in17),.data_out(wire_d17_0),.clk(clk),.rst(rst));            //channel 18
	register #(.WIDTH(WIDTH)) register_instance180171(.data_in(wire_d17_0),.data_out(wire_d17_1),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance180172(.data_in(wire_d17_1),.data_out(wire_d17_2),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance180173(.data_in(wire_d17_2),.data_out(wire_d17_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance180174(.data_in(wire_d17_3),.data_out(wire_d17_4),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance180175(.data_in(wire_d17_4),.data_out(wire_d17_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance180176(.data_in(wire_d17_5),.data_out(wire_d17_6),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance180177(.data_in(wire_d17_6),.data_out(wire_d17_7),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance180178(.data_in(wire_d17_7),.data_out(wire_d17_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance180179(.data_in(wire_d17_8),.data_out(wire_d17_9),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance1801710(.data_in(wire_d17_9),.data_out(wire_d17_10),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance1801711(.data_in(wire_d17_10),.data_out(d_out17),.clk(clk),.rst(rst));

	large_mux #(.WIDTH(WIDTH)) large_mux_instance190180(.data_in(d_in18),.data_out(wire_d18_0),.clk(clk),.rst(rst));            //channel 19
	register #(.WIDTH(WIDTH)) register_instance190181(.data_in(wire_d18_0),.data_out(wire_d18_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance190182(.data_in(wire_d18_1),.data_out(wire_d18_2),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance190183(.data_in(wire_d18_2),.data_out(wire_d18_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance190184(.data_in(wire_d18_3),.data_out(wire_d18_4),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance190185(.data_in(wire_d18_4),.data_out(wire_d18_5),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance190186(.data_in(wire_d18_5),.data_out(wire_d18_6),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance190187(.data_in(wire_d18_6),.data_out(wire_d18_7),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance190188(.data_in(wire_d18_7),.data_out(wire_d18_8),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance190189(.data_in(wire_d18_8),.data_out(wire_d18_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1901810(.data_in(wire_d18_9),.data_out(wire_d18_10),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance1901811(.data_in(wire_d18_10),.data_out(d_out18),.clk(clk),.rst(rst));

	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance200190(.data_in(d_in19),.data_out(wire_d19_0),.clk(clk),.rst(rst));            //channel 20
	large_mux #(.WIDTH(WIDTH)) large_mux_instance200191(.data_in(wire_d19_0),.data_out(wire_d19_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance200192(.data_in(wire_d19_1),.data_out(wire_d19_2),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance200193(.data_in(wire_d19_2),.data_out(wire_d19_3),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance200194(.data_in(wire_d19_3),.data_out(wire_d19_4),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance200195(.data_in(wire_d19_4),.data_out(wire_d19_5),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance200196(.data_in(wire_d19_5),.data_out(wire_d19_6),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance200197(.data_in(wire_d19_6),.data_out(wire_d19_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance200198(.data_in(wire_d19_7),.data_out(wire_d19_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance200199(.data_in(wire_d19_8),.data_out(wire_d19_9),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance2001910(.data_in(wire_d19_9),.data_out(wire_d19_10),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance2001911(.data_in(wire_d19_10),.data_out(d_out19),.clk(clk),.rst(rst));


endmodule