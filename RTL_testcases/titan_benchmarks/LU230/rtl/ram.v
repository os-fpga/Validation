// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module ram (
	byteena_a,
	clock,
	data,
	rdaddress,
	wraddress,
	wren,
	q);

	parameter RAMWIDTH = 7360, RAMNUMBYTES = 920, RAMSIZE = 256, RAMSIZEWIDTH = 8;

	input	[RAMNUMBYTES-1:0]  byteena_a;
	input	  clock;
	input	[RAMWIDTH-1:0]  data;
	input	[RAMSIZEWIDTH-1:0]  rdaddress;
	input	[RAMSIZEWIDTH-1:0]  wraddress;
	input	  wren;
	output	[RAMWIDTH-1:0]  q;

	wire [RAMWIDTH-1:0] sub_wire0;
	wire [RAMWIDTH-1:0] q = sub_wire0[RAMWIDTH-1:0];

	altsyncram	altsyncram_component (
				.wren_a (wren),
				.clock0 (clock),
				.byteena_a (byteena_a),
				.address_a (wraddress),
				.address_b (rdaddress),
				.data_a (data),
				.q_b (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_b ({RAMWIDTH{1'b1}}),
				.eccstatus (),
				.q_a (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_b = "NONE",
		altsyncram_component.address_reg_b = "CLOCK0",
		altsyncram_component.byte_size = 8,
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.intended_device_family = "Stratix III",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = RAMSIZE,
		altsyncram_component.numwords_b = RAMSIZE,
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_b = "CLOCK0",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
		altsyncram_component.widthad_a = RAMSIZEWIDTH,
		altsyncram_component.widthad_b = RAMSIZEWIDTH,
		altsyncram_component.width_a = RAMWIDTH,
		altsyncram_component.width_b = RAMWIDTH,
		altsyncram_component.width_byteena_a = RAMNUMBYTES;


endmodule
