module simpleArray2DFill #(	 

	parameter int ADDR_WIDTH = 1,		  
	parameter int ROW_WIDTH	= 1,
	parameter int COL_WIDTH = 1,
	parameter int WORD_SIZE = 1
	
)( 
	//////////// CLOCK //////////
	input bit clk,
	input bit resetn,
	
	//////////// Ports Signals //////////
	output bit data_wanted,
	input bit data_ready,
	input logic [32-1:0] data, 	

	//////////// Data Signals //////////
	output logic we,
	output logic [WORD_SIZE - 1:0] q,
	output logic unsigned [ROW_WIDTH-1:0] waddrX,
	output logic unsigned [COL_WIDTH-1:0] waddrY,
	output logic loaded
);
	

// state names	
typedef enum logic [3:0]{ 
	S_Reset, 
	S_ReadWidth,
	S_ReadHeight,
  S_ReadData,
	S_Idle } STATES_t; 
	
// state variables
STATES_t NextState,CurState;
	
// internal logic
logic [ROW_WIDTH-1:0] sizeWidth;
logic [COL_WIDTH-1:0] sizeHeight;

always_ff @ (posedge clk) begin
	CurState <= NextState;
end

// state transition table
always_comb begin
	if(!resetn) begin
		NextState <= S_Reset;
	end else begin
		case(CurState)
			S_Reset 		: NextState <= S_ReadWidth;
			S_ReadWidth : NextState <= data_ready ? S_ReadHeight : S_ReadWidth;
			S_ReadHeight: NextState <= data_ready ? S_ReadData : S_ReadHeight;
			S_ReadData 	: NextState <=  loaded ? S_Idle : S_ReadData;
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
			S_ReadWidth : 	if(data_ready) sizeWidth <= data;
			S_ReadHeight: 	if(data_ready) sizeHeight <= data;
			S_ReadData 	:	begin
									   if(data_ready) begin
										  if( (waddrX + 1) < sizeWidth) begin
										    waddrX <= waddrX + 1;										  
										  end else begin
										    waddrX <= 0;
                        waddrY <= waddrY+1;
                        if(waddrY+1 == sizeHeight) loaded <= 1;										  
										  end 
									   end
								    end
		endcase
end

	 
assign q = data;
assign data_wanted = (CurState == S_ReadWidth) || (CurState == S_ReadHeight) || (CurState == S_ReadData);
assign we = data_ready && (CurState == S_ReadData);
	
task resetSignals();
	waddrY <= 0;
	waddrX <= 0;
	sizeWidth <= 0;
	sizeHeight <= 0;
	loaded <= 0;
endtask

endmodule : simpleArray2DFill