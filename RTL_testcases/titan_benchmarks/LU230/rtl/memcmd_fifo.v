// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module memcmd_fifo (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	wrempty,
	wrfull);
	
	parameter FIFOSIZE = 16, FIFOSIZEWIDTH = 4, FIFOWIDTH = 28;

	input	  aclr;
	input	[FIFOWIDTH-1:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[FIFOWIDTH-1:0]  q;
	output	  rdempty;
	output	  wrempty;
	output	  wrfull;

	wire  sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [FIFOWIDTH-1:0] sub_wire3;
	wire  rdempty = sub_wire0;
	wire  wrfull = sub_wire1;
	wire  wrempty = sub_wire2;
	wire [FIFOWIDTH-1:0] q = sub_wire3[FIFOWIDTH-1:0];

	dcfifo	dcfifo_component (
				.wrclk (wrclk),
				.rdreq (rdreq),
				.aclr (alcr),
				.rdclk (rdclk),
				.wrreq (wrreq),
				.data (data),
				.rdempty (sub_wire0),
				.wrfull (sub_wire1),
				.wrempty (sub_wire2),
				.q (sub_wire3)
				// synopsys translate_off
				,
				.rdfull (),
				.rdusedw (),
				.wrusedw ()
				// synopsys translate_on
				);
	defparam
		dcfifo_component.intended_device_family = "Stratix III",
		dcfifo_component.lpm_numwords = FIFOSIZE,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = FIFOWIDTH,
		dcfifo_component.lpm_widthu = FIFOSIZEWIDTH,
		dcfifo_component.overflow_checking = "OFF",
		dcfifo_component.rdsync_delaypipe = 5,
		dcfifo_component.underflow_checking = "OFF",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 5;


endmodule
