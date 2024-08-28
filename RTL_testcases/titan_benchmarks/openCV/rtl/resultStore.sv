module resultStore (

	//////////// CLOCK //////////////////
	input bit clk,
	input bit resetn,
	
	//////////// Interfaces //////////////
	output structs::struct_resultQueue_Write_In rqw_in ,
	input structs::struct_resultQueue_Write_Out rqw_out,
	
	input structs::struct_resultStore_control_in rsc_in ,
  output structs::struct_resultStore_control_out rsc_out,
	
	input structs::struct_processor_Result_Out pr_out [globalDefinitions::cores - 1 : 0],
	output structs::struct_processor_Result_In pr_in [globalDefinitions::cores - 1 : 0]
);


import pkg_resultStore::*;



genvar idx;

logic passfail[CORES-1:0];	
logic [pkg_integralImageCache::integralRowBits-1:0] x;	
logic [pkg_integralImageCache::integralColBits-1:0] y;	
logic [globalDefinitions::scaleBits-1:0] scale;
bit exit;


logic [CORE_COUNTER_WIDTH-1:0] coreCounter;
logic exitdone;
logic populateDone;
logic valid;

//define states variables
STATES_t NextState,CurState;

// update states
always_ff @(posedge clk) begin
	CurState <= NextState;       
end


//// ---- direct assignments---- ////
assign populateDone = (coreCounter == CORES-1);

//// ---- state independant logic---- ////
always_comb begin
	rsc_out.ready <= (CurState == S_Ready);
	
	for(int idx = 0 ; idx < CORES ; idx++) begin
      if(idx==0) valid =  pr_out[idx].valid;
      else valid = valid & pr_out[idx].valid;
  end	
	
	for(int idx = 0 ; idx < CORES ; idx++) begin
		pr_in[idx].taken <=  (CurState == S_StoreLocal) && valid;
	end		
		
end

		


//// ---- state transition table ---- ////
	always_comb begin
		if(~resetn) begin
			NextState = S_Reset;
			
		end else begin
			case(CurState)
				S_Reset				: NextState = S_Ready;
				S_Ready				: NextState =  rsc_in.start ? (rsc_in.exit ? S_Exit : S_StoreLocal) : S_Ready;
				S_StoreLocal		: NextState = valid ? S_PopulateFIFO : S_StoreLocal;
				S_PopulateFIFO 	: NextState = populateDone ? S_Ready : S_PopulateFIFO;  
				S_Exit				: NextState = exitdone ? S_Ready : S_Exit; 
				default        	: NextState = S_Reset;
			endcase		
		end
	end 
	
//// ---- state action table ---- ////
	always_ff @ (posedge clk) begin	
		if(CurState == S_Reset) begin
			coreCounter <= 0;
			rqw_in.we <= 0;
			rqw_in.data <= 0;
			for(int idx = 0 ; idx < CORES ; idx++) passfail[idx] <=0;	
			x<=0;		
			y<=0;		
			scale<=0;	
		end else begin
			case(CurState)
				S_Ready	: begin
				           rqw_in.we<=0; 
				            if(rsc_in.start) begin
				              coreCounter <= 0;
				              scale <= rsc_in.scale;
				              x <= rsc_in.startX;
				              y <= rsc_in.startY;	
								  exit <= rsc_in.exit;
								  exitdone <= 0;
				            end			
				          end			           
				S_StoreLocal : begin		
				                if(valid) begin
				                  for(int idx = 0 ; idx < CORES ; idx++) passfail[idx] <= pr_out[idx].passfail;
				                end				                
				               end
				S_PopulateFIFO	: 	begin
											if(!rqw_out.full) begin
												coreCounter <= coreCounter + 1;
												if(passfail[coreCounter]) begin
													rqw_in.we <= 1;
													rqw_in.data <= {(x+coreCounter),y,scale};
												end else rqw_in.we<=0;
											end else rqw_in.we<=0;
										end
				S_Exit : 
					begin
						if(!rqw_out.full) begin
						  if(exitdone == 0) begin
						    exitdone <= 1;
                rqw_in.we <= 1;
                //rqw_in.data <= {(x),y,scale};		
					 rqw_in.data <= 32'hffffffff;
						  end else rqw_in.we<=0;
						end else rqw_in.we<=0;
						
						 
					end
				default : ;
			endcase
		end
	end

endmodule : resultStore