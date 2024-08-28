module ports2avalon #
(
	parameter ADDRESS_WIDTH  = 32
)
(
	// Avalon master interface
	input							clk,
	input 							reset_n,
	output reg	[ADDRESS_WIDTH-1:0]	address,
	output reg						read,
	input		[31:0]				readdata,
	output reg						write,
	output reg	[31:0]				writedata,
	input							waitrequest,
	
	// Interface to portmux
	input 		[31:0] 				usb_address,
	output reg 						usb_address_want,
	input 							usb_address_ready,
	input 		[31:0] 				usb_writedata,
	output reg 						usb_writedata_want,
	input 							usb_writedata_ready,
	output reg 	[31:0] 				usb_readdata,
	input 							usb_readdata_want,
	output reg 						usb_readdata_ready
);

	
reg address_load;
reg address_incr;
always @ (posedge clk or negedge reset_n) begin
	if (!reset_n) address <= 'dx;
	else if (address_load) address <= usb_address;
	else if (address_incr) address <= address + 32'd4;
end


always @* begin
	// Address port control
	usb_address_want <= 1'b1;
	address_load <= usb_address_ready;
	address_incr <= (read | write) & !waitrequest;
	
	// Writes
	usb_writedata_want <= !waitrequest;
	writedata <= usb_writedata;
	write <= usb_writedata_ready;
	
	// Reads
	read <= usb_readdata_want;
	usb_readdata <= readdata;
	usb_readdata_ready <= read & !waitrequest;
end

endmodule
