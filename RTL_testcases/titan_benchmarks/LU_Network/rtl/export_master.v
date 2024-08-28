module export_master #
(
	parameter DWIDTH = 256,
	parameter AWIDTH_S = 25,
	parameter AWIDTH_M = 30,
	parameter BYTEWIDTH = 32,
	parameter BURSTWIDTH = 5
)
(
	input clk,
	input reset,
	
	input [AWIDTH_S-1:0] s_address,
	input [BYTEWIDTH-1:0] s_byteenable,
	input [BURSTWIDTH-1:0] s_burstcount,
	input s_write,
	input [DWIDTH-1:0] s_writedata,
	input s_read,
	output [DWIDTH-1:0] s_readdata,
	output s_readdatavalid,
	output s_waitrequest,
	input s_burstbegin,
	
	output [AWIDTH_M-1:0] m_address,
	output [BYTEWIDTH-1:0] m_byteenable,
	output [BURSTWIDTH-1:0] m_burstcount,
	output m_write,
	output [DWIDTH-1:0] m_writedata,
	output m_read,
	input [DWIDTH-1:0] m_readdata,
	input m_readdatavalid,
	input m_waitrequest,
	output m_burstbegin
);

assign m_address = {s_address, {(AWIDTH_M-AWIDTH_S){1'b0}}};
assign m_byteenable = s_byteenable;
assign m_burstcount = s_burstcount;
assign m_write = s_write;
assign m_writedata = s_writedata;
assign m_read = s_read;
assign s_readdata = m_readdata;
assign s_readdatavalid = m_readdatavalid;
assign s_waitrequest = m_waitrequest;
assign m_burstbegin = s_burstbegin;

endmodule

	