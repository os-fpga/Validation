// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module addr_fifo (
	clock,
	data,
	rdreq,
	wrreq,
	empty,
	full,
	q);

	parameter FIFOSIZE = 16, FIFOSIZEWIDTH = 4, FIFOWIDTH = 8;

	input	  clock;
	input	[FIFOWIDTH-1:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[FIFOWIDTH-1:0]  q;

	wire  sub_wire0;
	wire [FIFOWIDTH-1:0] sub_wire1;
	wire  sub_wire2;
	wire  empty = sub_wire0;
	wire [FIFOWIDTH-1:0] q = sub_wire1[FIFOWIDTH-1:0];
	wire  full = sub_wire2;

	scfifo	scfifo_component (
				.rdreq (rdreq),
				.clock (clock),
				.wrreq (wrreq),
				.data (data),
				.empty (sub_wire0),
				.q (sub_wire1),
				.full (sub_wire2)
				// synopsys translate_off
				,
				.aclr (),
				.almost_empty (),
				.almost_full (),
				.sclr (),
				.usedw ()
				// synopsys translate_on
				);
	defparam
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.intended_device_family = "Stratix III",
		scfifo_component.lpm_numwords = FIFOSIZE,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = FIFOWIDTH,
		scfifo_component.lpm_widthu = FIFOSIZEWIDTH,
		scfifo_component.overflow_checking = "OFF",
		scfifo_component.underflow_checking = "OFF",
		scfifo_component.use_eab = "ON";


endmodule
