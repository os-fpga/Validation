// `include "full_adder.v"
// `include "register.v"
// `include "memory_cntrl.v"

module design100_12_15_top #(parameter WIDTH=32,CHANNEL=12) (clk, rst, in, out);

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
	end

	design100_12_15 #(.WIDTH(WIDTH)) design100_12_15_inst(.d_in0(d_in0),.d_in1(d_in1),.d_in2(d_in2),.d_in3(d_in3),.d_in4(d_in4),.d_in5(d_in5),.d_in6(d_in6),.d_in7(d_in7),.d_in8(d_in8),.d_in9(d_in9),.d_in10(d_in10),.d_in11(d_in11),.d_out0(d_out0),.d_out1(d_out1),.d_out2(d_out2),.d_out3(d_out3),.d_out4(d_out4),.d_out5(d_out5),.d_out6(d_out6),.d_out7(d_out7),.d_out8(d_out8),.d_out9(d_out9),.d_out10(d_out10),.d_out11(d_out11),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1^d_out2^d_out3^d_out4^d_out5^d_out6^d_out7^d_out8^d_out9^d_out10^d_out11;

endmodule

module design100_12_15 #(parameter WIDTH=32) (d_in0, d_in1, d_in2, d_in3, d_in4, d_in5, d_in6, d_in7, d_in8, d_in9, d_in10, d_in11, d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7, d_out8, d_out9, d_out10, d_out11, clk, rst);
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
	wire [WIDTH-1:0] wire_d0_11;
	wire [WIDTH-1:0] wire_d0_12;
	wire [WIDTH-1:0] wire_d0_13;
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
	wire [WIDTH-1:0] wire_d1_11;
	wire [WIDTH-1:0] wire_d1_12;
	wire [WIDTH-1:0] wire_d1_13;
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
	wire [WIDTH-1:0] wire_d2_11;
	wire [WIDTH-1:0] wire_d2_12;
	wire [WIDTH-1:0] wire_d2_13;
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
	wire [WIDTH-1:0] wire_d3_11;
	wire [WIDTH-1:0] wire_d3_12;
	wire [WIDTH-1:0] wire_d3_13;
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
	wire [WIDTH-1:0] wire_d4_11;
	wire [WIDTH-1:0] wire_d4_12;
	wire [WIDTH-1:0] wire_d4_13;
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
	wire [WIDTH-1:0] wire_d5_11;
	wire [WIDTH-1:0] wire_d5_12;
	wire [WIDTH-1:0] wire_d5_13;
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
	wire [WIDTH-1:0] wire_d6_11;
	wire [WIDTH-1:0] wire_d6_12;
	wire [WIDTH-1:0] wire_d6_13;
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
	wire [WIDTH-1:0] wire_d7_11;
	wire [WIDTH-1:0] wire_d7_12;
	wire [WIDTH-1:0] wire_d7_13;
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
	wire [WIDTH-1:0] wire_d8_11;
	wire [WIDTH-1:0] wire_d8_12;
	wire [WIDTH-1:0] wire_d8_13;
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
	wire [WIDTH-1:0] wire_d9_11;
	wire [WIDTH-1:0] wire_d9_12;
	wire [WIDTH-1:0] wire_d9_13;
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
	wire [WIDTH-1:0] wire_d10_11;
	wire [WIDTH-1:0] wire_d10_12;
	wire [WIDTH-1:0] wire_d10_13;
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
	wire [WIDTH-1:0] wire_d11_11;
	wire [WIDTH-1:0] wire_d11_12;
	wire [WIDTH-1:0] wire_d11_13;

	register #(.WIDTH(WIDTH)) register_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance101(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance102(.data_in(wire_d0_1),.data_out(wire_d0_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance103(.data_in(wire_d0_2),.data_out(wire_d0_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance104(.data_in(wire_d0_3),.data_out(wire_d0_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance105(.data_in(wire_d0_4),.data_out(wire_d0_5),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance106(.data_in(wire_d0_5),.data_out(wire_d0_6),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance107(.data_in(wire_d0_6),.data_out(wire_d0_7),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance108(.data_in(wire_d0_7),.data_out(wire_d0_8),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance109(.data_in(wire_d0_8),.data_out(wire_d0_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance1010(.data_in(wire_d0_9),.data_out(wire_d0_10),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1011(.data_in(wire_d0_10),.data_out(wire_d0_11),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1012(.data_in(wire_d0_11),.data_out(wire_d0_12),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance1013(.data_in(wire_d0_12),.data_out(wire_d0_13),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance1014(.data_in(wire_d0_13),.data_out(d_out0),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance210(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	register #(.WIDTH(WIDTH)) register_instance211(.data_in(wire_d1_0),.data_out(wire_d1_1),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance212(.data_in(wire_d1_1),.data_out(wire_d1_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance213(.data_in(wire_d1_2),.data_out(wire_d1_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance214(.data_in(wire_d1_3),.data_out(wire_d1_4),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance215(.data_in(wire_d1_4),.data_out(wire_d1_5),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance216(.data_in(wire_d1_5),.data_out(wire_d1_6),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance217(.data_in(wire_d1_6),.data_out(wire_d1_7),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance218(.data_in(wire_d1_7),.data_out(wire_d1_8),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance219(.data_in(wire_d1_8),.data_out(wire_d1_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2110(.data_in(wire_d1_9),.data_out(wire_d1_10),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance2111(.data_in(wire_d1_10),.data_out(wire_d1_11),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance2112(.data_in(wire_d1_11),.data_out(wire_d1_12),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance2113(.data_in(wire_d1_12),.data_out(wire_d1_13),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2114(.data_in(wire_d1_13),.data_out(d_out1),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance320(.data_in(d_in2),.data_out(wire_d2_0),.clk(clk),.rst(rst));            //channel 3
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance321(.data_in(wire_d2_0),.data_out(wire_d2_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance322(.data_in(wire_d2_1),.data_out(wire_d2_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance323(.data_in(wire_d2_2),.data_out(wire_d2_3),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance324(.data_in(wire_d2_3),.data_out(wire_d2_4),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance325(.data_in(wire_d2_4),.data_out(wire_d2_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance326(.data_in(wire_d2_5),.data_out(wire_d2_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance327(.data_in(wire_d2_6),.data_out(wire_d2_7),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance328(.data_in(wire_d2_7),.data_out(wire_d2_8),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance329(.data_in(wire_d2_8),.data_out(wire_d2_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance3210(.data_in(wire_d2_9),.data_out(wire_d2_10),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3211(.data_in(wire_d2_10),.data_out(wire_d2_11),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance3212(.data_in(wire_d2_11),.data_out(wire_d2_12),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance3213(.data_in(wire_d2_12),.data_out(wire_d2_13),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3214(.data_in(wire_d2_13),.data_out(d_out2),.clk(clk),.rst(rst));

	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance430(.data_in(d_in3),.data_out(wire_d3_0),.clk(clk),.rst(rst));            //channel 4
	register #(.WIDTH(WIDTH)) register_instance431(.data_in(wire_d3_0),.data_out(wire_d3_1),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance432(.data_in(wire_d3_1),.data_out(wire_d3_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance433(.data_in(wire_d3_2),.data_out(wire_d3_3),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance434(.data_in(wire_d3_3),.data_out(wire_d3_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance435(.data_in(wire_d3_4),.data_out(wire_d3_5),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance436(.data_in(wire_d3_5),.data_out(wire_d3_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance437(.data_in(wire_d3_6),.data_out(wire_d3_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance438(.data_in(wire_d3_7),.data_out(wire_d3_8),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance439(.data_in(wire_d3_8),.data_out(wire_d3_9),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance4310(.data_in(wire_d3_9),.data_out(wire_d3_10),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance4311(.data_in(wire_d3_10),.data_out(wire_d3_11),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4312(.data_in(wire_d3_11),.data_out(wire_d3_12),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance4313(.data_in(wire_d3_12),.data_out(wire_d3_13),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance4314(.data_in(wire_d3_13),.data_out(d_out3),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance540(.data_in(d_in4),.data_out(wire_d4_0),.clk(clk),.rst(rst));            //channel 5
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance541(.data_in(wire_d4_0),.data_out(wire_d4_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance542(.data_in(wire_d4_1),.data_out(wire_d4_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance543(.data_in(wire_d4_2),.data_out(wire_d4_3),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance544(.data_in(wire_d4_3),.data_out(wire_d4_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance545(.data_in(wire_d4_4),.data_out(wire_d4_5),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance546(.data_in(wire_d4_5),.data_out(wire_d4_6),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance547(.data_in(wire_d4_6),.data_out(wire_d4_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance548(.data_in(wire_d4_7),.data_out(wire_d4_8),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance549(.data_in(wire_d4_8),.data_out(wire_d4_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5410(.data_in(wire_d4_9),.data_out(wire_d4_10),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance5411(.data_in(wire_d4_10),.data_out(wire_d4_11),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5412(.data_in(wire_d4_11),.data_out(wire_d4_12),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance5413(.data_in(wire_d4_12),.data_out(wire_d4_13),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance5414(.data_in(wire_d4_13),.data_out(d_out4),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance650(.data_in(d_in5),.data_out(wire_d5_0),.clk(clk),.rst(rst));            //channel 6
	register #(.WIDTH(WIDTH)) register_instance651(.data_in(wire_d5_0),.data_out(wire_d5_1),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance652(.data_in(wire_d5_1),.data_out(wire_d5_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance653(.data_in(wire_d5_2),.data_out(wire_d5_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance654(.data_in(wire_d5_3),.data_out(wire_d5_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance655(.data_in(wire_d5_4),.data_out(wire_d5_5),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance656(.data_in(wire_d5_5),.data_out(wire_d5_6),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance657(.data_in(wire_d5_6),.data_out(wire_d5_7),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance658(.data_in(wire_d5_7),.data_out(wire_d5_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance659(.data_in(wire_d5_8),.data_out(wire_d5_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance6510(.data_in(wire_d5_9),.data_out(wire_d5_10),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance6511(.data_in(wire_d5_10),.data_out(wire_d5_11),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance6512(.data_in(wire_d5_11),.data_out(wire_d5_12),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance6513(.data_in(wire_d5_12),.data_out(wire_d5_13),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance6514(.data_in(wire_d5_13),.data_out(d_out5),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance760(.data_in(d_in6),.data_out(wire_d6_0),.clk(clk),.rst(rst));            //channel 7
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance761(.data_in(wire_d6_0),.data_out(wire_d6_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance762(.data_in(wire_d6_1),.data_out(wire_d6_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance763(.data_in(wire_d6_2),.data_out(wire_d6_3),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance764(.data_in(wire_d6_3),.data_out(wire_d6_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance765(.data_in(wire_d6_4),.data_out(wire_d6_5),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance766(.data_in(wire_d6_5),.data_out(wire_d6_6),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance767(.data_in(wire_d6_6),.data_out(wire_d6_7),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance768(.data_in(wire_d6_7),.data_out(wire_d6_8),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance769(.data_in(wire_d6_8),.data_out(wire_d6_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance7610(.data_in(wire_d6_9),.data_out(wire_d6_10),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance7611(.data_in(wire_d6_10),.data_out(wire_d6_11),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance7612(.data_in(wire_d6_11),.data_out(wire_d6_12),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance7613(.data_in(wire_d6_12),.data_out(wire_d6_13),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance7614(.data_in(wire_d6_13),.data_out(d_out6),.clk(clk),.rst(rst));

	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance870(.data_in(d_in7),.data_out(wire_d7_0),.clk(clk),.rst(rst));            //channel 8
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance871(.data_in(wire_d7_0),.data_out(wire_d7_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance872(.data_in(wire_d7_1),.data_out(wire_d7_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance873(.data_in(wire_d7_2),.data_out(wire_d7_3),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance874(.data_in(wire_d7_3),.data_out(wire_d7_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance875(.data_in(wire_d7_4),.data_out(wire_d7_5),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance876(.data_in(wire_d7_5),.data_out(wire_d7_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance877(.data_in(wire_d7_6),.data_out(wire_d7_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance878(.data_in(wire_d7_7),.data_out(wire_d7_8),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance879(.data_in(wire_d7_8),.data_out(wire_d7_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance8710(.data_in(wire_d7_9),.data_out(wire_d7_10),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance8711(.data_in(wire_d7_10),.data_out(wire_d7_11),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance8712(.data_in(wire_d7_11),.data_out(wire_d7_12),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance8713(.data_in(wire_d7_12),.data_out(wire_d7_13),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance8714(.data_in(wire_d7_13),.data_out(d_out7),.clk(clk),.rst(rst));

	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance980(.data_in(d_in8),.data_out(wire_d8_0),.clk(clk),.rst(rst));            //channel 9
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance981(.data_in(wire_d8_0),.data_out(wire_d8_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance982(.data_in(wire_d8_1),.data_out(wire_d8_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance983(.data_in(wire_d8_2),.data_out(wire_d8_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance984(.data_in(wire_d8_3),.data_out(wire_d8_4),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance985(.data_in(wire_d8_4),.data_out(wire_d8_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance986(.data_in(wire_d8_5),.data_out(wire_d8_6),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance987(.data_in(wire_d8_6),.data_out(wire_d8_7),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance988(.data_in(wire_d8_7),.data_out(wire_d8_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance989(.data_in(wire_d8_8),.data_out(wire_d8_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance9810(.data_in(wire_d8_9),.data_out(wire_d8_10),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance9811(.data_in(wire_d8_10),.data_out(wire_d8_11),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance9812(.data_in(wire_d8_11),.data_out(wire_d8_12),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance9813(.data_in(wire_d8_12),.data_out(wire_d8_13),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance9814(.data_in(wire_d8_13),.data_out(d_out8),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance10090(.data_in(d_in9),.data_out(wire_d9_0),.clk(clk),.rst(rst));            //channel 10
	register #(.WIDTH(WIDTH)) register_instance10091(.data_in(wire_d9_0),.data_out(wire_d9_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance10092(.data_in(wire_d9_1),.data_out(wire_d9_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance10093(.data_in(wire_d9_2),.data_out(wire_d9_3),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance10094(.data_in(wire_d9_3),.data_out(wire_d9_4),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance10095(.data_in(wire_d9_4),.data_out(wire_d9_5),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance10096(.data_in(wire_d9_5),.data_out(wire_d9_6),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance10097(.data_in(wire_d9_6),.data_out(wire_d9_7),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance10098(.data_in(wire_d9_7),.data_out(wire_d9_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance10099(.data_in(wire_d9_8),.data_out(wire_d9_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance100910(.data_in(wire_d9_9),.data_out(wire_d9_10),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance100911(.data_in(wire_d9_10),.data_out(wire_d9_11),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance100912(.data_in(wire_d9_11),.data_out(wire_d9_12),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance100913(.data_in(wire_d9_12),.data_out(wire_d9_13),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance100914(.data_in(wire_d9_13),.data_out(d_out9),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance110100(.data_in(d_in10),.data_out(wire_d10_0),.clk(clk),.rst(rst));            //channel 11
	register #(.WIDTH(WIDTH)) register_instance110101(.data_in(wire_d10_0),.data_out(wire_d10_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance110102(.data_in(wire_d10_1),.data_out(wire_d10_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance110103(.data_in(wire_d10_2),.data_out(wire_d10_3),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance110104(.data_in(wire_d10_3),.data_out(wire_d10_4),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance110105(.data_in(wire_d10_4),.data_out(wire_d10_5),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance110106(.data_in(wire_d10_5),.data_out(wire_d10_6),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance110107(.data_in(wire_d10_6),.data_out(wire_d10_7),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance110108(.data_in(wire_d10_7),.data_out(wire_d10_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance110109(.data_in(wire_d10_8),.data_out(wire_d10_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1101010(.data_in(wire_d10_9),.data_out(wire_d10_10),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance1101011(.data_in(wire_d10_10),.data_out(wire_d10_11),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance1101012(.data_in(wire_d10_11),.data_out(wire_d10_12),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance1101013(.data_in(wire_d10_12),.data_out(wire_d10_13),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1101014(.data_in(wire_d10_13),.data_out(d_out10),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance120110(.data_in(d_in11),.data_out(wire_d11_0),.clk(clk),.rst(rst));            //channel 12
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance120111(.data_in(wire_d11_0),.data_out(wire_d11_1),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance120112(.data_in(wire_d11_1),.data_out(wire_d11_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance120113(.data_in(wire_d11_2),.data_out(wire_d11_3),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance120114(.data_in(wire_d11_3),.data_out(wire_d11_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance120115(.data_in(wire_d11_4),.data_out(wire_d11_5),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance120116(.data_in(wire_d11_5),.data_out(wire_d11_6),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance120117(.data_in(wire_d11_6),.data_out(wire_d11_7),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance120118(.data_in(wire_d11_7),.data_out(wire_d11_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance120119(.data_in(wire_d11_8),.data_out(wire_d11_9),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance1201110(.data_in(wire_d11_9),.data_out(wire_d11_10),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance1201111(.data_in(wire_d11_10),.data_out(wire_d11_11),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance1201112(.data_in(wire_d11_11),.data_out(wire_d11_12),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1201113(.data_in(wire_d11_12),.data_out(wire_d11_13),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1201114(.data_in(wire_d11_13),.data_out(d_out11),.clk(clk),.rst(rst));


endmodule