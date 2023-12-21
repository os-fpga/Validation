// `include "register.v"
// `include "memory_cntrl.v"
// `include "full_adder.v"
// `include "large_mux.v"

module design111_4_4_top #(parameter WIDTH=32,CHANNEL=4) (clk, rst, in, out);

	localparam OUT_BUS=CHANNEL*WIDTH;
	input clk,rst;
	input [WIDTH-1:0] in;
	output [WIDTH-1:0] out;

	reg [WIDTH-1:0] d_in0;
	reg [WIDTH-1:0] d_in1;
	reg [WIDTH-1:0] d_in2;
	reg [WIDTH-1:0] d_in3;
	wire [WIDTH-1:0] d_out0;
	wire [WIDTH-1:0] d_out1;
	wire [WIDTH-1:0] d_out2;
	wire [WIDTH-1:0] d_out3;

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
	end

	design111_4_4 #(.WIDTH(WIDTH)) design111_4_4_inst(.d_in0(d_in0),.d_in1(d_in1),.d_in2(d_in2),.d_in3(d_in3),.d_out0(d_out0),.d_out1(d_out1),.d_out2(d_out2),.d_out3(d_out3),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1^d_out2^d_out3;

endmodule

module design111_4_4 #(parameter WIDTH=32) (d_in0, d_in1, d_in2, d_in3, d_out0, d_out1, d_out2, d_out3, clk, rst);
	input clk;
	input rst;
	input [WIDTH-1:0] d_in0; 
	input [WIDTH-1:0] d_in1; 
	input [WIDTH-1:0] d_in2; 
	input [WIDTH-1:0] d_in3; 
	output [WIDTH-1:0] d_out0; 
	output [WIDTH-1:0] d_out1; 
	output [WIDTH-1:0] d_out2; 
	output [WIDTH-1:0] d_out3; 

	wire [WIDTH-1:0] wire_d0_0;
	wire [WIDTH-1:0] wire_d0_1;
	wire [WIDTH-1:0] wire_d0_2;
	wire [WIDTH-1:0] wire_d1_0;
	wire [WIDTH-1:0] wire_d1_1;
	wire [WIDTH-1:0] wire_d1_2;
	wire [WIDTH-1:0] wire_d2_0;
	wire [WIDTH-1:0] wire_d2_1;
	wire [WIDTH-1:0] wire_d2_2;
	wire [WIDTH-1:0] wire_d3_0;
	wire [WIDTH-1:0] wire_d3_1;
	wire [WIDTH-1:0] wire_d3_2;

	large_mux #(.WIDTH(WIDTH)) large_mux_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance101(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance102(.data_in(wire_d0_1),.data_out(wire_d0_2),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance103(.data_in(wire_d0_2),.data_out(d_out0),.clk(clk),.rst(rst));

	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance210(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	register #(.WIDTH(WIDTH)) register_instance211(.data_in(wire_d1_0),.data_out(wire_d1_1),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance212(.data_in(wire_d1_1),.data_out(wire_d1_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance213(.data_in(wire_d1_2),.data_out(d_out1),.clk(clk),.rst(rst));

	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance320(.data_in(d_in2),.data_out(wire_d2_0),.clk(clk),.rst(rst));            //channel 3
	register #(.WIDTH(WIDTH)) register_instance321(.data_in(wire_d2_0),.data_out(wire_d2_1),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance322(.data_in(wire_d2_1),.data_out(wire_d2_2),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance323(.data_in(wire_d2_2),.data_out(d_out2),.clk(clk),.rst(rst));

	large_mux #(.WIDTH(WIDTH)) large_mux_instance430(.data_in(d_in3),.data_out(wire_d3_0),.clk(clk),.rst(rst));            //channel 4
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance431(.data_in(wire_d3_0),.data_out(wire_d3_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance432(.data_in(wire_d3_1),.data_out(wire_d3_2),.clk(clk),.rst(rst));
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance433(.data_in(wire_d3_2),.data_out(d_out3),.clk(clk),.rst(rst));


endmodule