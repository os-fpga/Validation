// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module rfifo (
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty);

	parameter FIFOINPUTWIDTH = 128, FIFOSIZE = 1024, FIFOSIZEWIDTH = 10;
	parameter FIFOOUTPUTWIDTH = 8192, FIFORSIZEWIDTH = 4;

	input	[FIFOINPUTWIDTH-1:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[FIFOOUTPUTWIDTH-1:0]  q;
	output	  rdempty;

	wire  sub_wire0;
	wire [FIFOOUTPUTWIDTH-1:0] sub_wire1;
	wire  rdempty = sub_wire0;
	wire [FIFOOUTPUTWIDTH-1:0] q = sub_wire1[FIFOOUTPUTWIDTH-1:0];

	dcfifo_mixed_widths	dcfifo_mixed_widths_component (
				.wrclk (wrclk),
				.rdreq (rdreq),
				.rdclk (rdclk),
				.wrreq (wrreq),
				.data (data),
				.rdempty (sub_wire0),
				.q (sub_wire1)
				// synopsys translate_off
				,
				.aclr (),
				.rdfull (),
				.rdusedw (),
				.wrempty (),
				.wrfull (),
				.wrusedw ()
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
