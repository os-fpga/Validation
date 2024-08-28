module ISP1761_IF
(	
	input				s_cs_n,
	input   [17:0]     	s_address,
	input				s_write_n,
	input	[31:0]		s_writedata,
	input			    s_read_n,
	output	[31:0]		s_readdata,
	output 		   		s_irq,
	input 				s_reset_n,
					
	output				CS_N,
	output				WR_N,
	output				RD_N,
	inout 	[31:0]		D,
	output	[17:1]		A,
	input               DC_IRQ,
	input               HC_IRQ,
	input               DC_DREQ,
	input               HC_DREQ,
	output              DC_DACK,
	output              HC_DACK,
	output				RESET_N
);

assign CS_N = s_cs_n;
assign WR_N = s_write_n;
assign RD_N = s_read_n;
assign RESET_N = s_reset_n;
assign A = s_address[17:1];
assign s_irq =  DC_IRQ;
assign DC_DACK = 1'b1;
assign HC_DACK = 1'b1;

assign D		  =	(!s_cs_n & s_read_n) ? s_writedata : 32'hzzzzzzzz;
assign s_readdata = D;

endmodule

