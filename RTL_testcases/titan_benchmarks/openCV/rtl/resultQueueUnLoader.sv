module resultQueueUnLoader( 
	
	//////////// CLOCK //////////////
	input bit clk,
	input bit resetn,

	//////////// Ports Signals //////////////
	input bit data_wanted,
	output bit data_ready,		
	output [pkg_resultQueue::WIDTH-1:0] data, 

	//////////// Interfaces //////////////
	output structs::struct_resultQueue_Read_In rqr_in,
	input structs::struct_resultQueue_Read_Out rqr_out 
	
);
	

import pkg_resultQueue::*;

// state names	
typedef enum logic [3:0]{ 
	S_Reset,
	S_WaitForData,
	S_PopData,
	S_SendData} STATES_t; 
	
// state variables
STATES_t NextState,CurState;
	
always_ff @ (posedge clk) begin
	CurState <= NextState;
end

// state transition table
always_comb begin
	if(!resetn) begin
		NextState <= S_Reset;
	end else begin
		case(CurState)
			S_Reset 			: NextState <= S_WaitForData;
			S_WaitForData	: NextState <= rqr_out.empty ? S_WaitForData : S_PopData;
			S_PopData		: NextState <= S_SendData;
			S_SendData 		: NextState <= data_wanted ? S_WaitForData : S_SendData;
			default			: NextState <= S_Reset;
		endcase
	end
end

 
assign rqr_in.re = (CurState == S_PopData);
assign data_ready = (CurState == S_SendData);
assign data = rqr_out.q;

endmodule : resultQueueUnLoader


