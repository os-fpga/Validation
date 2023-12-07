// `include "large_adder.v"

module design53_5_20_top #(parameter WIDTH=32,CHANNEL=5) (clk, rst, in, out);

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

	design53_5_20 #(.WIDTH(WIDTH)) design53_5_20_inst(.d_in0(d_in0),.d_in1(d_in1),.d_in2(d_in2),.d_in3(d_in3),.d_in4(d_in4),.d_out0(d_out0),.d_out1(d_out1),.d_out2(d_out2),.d_out3(d_out3),.d_out4(d_out4),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1^d_out2^d_out3^d_out4;

endmodule

module design53_5_20 #(parameter WIDTH=32) (d_in0, d_in1, d_in2, d_in3, d_in4, d_out0, d_out1, d_out2, d_out3, d_out4, clk, rst);
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

	large_adder #(.WIDTH(WIDTH)) large_adder_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	large_adder #(.WIDTH(WIDTH)) large_adder_instance101(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance102(.data_in(wire_d0_1),.data_out(wire_d0_2),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance103(.data_in(wire_d0_2),.data_out(wire_d0_3),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance104(.data_in(wire_d0_3),.data_out(wire_d0_4),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance105(.data_in(wire_d0_4),.data_out(wire_d0_5),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance106(.data_in(wire_d0_5),.data_out(wire_d0_6),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance107(.data_in(wire_d0_6),.data_out(wire_d0_7),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance108(.data_in(wire_d0_7),.data_out(wire_d0_8),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance109(.data_in(wire_d0_8),.data_out(wire_d0_9),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance1010(.data_in(wire_d0_9),.data_out(wire_d0_10),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance1011(.data_in(wire_d0_10),.data_out(wire_d0_11),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance1012(.data_in(wire_d0_11),.data_out(wire_d0_12),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance1013(.data_in(wire_d0_12),.data_out(wire_d0_13),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance1014(.data_in(wire_d0_13),.data_out(wire_d0_14),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance1015(.data_in(wire_d0_14),.data_out(wire_d0_15),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance1016(.data_in(wire_d0_15),.data_out(wire_d0_16),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance1017(.data_in(wire_d0_16),.data_out(wire_d0_17),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance1018(.data_in(wire_d0_17),.data_out(wire_d0_18),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance1019(.data_in(wire_d0_18),.data_out(d_out0),.clk(clk),.rst(rst));

	large_adder #(.WIDTH(WIDTH)) large_adder_instance210(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	large_adder #(.WIDTH(WIDTH)) large_adder_instance211(.data_in(wire_d1_0),.data_out(wire_d1_1),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance212(.data_in(wire_d1_1),.data_out(wire_d1_2),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance213(.data_in(wire_d1_2),.data_out(wire_d1_3),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance214(.data_in(wire_d1_3),.data_out(wire_d1_4),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance215(.data_in(wire_d1_4),.data_out(wire_d1_5),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance216(.data_in(wire_d1_5),.data_out(wire_d1_6),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance217(.data_in(wire_d1_6),.data_out(wire_d1_7),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance218(.data_in(wire_d1_7),.data_out(wire_d1_8),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance219(.data_in(wire_d1_8),.data_out(wire_d1_9),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance2110(.data_in(wire_d1_9),.data_out(wire_d1_10),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance2111(.data_in(wire_d1_10),.data_out(wire_d1_11),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance2112(.data_in(wire_d1_11),.data_out(wire_d1_12),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance2113(.data_in(wire_d1_12),.data_out(wire_d1_13),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance2114(.data_in(wire_d1_13),.data_out(wire_d1_14),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance2115(.data_in(wire_d1_14),.data_out(wire_d1_15),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance2116(.data_in(wire_d1_15),.data_out(wire_d1_16),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance2117(.data_in(wire_d1_16),.data_out(wire_d1_17),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance2118(.data_in(wire_d1_17),.data_out(wire_d1_18),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance2119(.data_in(wire_d1_18),.data_out(d_out1),.clk(clk),.rst(rst));

	large_adder #(.WIDTH(WIDTH)) large_adder_instance320(.data_in(d_in2),.data_out(wire_d2_0),.clk(clk),.rst(rst));            //channel 3
	large_adder #(.WIDTH(WIDTH)) large_adder_instance321(.data_in(wire_d2_0),.data_out(wire_d2_1),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance322(.data_in(wire_d2_1),.data_out(wire_d2_2),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance323(.data_in(wire_d2_2),.data_out(wire_d2_3),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance324(.data_in(wire_d2_3),.data_out(wire_d2_4),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance325(.data_in(wire_d2_4),.data_out(wire_d2_5),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance326(.data_in(wire_d2_5),.data_out(wire_d2_6),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance327(.data_in(wire_d2_6),.data_out(wire_d2_7),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance328(.data_in(wire_d2_7),.data_out(wire_d2_8),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance329(.data_in(wire_d2_8),.data_out(wire_d2_9),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance3210(.data_in(wire_d2_9),.data_out(wire_d2_10),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance3211(.data_in(wire_d2_10),.data_out(wire_d2_11),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance3212(.data_in(wire_d2_11),.data_out(wire_d2_12),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance3213(.data_in(wire_d2_12),.data_out(wire_d2_13),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance3214(.data_in(wire_d2_13),.data_out(wire_d2_14),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance3215(.data_in(wire_d2_14),.data_out(wire_d2_15),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance3216(.data_in(wire_d2_15),.data_out(wire_d2_16),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance3217(.data_in(wire_d2_16),.data_out(wire_d2_17),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance3218(.data_in(wire_d2_17),.data_out(wire_d2_18),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance3219(.data_in(wire_d2_18),.data_out(d_out2),.clk(clk),.rst(rst));

	large_adder #(.WIDTH(WIDTH)) large_adder_instance430(.data_in(d_in3),.data_out(wire_d3_0),.clk(clk),.rst(rst));            //channel 4
	large_adder #(.WIDTH(WIDTH)) large_adder_instance431(.data_in(wire_d3_0),.data_out(wire_d3_1),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance432(.data_in(wire_d3_1),.data_out(wire_d3_2),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance433(.data_in(wire_d3_2),.data_out(wire_d3_3),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance434(.data_in(wire_d3_3),.data_out(wire_d3_4),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance435(.data_in(wire_d3_4),.data_out(wire_d3_5),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance436(.data_in(wire_d3_5),.data_out(wire_d3_6),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance437(.data_in(wire_d3_6),.data_out(wire_d3_7),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance438(.data_in(wire_d3_7),.data_out(wire_d3_8),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance439(.data_in(wire_d3_8),.data_out(wire_d3_9),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance4310(.data_in(wire_d3_9),.data_out(wire_d3_10),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance4311(.data_in(wire_d3_10),.data_out(wire_d3_11),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance4312(.data_in(wire_d3_11),.data_out(wire_d3_12),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance4313(.data_in(wire_d3_12),.data_out(wire_d3_13),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance4314(.data_in(wire_d3_13),.data_out(wire_d3_14),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance4315(.data_in(wire_d3_14),.data_out(wire_d3_15),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance4316(.data_in(wire_d3_15),.data_out(wire_d3_16),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance4317(.data_in(wire_d3_16),.data_out(wire_d3_17),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance4318(.data_in(wire_d3_17),.data_out(wire_d3_18),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance4319(.data_in(wire_d3_18),.data_out(d_out3),.clk(clk),.rst(rst));

	large_adder #(.WIDTH(WIDTH)) large_adder_instance540(.data_in(d_in4),.data_out(wire_d4_0),.clk(clk),.rst(rst));            //channel 5
	large_adder #(.WIDTH(WIDTH)) large_adder_instance541(.data_in(wire_d4_0),.data_out(wire_d4_1),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance542(.data_in(wire_d4_1),.data_out(wire_d4_2),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance543(.data_in(wire_d4_2),.data_out(wire_d4_3),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance544(.data_in(wire_d4_3),.data_out(wire_d4_4),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance545(.data_in(wire_d4_4),.data_out(wire_d4_5),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance546(.data_in(wire_d4_5),.data_out(wire_d4_6),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance547(.data_in(wire_d4_6),.data_out(wire_d4_7),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance548(.data_in(wire_d4_7),.data_out(wire_d4_8),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance549(.data_in(wire_d4_8),.data_out(wire_d4_9),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance5410(.data_in(wire_d4_9),.data_out(wire_d4_10),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance5411(.data_in(wire_d4_10),.data_out(wire_d4_11),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance5412(.data_in(wire_d4_11),.data_out(wire_d4_12),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance5413(.data_in(wire_d4_12),.data_out(wire_d4_13),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance5414(.data_in(wire_d4_13),.data_out(wire_d4_14),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance5415(.data_in(wire_d4_14),.data_out(wire_d4_15),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance5416(.data_in(wire_d4_15),.data_out(wire_d4_16),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance5417(.data_in(wire_d4_16),.data_out(wire_d4_17),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance5418(.data_in(wire_d4_17),.data_out(wire_d4_18),.clk(clk),.rst(rst));
	large_adder #(.WIDTH(WIDTH)) large_adder_instance5419(.data_in(wire_d4_18),.data_out(d_out4),.clk(clk),.rst(rst));


endmodule