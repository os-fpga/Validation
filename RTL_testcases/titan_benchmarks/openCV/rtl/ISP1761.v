// ISP1761.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module ISP1761 (
		output wire        CS_N,        //                usb.export
		output wire        WR_N,        //                   .export
		output wire        RD_N,        //                   .export
		inout  wire [31:0] D,           //                   .export
		output wire [16:0] A,           //                   .export
		input  wire        DC_IRQ,      //                   .export
		input  wire        DC_DREQ,     //                   .export
		input  wire        HC_DREQ,     //                   .export
		output wire        DC_DACK,     //                   .export
		output wire        HC_DACK,     //                   .export
		input  wire        HC_IRQ,      //                   .export
		output wire        RESET_N,     //                   .export
		input  wire [17:0] s_address,   //              slave.address
		input  wire        s_write_n,   //                   .write_n
		input  wire [31:0] s_writedata, //                   .writedata
		input  wire        s_read_n,    //                   .read_n
		output wire [31:0] s_readdata,  //                   .readdata
		input  wire        s_cs_n,      //                   .chipselect_n
		output wire        s_irq,       //          slave_irq.irq
		input  wire        s_reset_n    // global_clock_reset.reset_n
	);

	ISP1761_IF isp1761 (
		.CS_N        (CS_N),        //                usb.export
		.WR_N        (WR_N),        //                   .export
		.RD_N        (RD_N),        //                   .export
		.D           (D),           //                   .export
		.A           (A),           //                   .export
		.DC_IRQ      (DC_IRQ),      //                   .export
		.DC_DREQ     (DC_DREQ),     //                   .export
		.HC_DREQ     (HC_DREQ),     //                   .export
		.DC_DACK     (DC_DACK),     //                   .export
		.HC_DACK     (HC_DACK),     //                   .export
		.HC_IRQ      (HC_IRQ),      //                   .export
		.RESET_N     (RESET_N),     //                   .export
		.s_address   (s_address),   //              slave.address
		.s_write_n   (s_write_n),   //                   .write_n
		.s_writedata (s_writedata), //                   .writedata
		.s_read_n    (s_read_n),    //                   .read_n
		.s_readdata  (s_readdata),  //                   .readdata
		.s_cs_n      (s_cs_n),      //                   .chipselect_n
		.s_irq       (s_irq),       //          slave_irq.irq
		.s_reset_n   (s_reset_n)    // global_clock_reset.reset_n
	);

endmodule
