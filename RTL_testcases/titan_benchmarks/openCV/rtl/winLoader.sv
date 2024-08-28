module winLoader(	

	//////////// CLOCK ////////////
	input bit clk,
	input bit resetn,
		
	//////////// Data Signals ////////////

	//////////// Interfaces ////////////
	
	input structs::struct_winLoader_control_in wlc_in,
	output structs::struct_winLoader_control_out wlc_out,
	input structs::struct_integralImageCache_Read_Out icr_out ,
	output structs::struct_integralImageCache_Read_In icr_in,
	output structs::struct_windowCache_Write wcwOut[globalDefinitions::cores-1:0]	
	
);



	localparam int WE_LATENCY = 1;
	localparam int CURWINDOW_LATENCY = 2;
	//localparam int PIPELINE_COUNTER_WIDTH = 4;
	

	// import local parameters
	import pkg_winLoader::*;
	
	
	// relitive address sent to groups of window caches from muliple cores
	logic unsigned [NUM_PROC_OFFSETS-1:0][WINDOW_Y_COUNTER_WIDTH-1:0] windowYAddr;
	logic unsigned [NUM_PROC_OFFSETS-1:0][WINDOW_BLOCK_COUNTER_WIDTH-1:0] windowBlockAddr;
	logic unsigned [(NUM_PROC_OFFSETS-1) + WE_LATENCY:0] we;
	
	// real rams address send out to memory
	logic unsigned [INTEGRAL_BLOCK_COUNTER_WIDTH-1:0] integralBlockAddr;
	logic unsigned [INTEGRAL_Y_COUNTER_WIDTH-1:0] integralYAddr;
	
	// registers for the the real start position when the module begins operation
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] localStartY;
	logic unsigned [pkg_integralImageCache::integralRowBits-1:0] localStartX;
  logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] localStartBlock;
	logic unsigned [pkg_windowCache::windowBits-1:0] localWinSize;
	
	// threholds to guide real and relitive address indexing
	logic unsigned [15:0] nextYThres;		
	logic unsigned [15:0] nextWindowBlockThres;
	logic unsigned [15:0] finishStreamYThres;
	logic unsigned [15:0] windowWEThres;
	
	// misc counters
	logic unsigned [15:0] nextYCounter;	
	logic unsigned [PROC_OFFSETS_BITS-1:0] varCounter; 
	logic unsigned [WINDOW_BLOCK_COUNTER_WIDTH-1:0] varCount;
	logic unsigned [15-1:0] emptyPipelineCounter;
	
	// misc control signals
	logic unsigned [WINDOW_BLOCK_COUNTER_WIDTH-1:0] blocksPerWindow;
	logic finishStream;
	logic finishPipe;
	logic dblBuf;
	
	//define states variables
	STATES_t NextState,CurState;
	
	// update states
	always_ff @(posedge clk) begin
		CurState <= NextState;       
	end
	
	

	
	//// ---- direct assignments---- ////
	
	// decide whether to use variance or window addresses
	assign icr_in.raddrY = integralYAddr;
	assign icr_in.raddrXBlock = integralBlockAddr;

	// update block control signals about process of hardware
	assign wlc_out.done = (CurState == S_Done);	
	assign wlc_out.ready = (CurState == S_Ready);
			
	//// ---- Combinational Logic ---- ////		
	always_comb begin		
	
	end
	
	//// ---- Registered Logic ---- ////
	always_ff @ (posedge clk) begin    
		
		// chain some delay registers together
		for(int i = 1 ; i < NUM_PROC_OFFSETS ; i++) begin
			windowYAddr[i] <= windowYAddr[i-1];
			windowBlockAddr[i] <= windowBlockAddr[i-1];
		end
		
		for(int i = 1 ; i < NUM_PROC_OFFSETS + WE_LATENCY ; i++) begin
			we[i] <= we[i-1];
		end	
		
		
		
		
	end
	

	//// ---- state transition table ---- ////
	always_comb begin
		if(~resetn) begin
			NextState = S_Reset;
		end else begin
			case(CurState)
				
				// initilize
				S_Reset				: NextState = S_Ready;
				S_Ready				: NextState = wlc_in.start ? S_StoreLocal : S_Ready;
				S_StoreLocal		: NextState = S_StartCount;
				
				// load the bulk of the window data in parellel to all avilible cores
				S_StartCount		: NextState = S_StreamData;
				S_StreamData		: NextState = finishStream ? S_EmptyPipeline : S_StreamData;
				S_EmptyPipeline	: NextState = finishPipe ? S_Done : S_EmptyPipeline;
				S_Done				: NextState = wlc_in.ack ? S_Reset : S_Done;
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
				              if(wlc_in.start) begin
											 localStartY <= wlc_in.startY + 1;
											 localStartX <= (wlc_in.startBlock * WINDOW_BLOCKING);
											 localStartBlock <= wlc_in.startBlock;											
											 localWinSize <= wlc_in.winSize;	
											 dblBuf <= wlc_in.dblBuf;
											 integralYAddr <= wlc_in.startY;
											 integralBlockAddr <= wlc_in.startBlock;
											end
										end
				S_StartCount 	: 	begin
											nextYThres <= localWinSize + CORES - 1;
											nextWindowBlockThres <= localWinSize - 1;	
											nextWindowBlockThres <= localWinSize;	
											windowWEThres <= localWinSize + WINDOW_BLOCKING;										
											finishStreamYThres <= localWinSize;
										end
				S_StreamData 	: 	begin
											updateYAddress();
											updateIntegralBlockAddress();
											updateWindowBlockAddress();
											updateWE();
											updateFinishStream();
										end										
				S_EmptyPipeline: 	begin
											emptyPipelineCounter <= emptyPipelineCounter + 1;
											if(emptyPipelineCounter == NUM_PROC_OFFSETS) finishPipe <= 1;	
										end
				default : ;
			endcase
	end
	
	
	//// ---- instantiate and connect modules ---- ////
	
	// create array windowAlignment input/output interfaces
	structs::struct_windowAlignment waIn[globalDefinitions::cores-1:0];
	structs::struct_windowAlignment waOut[globalDefinitions::cores-1:0];
	
	
	// write bulk data to windows in the processing cores
	genvar i;
	generate	
		for(i = 0 ; i < CORES ; i++) begin : intfLoop
			
			// instate array of window data shifters
			windowAlignment #(i%WINDOW_BLOCKING) windowAlignUnit(.clk(clk),.waIn(waIn[i]),.waOut(waOut[i]));
			
			// connect input interfaces
			always_ff @ (posedge clk) begin
				waIn[i].waddrY = windowYAddr[i/WINDOW_BLOCKING];
				waIn[i].waddrBlock = windowBlockAddr[i/WINDOW_BLOCKING];			
			end

			// data and we signals are delayed by one cycle so dont register values
			assign waIn[i].we = we[i/WINDOW_BLOCKING];
			assign waIn[i].wdata = icr_out.q;
			
			// connect the aligned data to output window cache write interfaces
			assign wcwOut[i].waddrY = waOut[i].waddrY;
			assign wcwOut[i].waddrBlock = waOut[i].waddrBlock;
			assign wcwOut[i].wdata = waOut[i].wdata;
			assign wcwOut[i].we = waOut[i].we;		
			assign wcwOut[i].dblBuf = dblBuf; 
			
		end
	endgenerate
	

	//// ---- helper tasks ---- ////
	
	task updateYAddress();		
		// if we need to start the next row
		if(nextYCounter >= nextYThres) begin
		
			// reset for start of new row
			integralBlockAddr <= localStartBlock;
			windowBlockAddr[0] <= 0;			
			nextYCounter <= 0;		
			
			// index row
			integralYAddr <= integralYAddr + 1;	
			windowYAddr[0] <= windowYAddr[0] + 1;
		end
	endtask
	
	task updateIntegralBlockAddress();		
		// if we dont need to start a new row
		if(nextYCounter < nextYThres) begin
			integralBlockAddr <= integralBlockAddr + 1 ;		
			nextYCounter <= nextYCounter + WINDOW_BLOCKING;	
		end
	endtask	
	
	task updateWindowBlockAddress();
		if(nextYCounter < nextWindowBlockThres)     
				windowBlockAddr[0] <= windowBlockAddr[0] + 1;
	endtask
	
	task updateWE();
		if(!finishStream) if(nextYCounter < (windowWEThres)) we[0] <= 1;
		else we[0] <= 0;	
	endtask
	
	task updateFinishStream();		
		if (windowYAddr[0] == finishStreamYThres) begin  
			if(nextYCounter >= nextYThres) finishStream <= 1;
		end
	endtask
	

	// reset all signals
	task resetSignals();  	  	 
		integralBlockAddr <= 0;
		integralYAddr <= 0;
		windowYAddr[0] <=0;
		windowBlockAddr[0] <= 0;
		we[0] <= 0;		
		localStartY <= 0;
		localStartBlock <=0;    
		nextYThres <= 0;
		nextWindowBlockThres <= 0;	
		finishStreamYThres <= 0;
		nextYCounter <= 0;
		emptyPipelineCounter <= 0;	
		varCount <= 0;
		varCounter <= 0;	
		finishPipe <= 0;
		finishStream <= 0;
		windowWEThres <=0;	
	endtask
	
endmodule : winLoader