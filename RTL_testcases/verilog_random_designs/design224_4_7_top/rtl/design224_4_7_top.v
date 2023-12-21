// `include "register.v"
// `include "full_adder_top.v"
// `include "d_latch_top.v"
// `include "shift_reg_top.v"
// `include "mod_n_counter.v"
// `include "decoder_top.v"
// `include "paritygenerator_top.v"
// `include "single_port_ram_top.v"
// `include "addsubb_top.v"

module design224_4_7_top #(parameter WIDTH=32,CHANNEL=4) (clk, rst, in, out);

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

	design224_4_7 #(.WIDTH(WIDTH)) design224_4_7_inst(.d_in0(d_in0),.d_in1(d_in1),.d_in2(d_in2),.d_in3(d_in3),.d_out0(d_out0),.d_out1(d_out1),.d_out2(d_out2),.d_out3(d_out3),.clk(clk),.rst(rst));

	assign out = d_out0^d_out1^d_out2^d_out3;

endmodule

module design224_4_7 #(parameter WIDTH=32) (d_in0, d_in1, d_in2, d_in3, d_out0, d_out1, d_out2, d_out3, clk, rst);
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

	mod_n_counter #(.WIDTH(WIDTH)) mod_n_counter_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	decoder_top #(.WIDTH(WIDTH)) decoder_top_instance101(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	paritygenerator_top #(.WIDTH(WIDTH)) paritygenerator_top_instance102(.data_in(wire_d0_1),.data_out(wire_d0_2),.clk(clk),.rst(rst));
	d_latch_top #(.WIDTH(WIDTH)) d_latch_top_instance103(.data_in(wire_d0_2),.data_out(wire_d0_3),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance104(.data_in(wire_d0_3),.data_out(wire_d0_4),.clk(clk),.rst(rst));
	addsubb_top #(.WIDTH(WIDTH)) addsubb_top_instance105(.data_in(wire_d0_4),.data_out(wire_d0_5),.clk(clk),.rst(rst));
	single_port_ram_top #(.WIDTH(WIDTH)) single_port_ram_top_instance106(.data_in(wire_d0_5),.data_out(d_out0),.clk(clk),.rst(rst));

	shift_reg_top #(.WIDTH(WIDTH)) shift_reg_top_instance210(.data_in(d_in1),.data_out(wire_d1_0),.clk(clk),.rst(rst));            //channel 2
	decoder_top #(.WIDTH(WIDTH)) decoder_top_instance211(.data_in(wire_d1_0),.data_out(wire_d1_1),.clk(clk),.rst(rst));
	single_port_ram_top #(.WIDTH(WIDTH)) single_port_ram_top_instance212(.data_in(wire_d1_1),.data_out(wire_d1_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance213(.data_in(wire_d1_2),.data_out(wire_d1_3),.clk(clk),.rst(rst));
	paritygenerator_top #(.WIDTH(WIDTH)) paritygenerator_top_instance214(.data_in(wire_d1_3),.data_out(wire_d1_4),.clk(clk),.rst(rst));
	mod_n_counter #(.WIDTH(WIDTH)) mod_n_counter_instance215(.data_in(wire_d1_4),.data_out(wire_d1_5),.clk(clk),.rst(rst));
	addsubb_top #(.WIDTH(WIDTH)) addsubb_top_instance216(.data_in(wire_d1_5),.data_out(d_out1),.clk(clk),.rst(rst));

	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance320(.data_in(d_in2),.data_out(wire_d2_0),.clk(clk),.rst(rst));            //channel 3
	mod_n_counter #(.WIDTH(WIDTH)) mod_n_counter_instance321(.data_in(wire_d2_0),.data_out(wire_d2_1),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance322(.data_in(wire_d2_1),.data_out(wire_d2_2),.clk(clk),.rst(rst));
	single_port_ram_top #(.WIDTH(WIDTH)) single_port_ram_top_instance323(.data_in(wire_d2_2),.data_out(wire_d2_3),.clk(clk),.rst(rst));
	decoder_top #(.WIDTH(WIDTH)) decoder_top_instance324(.data_in(wire_d2_3),.data_out(wire_d2_4),.clk(clk),.rst(rst));
	addsubb_top #(.WIDTH(WIDTH)) addsubb_top_instance325(.data_in(wire_d2_4),.data_out(wire_d2_5),.clk(clk),.rst(rst));
	paritygenerator_top #(.WIDTH(WIDTH)) paritygenerator_top_instance326(.data_in(wire_d2_5),.data_out(d_out2),.clk(clk),.rst(rst));

	mod_n_counter #(.WIDTH(WIDTH)) mod_n_counter_instance430(.data_in(d_in3),.data_out(wire_d3_0),.clk(clk),.rst(rst));            //channel 4
	decoder_top #(.WIDTH(WIDTH)) decoder_top_instance431(.data_in(wire_d3_0),.data_out(wire_d3_1),.clk(clk),.rst(rst));
	single_port_ram_top #(.WIDTH(WIDTH)) single_port_ram_top_instance432(.data_in(wire_d3_1),.data_out(wire_d3_2),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_top_instance433(.data_in(wire_d3_2),.data_out(wire_d3_3),.clk(clk),.rst(rst));
	d_latch_top #(.WIDTH(WIDTH)) d_latch_top_instance434(.data_in(wire_d3_3),.data_out(wire_d3_4),.clk(clk),.rst(rst));
	paritygenerator_top #(.WIDTH(WIDTH)) paritygenerator_top_instance435(.data_in(wire_d3_4),.data_out(wire_d3_5),.clk(clk),.rst(rst));
	register #(.WIDTH(WIDTH)) register_instance436(.data_in(wire_d3_5),.data_out(d_out3),.clk(clk),.rst(rst));


endmodule