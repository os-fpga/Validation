module simpleArrayFill #( 
	parameter int ADDR_WIDTH = 1,
	parameter int WORD_SIZE = 1,
	parameter int DATA_SIZE = (WORD_SIZE > ADDR_WIDTH) ? WORD_SIZE : ADDR_WIDTH	
)( 

	//////////// CLOCK //////////
	input bit clk,
	input bit resetn,
	
	//////////// Ports Signals //////////
	input [DATA_SIZE-1:0] data, 	
	input  bit data_ready,
	output bit data_wanted,
	
	//////////// Data Signals //////////
	output logic we,
	output logic [WORD_SIZE - 1:0] q,
	output logic unsigned [ADDR_WIDTH-1:0] waddr,
	output logic loaded
	
);
	
	
// state names	
typedef enum logic [3:0]{ 
	S_Reset, 
	S_ReadSize,
  S_ReadData,
	S_Idle } STATES_t; 
	
// state variables
STATES_t NextState,CurState;
	
// internal logic
logic [ADDR_WIDTH-1:0] size;


always_ff @ (posedge clk) begin
	CurState <= NextState;
end

// state transition table
always_comb begin
	if(!resetn) begin
		NextState <= S_Reset;
	end else begin
		case(CurState)
			S_Reset 		: NextState <= S_ReadSize;
			S_ReadSize 	: NextState <= data_ready ? S_ReadData : S_ReadSize;
			S_ReadData 	: NextState <= (waddr >= size) ? S_Reset : S_ReadData;
			default		: NextState <= S_Reset;
		endcase
	end

end

// state action table
always_ff @ (posedge clk) begin

if(CurState == S_Reset)
	resetSignals();
else
	case(CurState)
		S_ReadSize 	: if(data_ready) size <= data;
		S_ReadData 	: 	begin
								if(data_ready) 
									waddr <= waddr + 1;
									if(waddr == size) loaded <= 1;								
							end
		default		: ;
	endcase
end
	 

assign q = data;
assign data_wanted = (CurState == S_ReadSize) || (CurState == S_ReadData);
assign we = data_ready && (CurState == S_ReadData);
		
	
task resetSignals();
	size<=0;
	loaded <=0;
	waddr <= 0;
endtask

endmodule : simpleArrayFill