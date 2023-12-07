/*
	This module instantiates all of the various verilog and system verilog
	ram/rom templates included in Quartus II 12.0
	
	This should serve as a good test of the memory sub-systems in the
	stratixiv architecture file.


*/
`define SINGLE_PORT 1
`define DUAL_PORT 1
`define BIDIR_DUAL_PORT 1
`define MIXED_WIDTH 1
`define ROM 1
`define MLAB 1
`define BIG_RAM 1
module memory_test #(
	parameter DATA_WIDTH = 8,
	parameter ADDR_WIDTH = 8
	) (
	input clk_a,
	input clk_b,
	input we_a,
	input we_b,
	input [ADDR_WIDTH-1:0] addr_a,
	input [ADDR_WIDTH-1:0] addr_b,
	input [DATA_WIDTH-1:0] data_in_a,
	input [DATA_WIDTH-1:0] data_in_b,
	input [4:0] sel,
	
	output reg [DATA_WIDTH-1:0] data_out_a,
	output reg [DATA_WIDTH-1:0] data_out_b
	
	);

	wire [DATA_WIDTH-1:0] data_out_a_00;
	wire [DATA_WIDTH-1:0] data_out_b_00;
	wire [DATA_WIDTH-1:0] data_out_a_01;
	wire [DATA_WIDTH-1:0] data_out_b_01;
	wire [DATA_WIDTH-1:0] data_out_a_02;
	wire [DATA_WIDTH-1:0] data_out_b_02;
	wire [DATA_WIDTH-1:0] data_out_a_03;
	wire [DATA_WIDTH-1:0] data_out_b_03;
	wire [DATA_WIDTH-1:0] data_out_a_04;
	wire [DATA_WIDTH-1:0] data_out_b_04;
	wire [DATA_WIDTH-1:0] data_out_a_05;
	wire [DATA_WIDTH-1:0] data_out_b_05;
	wire [DATA_WIDTH-1:0] data_out_a_06;
	wire [DATA_WIDTH-1:0] data_out_b_06;
	wire [DATA_WIDTH-1:0] data_out_a_07;
	wire [DATA_WIDTH-1:0] data_out_b_07;
	wire [DATA_WIDTH-1:0] data_out_a_08;
	wire [DATA_WIDTH-1:0] data_out_b_08;
	wire [DATA_WIDTH-1:0] data_out_a_09;
	wire [DATA_WIDTH-1:0] data_out_b_09;
	wire [DATA_WIDTH-1:0] data_out_a_10;
	wire [DATA_WIDTH-1:0] data_out_b_10;
	wire [DATA_WIDTH-1:0] data_out_a_11;
	wire [DATA_WIDTH-1:0] data_out_b_11;	
	wire [DATA_WIDTH-1:0] data_out_a_12;
	wire [DATA_WIDTH-1:0] data_out_b_12;
	wire [DATA_WIDTH-1:0] data_out_a_13;
	wire [DATA_WIDTH-1:0] data_out_b_13;
	wire [DATA_WIDTH-1:0] data_out_a_14;
	wire [DATA_WIDTH-1:0] data_out_b_14;
	wire [DATA_WIDTH-1:0] data_out_a_15;
	wire [DATA_WIDTH-1:0] data_out_b_15;

`ifdef SINGLE_PORT

	infer_single_port_ram #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) inst00 (
			.data(data_in_a),
			.addr(addr_a),
			.we(we_a),
			.clk(clk_a),
			.q(data_out_a_00)
		);
		
`endif
		
`ifdef DUAL_PORT

	infer_simple_dual_port_ram_single_clock #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) inst01(
			.data(data_in_a),
			.read_addr(addr_a), 
			.write_addr(addr_b),
			.we(we_a), 
			.clk(clk_a),
			.q(data_out_a_01)
		);

	infer_simple_dual_port_ram_dual_clock #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) inst02(
			.data(data_in_a),
			.read_addr(addr_a), 
			.write_addr(addr_b),
			.we(we_a), 
			.read_clock(clk_a),
			.write_clock(clk_b),
			.q(data_out_a_02)
		);

`endif

`ifdef BIDIR_DUAL_PORT
	infer_true_dual_port_ram_single_clock #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) inst03(
			.data_a(data_in_a),
			.data_b(data_in_b),
			.addr_a(addr_a), 
			.addr_b(addr_b),
			.we_a(we_a), 
			.we_b(we_b), 
			.clk(clk_a),
			.q_a(data_out_a_03),
			.q_b(data_out_b_03)
		);
		
	infer_true_dual_port_ram_dual_clock #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) inst04(
			.data_a(data_in_a),
			.data_b(data_in_b),
			.addr_a(addr_a), 
			.addr_b(addr_b),
			.we_a(we_a), 
			.we_b(we_b), 
			.clk_a(clk_a),
			.clk_b(clk_b),
			.q_a(data_out_a_04),
			.q_b(data_out_b_04)
		);
`endif

`ifdef ROM
`ifdef SINGLE_PORT	
	//ROMS require a fixed size memory initialization file, so only use a fixed width
	infer_single_port_rom inst05 (
			.addr(addr_a),
			.clk(clk_a),
			.q(data_out_a_05)
		);
`endif

`ifdef BIDIR_DUAL_PORT
	//ROMS require a fixed size memory initialization file, so only use a fixed width
	//NOTE: actually infers a bidir_dual_port ram
	infer_dual_port_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(8)) inst06 (
		.addr_a(addr_a),
		.addr_b(addr_b),
		.clk(clk_a), 
		.q_a(data_out_a_06),
		.q_b(data_out_b_06)
		);
`endif
`endif


`ifdef MIXED_WIDTH
`ifdef DUAL_PORT
	/*
		ADDR_WIDTH == 7, DATA_WIDTH = 8:
			WORDS = 128		(depth of largest of RW and WW)
			RW = 4
			WW = 8
			
			-> Read : 256x4	-> 
			-> Write: 128x8	-> 
	*/
	wire [(DATA_WIDTH/2 -1):0] infer_mixed_width_ram_q;
	infer_mixed_width_ram #(.WORDS(2**(ADDR_WIDTH-1)), .RW(DATA_WIDTH/2),.WW(DATA_WIDTH)) inst07 (
		.we(we_a), 
		.clk(clk_a),
		.waddr(addr_a[ADDR_WIDTH-2:0]), 
		.wdata(data_in_a), 
		.raddr(addr_b), 
		.q(infer_mixed_width_ram_q)
	);
	assign data_out_a_07 = {infer_mixed_width_ram_q, infer_mixed_width_ram_q};
`endif

`ifdef BIDIR_DUAL_PORT
	//A4Kx2_B8Kx1
	infer_mixed_width_true_dual_port_ram #(.DATA_WIDTH1(DATA_WIDTH), .ADDRESS_WIDTH1(ADDR_WIDTH), .ADDRESS_WIDTH2(ADDR_WIDTH/2)) inst08 (
		.addr1(addr_a),
		.addr2(addr_b),
		.data_in1(data_in_a), 
		.data_in2(data_in_b), 
		.we1(we_a), 
		.we2(we_b), 
		.clk(clk_a),
		.data_out1(data_out_a_08),
		.data_out2(data_out_b_08)
	);
	
	infer_mixed_width_true_dual_port_ram_new_rw #(.DATA_WIDTH1(DATA_WIDTH), .ADDRESS_WIDTH1(ADDR_WIDTH), .ADDRESS_WIDTH2(ADDR_WIDTH/2)) inst09 (
		.addr1(addr_a),
		.addr2(addr_b),
		.data_in1(data_in_a), 
		.data_in2(data_in_b), 
		.we1(we_a), 
		.we2(we_b), 
		.clk(clk_a),
		.data_out1(data_out_a_09),
		.data_out2(data_out_b_09)
	);	
`endif
`endif

`ifdef DUAL_PORT
	infer_byte_enabled_simple_dual_port_ram #(.ADDR_WIDTH(ADDR_WIDTH), .BYTE_WIDTH(DATA_WIDTH),	.BYTES(2**DATA_WIDTH-1)) inst10 ( 
		.waddr(addr_a),
		.raddr(addr_b),
		.be(1),
		.wdata(data_in_a), 
		.we(we_a), 
		.clk(clk_a),
		.q(data_out_a_10)
	);
`endif

`ifdef BIDIR_DUAL_PORT	
	infer_byte_enabled_true_dual_port_ram #(.ADDRESS_WIDTH(ADDR_WIDTH), .BYTE_WIDTH(DATA_WIDTH),	.BYTES(2**DATA_WIDTH-1)) inst11 ( 
		.addr1(addr_a),
		.addr2(addr_b),
		.be1(1),
		.be2(1),
		.data_in1(data_in_a), 
		.data_in2(data_in_b), 
		.we1(we_a), 
		.we2(we_b), 
		.clk(clk_a),
		.data_out1(data_out_a_11),
		.data_out2(data_out_b_11)
	);
`endif
`ifdef MLAB
	infer_single_port_ram_MLAB #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) inst12 (
		.data(data_in_a),
		.addr(addr_a),
		.we(we_a),
		.clk(clk_a),
		.q(data_out_a_12)
	);
	
	infer_async_ram_MLAB #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) inst13 (
		 .addr(addr_a),
		 .data_in(data_in_a),
		 .clk(clk_a),
		 .write(we_a),
		 .data_out(data_out_a_13)
	);
`endif


`ifdef BIG_RAM
`ifdef DUAL_PORT

	infer_simple_dual_port_ram_dual_clock #(.DATA_WIDTH(9), .ADDR_WIDTH(14)) inst14(
			.data(data_in_a),
			.read_addr({addr_a,addr_a}), 
			.write_addr({addr_b,addr_b}),
			.we(we_a), 
			.read_clock(clk_a),
			.write_clock(clk_b),
			.q(data_out_a_14)
		);
`endif
`ifdef SINGLE_PORT
	infer_single_port_ram_M144K #(.DATA_WIDTH(9), .ADDR_WIDTH(14)) inst15 (
			.data(data_in_a),
			.addr({addr_a,addr_a}),
			.we(we_a),
			.clk(clk_a),
			.q(data_out_a_15)
		);
`endif
`endif
	/* Output select mux */
	always@(*) begin
		case(sel)
		4'b0000: begin
			data_out_a <= data_out_a_00;
			data_out_b <= 0;
		end
		4'b0001: begin
			data_out_a <= data_out_a_01;
			data_out_b <= 0;
		end
		4'b0010: begin
			data_out_a <= data_out_a_02;
			data_out_b <= 0;
		end
		4'b0011: begin
			data_out_a <= data_out_a_03;
			data_out_b <= data_out_b_03;
		end
		4'b0100: begin
			data_out_a <= data_out_a_04;
			data_out_b <= data_out_b_04;
		end
		
		4'b0101: begin
			data_out_a <= data_out_a_05;
			data_out_b <= 0;
		end
		4'b0110: begin
			data_out_a <= data_out_a_06;
			data_out_b <= data_out_b_06;		
		end
		4'b0111: begin
			data_out_a <= data_out_a_07;
			data_out_b <= 0;
		end
		4'b1000: begin
			data_out_a <= data_out_a_08;
			data_out_b <= data_out_b_08;
		end
		4'b1001: begin
			data_out_a <= data_out_a_09;
			data_out_b <= data_out_b_09;
		end
		4'b1010: begin
			data_out_a <= data_out_a_10;
			data_out_b <= 0;
		end
		4'b1011: begin
			data_out_a <= data_out_a_11;
			data_out_b <= data_out_b_11;
		end
		4'b1100: begin
			data_out_a <= data_out_a_12;
			data_out_b <= 0;
		end
		4'b1101: begin
			data_out_a <= data_out_a_13;
			data_out_b <= 0;
		end
		4'b1110: begin
			data_out_a <= data_out_a_14;
			data_out_b <= 0;
		end
		4'b1111: begin
			data_out_a <= data_out_a_15;
			data_out_b <= 0;
		end
		
		default: begin
			data_out_a <= 0;
			data_out_b <= 0;
		end
		endcase

	end
	
endmodule	

/*	
genvar i,j;
generate for(i = 1; i < 72; i = i*2) begin: GEN_LOOP_WIDTH

	for(j = 1; j <= 14; j = j + 2) begin: GEN_LOOP_DEPTH
		infer_single_port_ram #(.DATA_WIDTH(i), .ADDR_WIDTH(j)) inst(
				.data(),
				.addr(),
				.we(we),
				.clk(clk),
				.q()
			);
	end
	
end
endgenerate
	*/
	


/*
module generate_labels(input [1:0] a, b, output [1:0] o1, o2);
genvar i;

generate for(i = 0; i < 2; i = i + 1) begin: GEN_LOOP
	case(i)
		0: begin : GEN_CASE0
		wire q = a[0] & b[0];
		assign o1[0] = q;
		end
		1: begin : GEN_CASE1
		wire q = a[1] & b[1];
		assign o1[1] = q;
		end
	endcase
end
endgenerate
// access objects defined inside the genrate loop by using their hierarchical name
assign 	 o2[0] = GEN_LOOP[0].GEN_CASE0.q;
assign 	 o2[1] = GEN_LOOP[1].GEN_CASE1.q;
   
endmodule


module generate_design #(parameter N = 4) (input a, b, output [N * (N + 1) / 2 - 1 : 0] o);

genvar i, j;
generate for(i = 0; i < N; i = i + 1) begin: GEN_LOOP
	// Width of q on each iteration depends on genvar i
	(* keep = 1*) reg [i:0] q;

	if(i % 2 == 0) begin: GEN_TRUE
		always@* q[i:0] = {i+1{a}};
	end
	else begin : GEN_FALSE
		always@* q[i:0] = {i+1{b}};
	end
end
endgenerate

generate for(j = 0; j < N; j = j + 1) begin : GEN_LOOP2

	assign o[j + j * (j + 1) / 2 : 0 + j * (j + 1) / 2] = GEN_LOOP[j].q[j:0];
end
endgenerate
endmodule
*/