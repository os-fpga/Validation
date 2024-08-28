module varLoader(	

	//////////// CLOCK ////////////
	input bit clk,
	input bit resetn,

	//////////// Interfaces ////////////
	input structs::struct_varLoader_control_in vlc_in,
	output structs::struct_varLoader_control_out vlc_out,	
	input structs::struct_integralImageCache_Read_Out icr_out,
	output structs::struct_integralImageCache_Read_In icr_in,
	input structs::struct_SQImageCache_Read_Out sqcr_out,
	output structs::struct_SQImageCache_Read_In sqcr_in,
	
	output structs::struct_varianceCache_Write vcwOut[globalDefinitions::cores-1:0]
		
);

	// import local parameters
	import pkg_varLoader::*;
	
	// local pipline latencies
	localparam int WE_LATENCY = 2;
	localparam int CURWINDOW_LATENCY = 3;
	
	// address to send to integral/sqIntegral image when asking for variance data
	logic unsigned [INTEGRAL_BLOCK_COUNTER_WIDTH-1:0] varBlockAddr;
	logic unsigned [1:0] varElement;
	logic unsigned [INTEGRAL_Y_COUNTER_WIDTH-1:0] varYAddr,varYAddr1;
	logic unsigned [INTEGRAL_X_COUNTER_WIDTH-1:0] varXAddr,varXAddr1;
	
	// relitive address sent to groups of window caches from muliple cores
	logic unsigned [1:0] varAddr,varAddr1;
	logic unsigned [WE_LATENCY - 1:0] weVarLat;
	logic unsigned [CURWINDOW_LATENCY - 1:0][15:0] curWindow;	
	
	// registers for the the real start position when the module begins operation
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] localStartY;
	logic unsigned [pkg_integralImageCache::integralRowBits-1:0] localStartX;
  logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] localStartBlock;
	logic unsigned [pkg_windowCache::windowBits-1:0] localWinSize;

  logic dblBuf;
  
	//define states variables
	STATES_t NextState,CurState;
	
	// update states
	always_ff @(posedge clk) begin
		CurState <= NextState;       
	end	
	
	
	//// ---- direct assignments---- ////
	
	// assign memory address outputs
	assign icr_in.raddrY = varYAddr ;
	assign icr_in.raddrXBlock = varBlockAddr;	
	assign sqcr_in.raddrY = varYAddr;
	assign sqcr_in.raddrXBlock = varBlockAddr;

	// update block control signals about process of hardware
	assign vlc_out.done = (CurState == S_Done);	
	assign vlc_out.ready = (CurState == S_Ready);	
			
	
	//// ---- Combinational Logic ---- ////		
	always_comb begin		
		// calulate real block address from virtual X coordinate
		varBlockAddr = varXAddr/WINDOW_BLOCKING;
		
		// calulate which element of the data block was the actual data requested
		varElement <= varXAddr1%WINDOW_BLOCKING;		
	end
	
	
	
	//// ---- Registered Logic ---- ////
	always_ff @ (posedge clk) begin    

		
		// these states represent the need to write out data WE_LATENCY cycles later, thus write into chained regiters pipline to create that delay
		weVarLat[0] <= (CurState == S_StartVarA || CurState == S_StartVarB || CurState == S_StartVarC || CurState == S_StartVarD);
		
		// chain the variance WE registers together
		for(int i = 1 ; i < WE_LATENCY; i++)weVarLat[i] <= weVarLat[i-1];
		
		// register chain for which window is being loaded with variance data
		for(int i = 1 ; i < CURWINDOW_LATENCY; i++) curWindow[i] <= curWindow[i-1];
		
		varXAddr1 <= varXAddr;
		varYAddr1 <= varYAddr;
		varAddr1 <= varAddr;

	end
	

	//// ---- state transition table ---- ////
	always_comb begin
		if(~resetn) begin
			NextState = S_Reset;
		end else begin
			case(CurState)
				
				// initilize
				S_Reset				: NextState = S_Ready;
				S_Ready				: NextState = vlc_in.start ? S_StoreLocal : S_Ready;
				S_StoreLocal		: NextState = S_StartVarA;
				
				// varince constants first - to start normilization calulation
				S_StartVarA			: NextState = S_StartVarB;				
				S_StartVarB			: NextState = S_StartVarC;			
				S_StartVarC			: NextState = S_StartVarD;				
				S_StartVarD			: NextState = (curWindow[0] == (globalDefinitions::cores-1)) ? S_EmptyVar : S_StartVarA;				
				S_EmptyVar			: NextState = S_Done;
		
				S_Done				: NextState = vlc_in.ack ? S_Reset : S_Done;
				default        	: NextState = S_Reset;
				
			endcase		
		end
	end 
	
	
	//// ---- state action table ---- ////
	always_ff @ (posedge clk) begin	
		if(CurState == S_Reset)
			resetSignals();
		else
			case(CurState)
				S_Ready	:	begin
				              if(vlc_in.start) begin
											 localStartY <= vlc_in.startY + 1;
											 localStartX <= (vlc_in.startBlock * WINDOW_BLOCKING) + 1;								
											 localWinSize <= vlc_in.winSize;
											 dblBuf <= vlc_in.dblBuf;
											end
										end
				S_StartVarA 	: 	begin
											varYAddr <= localStartY;
											varXAddr <= localStartX + curWindow[0];
											varAddr <= 0;											
										end
				S_StartVarB 	: 	begin
											varYAddr <= localStartY;
											varXAddr <= localStartX + localWinSize - 2 + curWindow[0];
											varAddr <= 1;	
										end
				S_StartVarC 	: 	begin
											varYAddr <= localStartY + localWinSize - 2;
											varXAddr <= localStartX + curWindow[0];
											varAddr <= 2;	
										end										
				S_StartVarD 	: 	begin
											varYAddr <= localStartY + localWinSize - 2;
											varXAddr <= localStartX + localWinSize - 2 + curWindow[0];
											varAddr <= 3;
											curWindow[0] <= curWindow[0] + 1;											
										end
				default : ;
			endcase
	end
	
	
	//// ---- instantiate and connect modules ---- ////
	
	// write data to each of the cores variance caches
	genvar i;
	generate	
		for(i = 0 ; i < CORES ; i++) begin : varLoop			
			always_ff @(posedge clk) begin			
				vcwOut[i].waddr <= varAddr1;			
				vcwOut[i].waddrSQ <= varAddr1;				
				if(curWindow[CURWINDOW_LATENCY - 1] == i) begin
					vcwOut[i].we <= weVarLat[WE_LATENCY - 1];
					vcwOut[i].weSQ <= weVarLat[WE_LATENCY - 1];		
				end else begin
					vcwOut[i].we <= 0;
					vcwOut[i].weSQ <= 0;			
				end	
				
				vcwOut[i].wdata <= icr_out.q[varElement];
        vcwOut[i].wdataSQ <= sqcr_out.q[varElement];
        vcwOut[i].dblBuf <= dblBuf;		
							
			end
			
			// select the proper data element from the block
			always_comb begin				

			end
		end
	endgenerate



	// reset all signals
	task resetSignals();  	  	 

		varYAddr <= 0;		
		curWindow[0] <= 0;
		localStartY <= 0;
		localStartBlock <=0;
		localStartX	<= 0;	
		localWinSize <= 0;
	
	endtask
	
endmodule : varLoader