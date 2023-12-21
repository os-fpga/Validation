// `include "encoder.v"
// `include "invertion.v"
// `include "large_mux.v"
module design7_7_8_top #(parameter WIDTH=32,CHANNEL=7) (clk, rst, in, out);

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
	wire [WIDTH-1:0] d_out0;
	wire [WIDTH-1:0] d_out1;
	wire [WIDTH-1:0] d_out2;
	wire [WIDTH-1:0] d_out3;
	wire [WIDTH-1:0] d_out4;
	wire [WIDTH-1:0] d_out5;
	wire [WIDTH-1:0] d_out6;

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
	end

	design7_7_8 #(.WIDTH(WIDTH)) design7_7_8_inst(.d_in0(d_in0),.d_in1(d_in1),.d_in2(d_in2),.d_in3(d_in3),.d_in4(d_in4),.d_in5(d_in5),.d_in6(d_in6),.d_out0(d_out0),.d_out1(d_out1),.d_out2(d_out2),.d_out3(d_out3),.d_out4(d_out4),.d_out5(d_out5),.d_out6(d_out6),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1^d_out2^d_out3^d_out4^d_out5^d_out6;

endmodule

module design7_7_8 #(parameter WIDTH=32) (d_in0, d_in1, d_in2, d_in3, d_in4, d_in5, d_in6, d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, clk, rst);
	input clk;
	input rst;
	input [WIDTH-1:0] d_in0; 
	input [WIDTH-1:0] d_in1; 
	input [WIDTH-1:0] d_in2; 
	input [WIDTH-1:0] d_in3; 
	input [WIDTH-1:0] d_in4; 
	input [WIDTH-1:0] d_in5; 
	input [WIDTH-1:0] d_in6; 
	output [WIDTH-1:0] d_out0; 
	output [WIDTH-1:0] d_out1; 
	output [WIDTH-1:0] d_out2; 
	output [WIDTH-1:0] d_out3; 
	output [WIDTH-1:0] d_out4; 
	output [WIDTH-1:0] d_out5; 
	output [WIDTH-1:0] d_out6; 

	wire [WIDTH-1:0] wire_d0_0;
	wire [WIDTH-1:0] wire_d0_1;
	wire [WIDTH-1:0] wire_d0_2;
	wire [WIDTH-1:0] wire_d0_3;
	wire [WIDTH-1:0] wire_d0_4;
	wire [WIDTH-1:0] wire_d0_5;
	wire [WIDTH-1:0] wire_d0_6;
	wire [WIDTH-1:0] wire_d1_0;
	wire [WIDTH-1:0] wire_d1_1;
	wire [WIDTH-1:0] wire_d1_2;
	wire [WIDTH-1:0] wire_d1_3;
	wire [WIDTH-1:0] wire_d1_4;
	wire [WIDTH-1:0] wire_d1_5;
	wire [WIDTH-1:0] wire_d1_6;
	wire [WIDTH-1:0] wire_d2_0;
	wire [WIDTH-1:0] wire_d2_1;
	wire [WIDTH-1:0] wire_d2_2;
	wire [WIDTH-1:0] wire_d2_3;
	wire [WIDTH-1:0] wire_d2_4;
	wire [WIDTH-1:0] wire_d2_5;
	wire [WIDTH-1:0] wire_d2_6;
	wire [WIDTH-1:0] wire_d3_0;
	wire [WIDTH-1:0] wire_d3_1;
	wire [WIDTH-1:0] wire_d3_2;
	wire [WIDTH-1:0] wire_d3_3;
	wire [WIDTH-1:0] wire_d3_4;
	wire [WIDTH-1:0] wire_d3_5;
	wire [WIDTH-1:0] wire_d3_6;
	wire [WIDTH-1:0] wire_d4_0;
	wire [WIDTH-1:0] wire_d4_1;
	wire [WIDTH-1:0] wire_d4_2;
	wire [WIDTH-1:0] wire_d4_3;
	wire [WIDTH-1:0] wire_d4_4;
	wire [WIDTH-1:0] wire_d4_5;
	wire [WIDTH-1:0] wire_d4_6;
	wire [WIDTH-1:0] wire_d5_0;
	wire [WIDTH-1:0] wire_d5_1;
	wire [WIDTH-1:0] wire_d5_2;
	wire [WIDTH-1:0] wire_d5_3;
	wire [WIDTH-1:0] wire_d5_4;
	wire [WIDTH-1:0] wire_d5_5;
	wire [WIDTH-1:0] wire_d5_6;
	wire [WIDTH-1:0] wire_d6_0;
	wire [WIDTH-1:0] wire_d6_1;
	wire [WIDTH-1:0] wire_d6_2;
	wire [WIDTH-1:0] wire_d6_3;
	wire [WIDTH-1:0] wire_d6_4;
	wire [WIDTH-1:0] wire_d6_5;
	wire [WIDTH-1:0] wire_d6_6;

	encoder #(.WIDTH(WIDTH)) encoder_instance00(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	encoder #(.WIDTH(WIDTH)) encoder_instance01(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance02(.data_in(wire_d0_1),.data_out(wire_d0_2),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance03(.data_in(wire_d0_2),.data_out(wire_d0_3),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance04(.data_in(wire_d0_3),.data_out(wire_d0_4),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance05(.data_in(wire_d0_4),.data_out(wire_d0_5),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance06(.data_in(wire_d0_5),.data_out(wire_d0_6),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance07(.data_in(wire_d0_6),.data_out(d_out0),.clk(clk),.rst(rst));

	large_mux #(.WIDTH(WIDTH)) large_mux_instance10(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	encoder #(.WIDTH(WIDTH)) encoder_instance11(.data_in(wire_d1_0),.data_out(wire_d1_1),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance12(.data_in(wire_d1_1),.data_out(wire_d1_2),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance13(.data_in(wire_d1_2),.data_out(wire_d1_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance14(.data_in(wire_d1_3),.data_out(wire_d1_4),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance15(.data_in(wire_d1_4),.data_out(wire_d1_5),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance16(.data_in(wire_d1_5),.data_out(wire_d1_6),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance17(.data_in(wire_d1_6),.data_out(d_out1),.clk(clk),.rst(rst));

	encoder #(.WIDTH(WIDTH)) encoder_instance20(.data_in(d_in2),.data_out(wire_d2_0),.clk(clk),.rst(rst));            //channel 3
	encoder #(.WIDTH(WIDTH)) encoder_instance21(.data_in(wire_d2_0),.data_out(wire_d2_1),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance22(.data_in(wire_d2_1),.data_out(wire_d2_2),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance23(.data_in(wire_d2_2),.data_out(wire_d2_3),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance24(.data_in(wire_d2_3),.data_out(wire_d2_4),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance25(.data_in(wire_d2_4),.data_out(wire_d2_5),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance26(.data_in(wire_d2_5),.data_out(wire_d2_6),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance27(.data_in(wire_d2_6),.data_out(d_out2),.clk(clk),.rst(rst));

	large_mux #(.WIDTH(WIDTH)) large_mux_instance30(.data_in(d_in3),.data_out(wire_d3_0),.clk(clk),.rst(rst));            //channel 4
	invertion #(.WIDTH(WIDTH)) invertion_instance31(.data_in(wire_d3_0),.data_out(wire_d3_1),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance32(.data_in(wire_d3_1),.data_out(wire_d3_2),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance33(.data_in(wire_d3_2),.data_out(wire_d3_3),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance34(.data_in(wire_d3_3),.data_out(wire_d3_4),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance35(.data_in(wire_d3_4),.data_out(wire_d3_5),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance36(.data_in(wire_d3_5),.data_out(wire_d3_6),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance37(.data_in(wire_d3_6),.data_out(d_out3),.clk(clk),.rst(rst));

	encoder #(.WIDTH(WIDTH)) encoder_instance40(.data_in(d_in4),.data_out(wire_d4_0),.clk(clk),.rst(rst));            //channel 5
	invertion #(.WIDTH(WIDTH)) invertion_instance41(.data_in(wire_d4_0),.data_out(wire_d4_1),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance42(.data_in(wire_d4_1),.data_out(wire_d4_2),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance43(.data_in(wire_d4_2),.data_out(wire_d4_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance44(.data_in(wire_d4_3),.data_out(wire_d4_4),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance45(.data_in(wire_d4_4),.data_out(wire_d4_5),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance46(.data_in(wire_d4_5),.data_out(wire_d4_6),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance47(.data_in(wire_d4_6),.data_out(d_out4),.clk(clk),.rst(rst));

	invertion #(.WIDTH(WIDTH)) invertion_instance50(.data_in(d_in5),.data_out(wire_d5_0),.clk(clk),.rst(rst));            //channel 6
	invertion #(.WIDTH(WIDTH)) invertion_instance51(.data_in(wire_d5_0),.data_out(wire_d5_1),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance52(.data_in(wire_d5_1),.data_out(wire_d5_2),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance53(.data_in(wire_d5_2),.data_out(wire_d5_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance54(.data_in(wire_d5_3),.data_out(wire_d5_4),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance55(.data_in(wire_d5_4),.data_out(wire_d5_5),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance56(.data_in(wire_d5_5),.data_out(wire_d5_6),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance57(.data_in(wire_d5_6),.data_out(d_out5),.clk(clk),.rst(rst));

	encoder #(.WIDTH(WIDTH)) encoder_instance60(.data_in(d_in6),.data_out(wire_d6_0),.clk(clk),.rst(rst));            //channel 7
	encoder #(.WIDTH(WIDTH)) encoder_instance61(.data_in(wire_d6_0),.data_out(wire_d6_1),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance62(.data_in(wire_d6_1),.data_out(wire_d6_2),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance63(.data_in(wire_d6_2),.data_out(wire_d6_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance64(.data_in(wire_d6_3),.data_out(wire_d6_4),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance65(.data_in(wire_d6_4),.data_out(wire_d6_5),.clk(clk),.rst(rst));
	invertion #(.WIDTH(WIDTH)) invertion_instance66(.data_in(wire_d6_5),.data_out(wire_d6_6),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance67(.data_in(wire_d6_6),.data_out(d_out6),.clk(clk),.rst(rst));


endmodule