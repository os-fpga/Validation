// `include "large_mux.v"
// `include "memory_cntrl.v"
// `include "register.v"
// `include "full_adder_top.v"
// `include "register_vhd.v"

module design315_6_8_top #(parameter WIDTH=32,CHANNEL=6) (clk, rst, in, out);

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

	design315_6_8 #(.WIDTH(WIDTH)) design315_6_8_inst(.d_in0(d_in0),.d_in1(d_in1),.d_in2(d_in2),.d_in3(d_in3),.d_in4(d_in4),.d_in5(d_in5),.d_out0(d_out0),.d_out1(d_out1),.d_out2(d_out2),.d_out3(d_out3),.d_out4(d_out4),.d_out5(d_out5),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1^d_out2^d_out3^d_out4^d_out5;

endmodule

module design315_6_8 #(parameter WIDTH=32) (d_in0, d_in1, d_in2, d_in3, d_in4, d_in5, d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, clk, rst);
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

	large_mux #(.WIDTH(WIDTH)) large_mux_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance101(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance102(.data_in(wire_d0_1),.data_out(wire_d0_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance103(.data_in(wire_d0_2),.data_out(wire_d0_3),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance104(.data_in(wire_d0_3),.data_out(wire_d0_4),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance105(.data_in(wire_d0_4),.data_out(wire_d0_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance106(.data_in(wire_d0_5),.data_out(wire_d0_6),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance107(.data_in(wire_d0_6),.data_out(d_out0),.clk(clk),.rst(rst));

	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance210(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance211(.data_in(wire_d1_0),.data_out(wire_d1_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance212(.data_in(wire_d1_1),.data_out(wire_d1_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance213(.data_in(wire_d1_2),.data_out(wire_d1_3),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance214(.data_in(wire_d1_3),.data_out(wire_d1_4),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance215(.data_in(wire_d1_4),.data_out(wire_d1_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance216(.data_in(wire_d1_5),.data_out(wire_d1_6),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance217(.data_in(wire_d1_6),.data_out(d_out1),.clk(clk),.rst(rst));

	register #(.WIDTH(WIDTH)) register_instance320(.data_in(d_in2),.data_out(wire_d2_0),.clk(clk),.rst(rst));            //channel 3
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance321(.data_in(wire_d2_0),.data_out(wire_d2_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance322(.data_in(wire_d2_1),.data_out(wire_d2_2),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance323(.data_in(wire_d2_2),.data_out(wire_d2_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance324(.data_in(wire_d2_3),.data_out(wire_d2_4),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance325(.data_in(wire_d2_4),.data_out(wire_d2_5),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance326(.data_in(wire_d2_5),.data_out(wire_d2_6),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance327(.data_in(wire_d2_6),.data_out(d_out2),.clk(clk),.rst(rst));

	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance430(.data_in(d_in3),.data_out(wire_d3_0),.clk(clk),.rst(rst));            //channel 4
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance431(.data_in(wire_d3_0),.data_out(wire_d3_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance432(.data_in(wire_d3_1),.data_out(wire_d3_2),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance433(.data_in(wire_d3_2),.data_out(wire_d3_3),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance434(.data_in(wire_d3_3),.data_out(wire_d3_4),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance435(.data_in(wire_d3_4),.data_out(wire_d3_5),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance436(.data_in(wire_d3_5),.data_out(wire_d3_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance437(.data_in(wire_d3_6),.data_out(d_out3),.clk(clk),.rst(rst));

	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance540(.data_in(d_in4),.data_out(wire_d4_0),.clk(clk),.rst(rst));            //channel 5
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance541(.data_in(wire_d4_0),.data_out(wire_d4_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance542(.data_in(wire_d4_1),.data_out(wire_d4_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance543(.data_in(wire_d4_2),.data_out(wire_d4_3),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance544(.data_in(wire_d4_3),.data_out(wire_d4_4),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance545(.data_in(wire_d4_4),.data_out(wire_d4_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance546(.data_in(wire_d4_5),.data_out(wire_d4_6),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance547(.data_in(wire_d4_6),.data_out(d_out4),.clk(clk),.rst(rst));

	large_mux #(.WIDTH(WIDTH)) large_mux_instance650(.data_in(d_in5),.data_out(wire_d5_0),.clk(clk),.rst(rst));            //channel 6
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance651(.data_in(wire_d5_0),.data_out(wire_d5_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance652(.data_in(wire_d5_1),.data_out(wire_d5_2),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance653(.data_in(wire_d5_2),.data_out(wire_d5_3),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance654(.data_in(wire_d5_3),.data_out(wire_d5_4),.clk(clk),.rst(rst));
	register_vhd #(.WIDTH(WIDTH)) register_vhd_instance655(.data_in(wire_d5_4),.data_out(wire_d5_5),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance656(.data_in(wire_d5_5),.data_out(wire_d5_6),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance657(.data_in(wire_d5_6),.data_out(d_out5),.clk(clk),.rst(rst));


endmodule