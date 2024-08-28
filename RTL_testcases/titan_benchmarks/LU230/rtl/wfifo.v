// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module wfifo (
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	wrempty,
	wrusedw);

	parameter FIFOINPUTWIDTH = 8192, FIFOSIZE = 16, FIFOSIZEWIDTH = 4;
	parameter FIFOOUTPUTWIDTH = 128, FIFORSIZEWIDTH = 10;

	input	[FIFOINPUTWIDTH-1:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[FIFOOUTPUTWIDTH-1:0]  q;
	output	  wrempty;
	output	[FIFOSIZEWIDTH-1:0]  wrusedw;

	wire [FIFOSIZEWIDTH-1:0] sub_wire0;
	wire  sub_wire1;
	wire [FIFOOUTPUTWIDTH-1:0] sub_wire2;
	wire [FIFOSIZEWIDTH-1:0] wrusedw = sub_wire0[FIFOSIZEWIDTH-1:0];
	wire  wrempty = sub_wire1;
	wire [FIFOOUTPUTWIDTH-1:0] q = sub_wire2[FIFOOUTPUTWIDTH-1:0];

	dcfifo_mixed_widths	dcfifo_mixed_widths_component (
				.wrclk (wrclk),
				.rdreq (rdreq),
				.rdclk (rdclk),
				.wrreq (wrreq),
				.data (data),
				.wrusedw (sub_wire0),
				.wrempty (sub_wire1),
				.q (sub_wire2)
				// synopsys translate_off
				,
				.aclr (),
				.rdempty (),
				.rdfull (),
				.rdusedw (),
				.wrfull()
				// synopsys translate_on
				);
	defparam
		dcfifo_mixed_widths_component.intended_device_family = "Stratix III",
		dcfifo_mixed_widths_component.lpm_numwords = FIFOSIZE,
		dcfifo_mixed_widths_component.lpm_showahead = "OFF",
		dcfifo_mixed_widths_component.lpm_type = "dcfifo",
		dcfifo_mixed_widths_component.lpm_width = FIFOINPUTWIDTH,
		dcfifo_mixed_widths_component.lpm_widthu = FIFOSIZEWIDTH,
		dcfifo_mixed_widths_component.lpm_widthu_r = FIFORSIZEWIDTH,
		dcfifo_mixed_widths_component.lpm_width_r = FIFOOUTPUTWIDTH,
		dcfifo_mixed_widths_component.overflow_checking = "OFF",
		dcfifo_mixed_widths_component.rdsync_delaypipe = 5,
		dcfifo_mixed_widths_component.underflow_checking = "OFF",
		dcfifo_mixed_widths_component.use_eab = "ON",
		dcfifo_mixed_widths_component.wrsync_delaypipe = 5;


endmodule
