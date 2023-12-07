// `include "register.v"

module design79_6_20_top #(parameter WIDTH=32,CHANNEL=6) (clk, rst, in, out);

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
	wire [WIDTH-1:0] d_out0;
	wire [WIDTH-1:0] d_out1;
	wire [WIDTH-1:0] d_out2;
	wire [WIDTH-1:0] d_out3;
	wire [WIDTH-1:0] d_out4;
	wire [WIDTH-1:0] d_out5;

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
	end

	design79_6_20 #(.WIDTH(WIDTH)) design79_6_20_inst(.d_in0(d_in0),.d_in1(d_in1),.d_in2(d_in2),.d_in3(d_in3),.d_in4(d_in4),.d_in5(d_in5),.d_out0(d_out0),.d_out1(d_out1),.d_out2(d_out2),.d_out3(d_out3),.d_out4(d_out4),.d_out5(d_out5),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1^d_out2^d_out3^d_out4^d_out5;

endmodule

module design79_6_20 #(parameter WIDTH=32) (d_in0, d_in1, d_in2, d_in3, d_in4, d_in5, d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, clk, rst);
	input clk;
	input rst;
	input [WIDTH-1:0] d_in0; 
	input [WIDTH-1:0] d_in1; 
	input [WIDTH-1:0] d_in2; 
	input [WIDTH-1:0] d_in3; 
	input [WIDTH-1:0] d_in4; 
	input [WIDTH-1:0] d_in5; 
	output [WIDTH-1:0] d_out0; 
	output [WIDTH-1:0] d_out1; 
	output [WIDTH-1:0] d_out2; 
	output [WIDTH-1:0] d_out3; 
	output [WIDTH-1:0] d_out4; 
	output [WIDTH-1:0] d_out5; 

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
	wire [WIDTH-1:0] wire_d0_14;
	wire [WIDTH-1:0] wire_d0_15;
	wire [WIDTH-1:0] wire_d0_16;
	wire [WIDTH-1:0] wire_d0_17;
	wire [WIDTH-1:0] wire_d0_18;
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
	wire [WIDTH-1:0] wire_d1_14;
	wire [WIDTH-1:0] wire_d1_15;
	wire [WIDTH-1:0] wire_d1_16;
	wire [WIDTH-1:0] wire_d1_17;
	wire [WIDTH-1:0] wire_d1_18;
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
	wire [WIDTH-1:0] wire_d2_14;
	wire [WIDTH-1:0] wire_d2_15;
	wire [WIDTH-1:0] wire_d2_16;
	wire [WIDTH-1:0] wire_d2_17;
	wire [WIDTH-1:0] wire_d2_18;
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
	wire [WIDTH-1:0] wire_d3_14;
	wire [WIDTH-1:0] wire_d3_15;
	wire [WIDTH-1:0] wire_d3_16;
	wire [WIDTH-1:0] wire_d3_17;
	wire [WIDTH-1:0] wire_d3_18;
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
	wire [WIDTH-1:0] wire_d4_14;
	wire [WIDTH-1:0] wire_d4_15;
	wire [WIDTH-1:0] wire_d4_16;
	wire [WIDTH-1:0] wire_d4_17;
	wire [WIDTH-1:0] wire_d4_18;
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
	wire [WIDTH-1:0] wire_d5_14;
	wire [WIDTH-1:0] wire_d5_15;
	wire [WIDTH-1:0] wire_d5_16;
	wire [WIDTH-1:0] wire_d5_17;
	wire [WIDTH-1:0] wire_d5_18;

	register #(.WIDTH(WIDTH)) register_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	register #(.WIDTH(WIDTH)) register_instance101(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance102(.data_in(wire_d0_1),.data_out(wire_d0_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance103(.data_in(wire_d0_2),.data_out(wire_d0_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance104(.data_in(wire_d0_3),.data_out(wire_d0_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance105(.data_in(wire_d0_4),.data_out(wire_d0_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance106(.data_in(wire_d0_5),.data_out(wire_d0_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance107(.data_in(wire_d0_6),.data_out(wire_d0_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance108(.data_in(wire_d0_7),.data_out(wire_d0_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance109(.data_in(wire_d0_8),.data_out(wire_d0_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1010(.data_in(wire_d0_9),.data_out(wire_d0_10),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1011(.data_in(wire_d0_10),.data_out(wire_d0_11),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1012(.data_in(wire_d0_11),.data_out(wire_d0_12),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1013(.data_in(wire_d0_12),.data_out(wire_d0_13),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1014(.data_in(wire_d0_13),.data_out(wire_d0_14),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1015(.data_in(wire_d0_14),.data_out(wire_d0_15),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1016(.data_in(wire_d0_15),.data_out(wire_d0_16),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1017(.data_in(wire_d0_16),.data_out(wire_d0_17),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1018(.data_in(wire_d0_17),.data_out(wire_d0_18),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance1019(.data_in(wire_d0_18),.data_out(d_out0),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance210(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	register #(.WIDTH(WIDTH)) register_instance211(.data_in(wire_d1_0),.data_out(wire_d1_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance212(.data_in(wire_d1_1),.data_out(wire_d1_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance213(.data_in(wire_d1_2),.data_out(wire_d1_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance214(.data_in(wire_d1_3),.data_out(wire_d1_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance215(.data_in(wire_d1_4),.data_out(wire_d1_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance216(.data_in(wire_d1_5),.data_out(wire_d1_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance217(.data_in(wire_d1_6),.data_out(wire_d1_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance218(.data_in(wire_d1_7),.data_out(wire_d1_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance219(.data_in(wire_d1_8),.data_out(wire_d1_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2110(.data_in(wire_d1_9),.data_out(wire_d1_10),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2111(.data_in(wire_d1_10),.data_out(wire_d1_11),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2112(.data_in(wire_d1_11),.data_out(wire_d1_12),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2113(.data_in(wire_d1_12),.data_out(wire_d1_13),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2114(.data_in(wire_d1_13),.data_out(wire_d1_14),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2115(.data_in(wire_d1_14),.data_out(wire_d1_15),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2116(.data_in(wire_d1_15),.data_out(wire_d1_16),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2117(.data_in(wire_d1_16),.data_out(wire_d1_17),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2118(.data_in(wire_d1_17),.data_out(wire_d1_18),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance2119(.data_in(wire_d1_18),.data_out(d_out1),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance320(.data_in(d_in2),.data_out(wire_d2_0),.clk(clk),.rst(rst));            //channel 3
	register #(.WIDTH(WIDTH)) register_instance321(.data_in(wire_d2_0),.data_out(wire_d2_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance322(.data_in(wire_d2_1),.data_out(wire_d2_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance323(.data_in(wire_d2_2),.data_out(wire_d2_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance324(.data_in(wire_d2_3),.data_out(wire_d2_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance325(.data_in(wire_d2_4),.data_out(wire_d2_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance326(.data_in(wire_d2_5),.data_out(wire_d2_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance327(.data_in(wire_d2_6),.data_out(wire_d2_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance328(.data_in(wire_d2_7),.data_out(wire_d2_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance329(.data_in(wire_d2_8),.data_out(wire_d2_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3210(.data_in(wire_d2_9),.data_out(wire_d2_10),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3211(.data_in(wire_d2_10),.data_out(wire_d2_11),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3212(.data_in(wire_d2_11),.data_out(wire_d2_12),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3213(.data_in(wire_d2_12),.data_out(wire_d2_13),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3214(.data_in(wire_d2_13),.data_out(wire_d2_14),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3215(.data_in(wire_d2_14),.data_out(wire_d2_15),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3216(.data_in(wire_d2_15),.data_out(wire_d2_16),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3217(.data_in(wire_d2_16),.data_out(wire_d2_17),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3218(.data_in(wire_d2_17),.data_out(wire_d2_18),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance3219(.data_in(wire_d2_18),.data_out(d_out2),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance430(.data_in(d_in3),.data_out(wire_d3_0),.clk(clk),.rst(rst));            //channel 4
	register #(.WIDTH(WIDTH)) register_instance431(.data_in(wire_d3_0),.data_out(wire_d3_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance432(.data_in(wire_d3_1),.data_out(wire_d3_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance433(.data_in(wire_d3_2),.data_out(wire_d3_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance434(.data_in(wire_d3_3),.data_out(wire_d3_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance435(.data_in(wire_d3_4),.data_out(wire_d3_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance436(.data_in(wire_d3_5),.data_out(wire_d3_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance437(.data_in(wire_d3_6),.data_out(wire_d3_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance438(.data_in(wire_d3_7),.data_out(wire_d3_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance439(.data_in(wire_d3_8),.data_out(wire_d3_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4310(.data_in(wire_d3_9),.data_out(wire_d3_10),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4311(.data_in(wire_d3_10),.data_out(wire_d3_11),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4312(.data_in(wire_d3_11),.data_out(wire_d3_12),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4313(.data_in(wire_d3_12),.data_out(wire_d3_13),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4314(.data_in(wire_d3_13),.data_out(wire_d3_14),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4315(.data_in(wire_d3_14),.data_out(wire_d3_15),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4316(.data_in(wire_d3_15),.data_out(wire_d3_16),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4317(.data_in(wire_d3_16),.data_out(wire_d3_17),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4318(.data_in(wire_d3_17),.data_out(wire_d3_18),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance4319(.data_in(wire_d3_18),.data_out(d_out3),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance540(.data_in(d_in4),.data_out(wire_d4_0),.clk(clk),.rst(rst));            //channel 5
	register #(.WIDTH(WIDTH)) register_instance541(.data_in(wire_d4_0),.data_out(wire_d4_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance542(.data_in(wire_d4_1),.data_out(wire_d4_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance543(.data_in(wire_d4_2),.data_out(wire_d4_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance544(.data_in(wire_d4_3),.data_out(wire_d4_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance545(.data_in(wire_d4_4),.data_out(wire_d4_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance546(.data_in(wire_d4_5),.data_out(wire_d4_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance547(.data_in(wire_d4_6),.data_out(wire_d4_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance548(.data_in(wire_d4_7),.data_out(wire_d4_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance549(.data_in(wire_d4_8),.data_out(wire_d4_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5410(.data_in(wire_d4_9),.data_out(wire_d4_10),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5411(.data_in(wire_d4_10),.data_out(wire_d4_11),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5412(.data_in(wire_d4_11),.data_out(wire_d4_12),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5413(.data_in(wire_d4_12),.data_out(wire_d4_13),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5414(.data_in(wire_d4_13),.data_out(wire_d4_14),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5415(.data_in(wire_d4_14),.data_out(wire_d4_15),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5416(.data_in(wire_d4_15),.data_out(wire_d4_16),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5417(.data_in(wire_d4_16),.data_out(wire_d4_17),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5418(.data_in(wire_d4_17),.data_out(wire_d4_18),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance5419(.data_in(wire_d4_18),.data_out(d_out4),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance650(.data_in(d_in5),.data_out(wire_d5_0),.clk(clk),.rst(rst));            //channel 6
	register #(.WIDTH(WIDTH)) register_instance651(.data_in(wire_d5_0),.data_out(wire_d5_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance652(.data_in(wire_d5_1),.data_out(wire_d5_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance653(.data_in(wire_d5_2),.data_out(wire_d5_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance654(.data_in(wire_d5_3),.data_out(wire_d5_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance655(.data_in(wire_d5_4),.data_out(wire_d5_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance656(.data_in(wire_d5_5),.data_out(wire_d5_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance657(.data_in(wire_d5_6),.data_out(wire_d5_7),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance658(.data_in(wire_d5_7),.data_out(wire_d5_8),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance659(.data_in(wire_d5_8),.data_out(wire_d5_9),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance6510(.data_in(wire_d5_9),.data_out(wire_d5_10),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance6511(.data_in(wire_d5_10),.data_out(wire_d5_11),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance6512(.data_in(wire_d5_11),.data_out(wire_d5_12),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance6513(.data_in(wire_d5_12),.data_out(wire_d5_13),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance6514(.data_in(wire_d5_13),.data_out(wire_d5_14),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance6515(.data_in(wire_d5_14),.data_out(wire_d5_15),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance6516(.data_in(wire_d5_15),.data_out(wire_d5_16),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance6517(.data_in(wire_d5_16),.data_out(wire_d5_17),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance6518(.data_in(wire_d5_17),.data_out(wire_d5_18),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance6519(.data_in(wire_d5_18),.data_out(d_out5),.clk(clk),.rst(rst));


endmodule