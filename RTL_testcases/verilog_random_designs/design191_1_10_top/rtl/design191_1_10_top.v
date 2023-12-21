// `include "encoder.v"
// `include "invertion.v"
// `include "large_adder.v"
// `include "large_mux.v"
// `include "memory_cntrl.v"
// `include "register.v"
// `include "full_adder.v"
// `include "d_latch.v"
// `include "shift_reg.v"
// `include "mod_n_counter.v"
// `include "decoder.v"
// `include "parity_generator.v"

module design191_1_10_top #(parameter WIDTH=32,CHANNEL=1) (clk, rst, in, out);

	localparam OUT_BUS=CHANNEL*WIDTH;
	input clk,rst;
	input [WIDTH-1:0] in;
	output [WIDTH-1:0] out;

	reg [WIDTH-1:0] d_in0;
	wire [WIDTH-1:0] d_out0;

	reg [OUT_BUS-1:0] tmp;

	always @ (posedge clk or posedge rst) begin
		if (rst)
			tmp <= 0;
		else
			tmp <= {tmp[OUT_BUS-(WIDTH-1):0],in};
	end

	always @ (posedge clk) begin
		d_in0 <= tmp[WIDTH-1:0];
	end

	design191_1_10 #(.WIDTH(WIDTH)) design191_1_10_inst(.d_in0(d_in0),.d_out0(d_out0),.clk(clk),.rst(rst));

	assign out = d_out0;

endmodule

module design191_1_10 #(parameter WIDTH=32) (d_in0, d_out0, clk, rst);
	input clk;
	input rst;
	input [WIDTH-1:0] d_in0; 
	output [WIDTH-1:0] d_out0; 

	wire [WIDTH-1:0] wire_d0_0;
	wire [WIDTH-1:0] wire_d0_1;
	wire [WIDTH-1:0] wire_d0_2;
	wire [WIDTH-1:0] wire_d0_3;
	wire [WIDTH-1:0] wire_d0_4;
	wire [WIDTH-1:0] wire_d0_5;
	wire [WIDTH-1:0] wire_d0_6;
	wire [WIDTH-1:0] wire_d0_7;
	wire [WIDTH-1:0] wire_d0_8;

	large_adder #(.WIDTH(WIDTH)) large_adder_instance100(.data_in(d_in0),.data_out(wire_d0_0),.clk(clk),.rst(rst));            //channel 1
	memory_cntrl #(.WIDTH(WIDTH)) memory_cntrl_instance101(.data_in(wire_d0_0),.data_out(wire_d0_1),.clk(clk),.rst(rst));
	large_mux #(.WIDTH(WIDTH)) large_mux_instance102(.data_in(wire_d0_1),.data_out(wire_d0_2),.clk(clk),.rst(rst));
	decoder_top #(.WIDTH(WIDTH)) decoder_instance103(.data_in(wire_d0_2),.data_out(wire_d0_3),.clk(clk),.rst(rst));
	full_adder_top #(.WIDTH(WIDTH)) full_adder_instance104(.data_in(wire_d0_3),.data_out(wire_d0_4),.clk(clk),.rst(rst));
	mod_n_counter #(.WIDTH(WIDTH)) mod_n_counter_instance105(.data_in(wire_d0_4),.data_out(wire_d0_5),.clk(clk),.rst(rst));
	shift_reg_top #(.WIDTH(WIDTH)) shift_reg_instance106(.data_in(wire_d0_5),.data_out(wire_d0_6),.clk(clk),.rst(rst));
	paritygenerator_top #(.WIDTH(WIDTH)) parity_generator_instance107(.data_in(wire_d0_6),.data_out(wire_d0_7),.clk(clk),.rst(rst));
	encoder #(.WIDTH(WIDTH)) encoder_instance108(.data_in(wire_d0_7),.data_out(wire_d0_8),.clk(clk),.rst(rst));
	d_latch_top #(.WIDTH(WIDTH)) d_latch_instance109(.data_in(wire_d0_8),.data_out(d_out0),.clk(clk),.rst(rst));


endmodule