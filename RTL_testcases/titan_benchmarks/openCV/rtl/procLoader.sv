module procLoader(	

	//////////// CLOCK ////////////
	input bit clk,
	input bit resetn,
		
	//////////// Data Signals ////////////

	//////////// Interfaces ////////////	
	input structs::struct_procLoader_control_in plc_in,
	output structs::struct_procLoader_control_out plc_out,
	input structs::struct_integralImageCache_Read_Out icr_in,
	output structs::struct_integralImageCache_Read_In icr_out,
	input structs::struct_SQImageCache_Read_Out sqcr_in,
	output structs::struct_SQImageCache_Read_In sqcr_out,
	output structs::struct_windowCache_Write wcwOut[globalDefinitions::cores-1:0],
	output structs::struct_varianceCache_Write vcwOut[globalDefinitions::cores-1:0]
		
);



	localparam int WE_LATENCY = 1;
	localparam int CURWINDOW_LATENCY = 2;
	localparam int PIPELINE_COUNTER_WIDTH = 4;
	

	// import local parameters
	import pkg_procLoader::*;
	
	// address to send to integral/sqIntegral image when asking for variance data
	logic unsigned [INTEGRAL_BLOCK_COUNTER_WIDTH-1:0] varBlockAddr;
	logic unsigned [ELEM_WIDTH-1:0] varElement;
	logic unsigned [INTEGRAL_Y_COUNTER_WIDTH-1:0] varYAddr;
	logic unsigned [INTEGRAL_X_COUNTER_WIDTH-1:0] varXAddr;
	
	// relitive address sent to groups of window caches from muliple cores
	logic unsigned [ELEM_WIDTH-1:0] varAddr;
	logic unsigned [NUM_PROC_OFFSETS-1:0][WINDOW_Y_COUNTER_WIDTH-1:0] windowYAddr;
	logic unsigned [NUM_PROC_OFFSETS-1:0][WINDOW_BLOCK_COUNTER_WIDTH-1:0] windowBlockAddr;
	logic unsigned [(NUM_PROC_OFFSETS-1) + WE_LATENCY:0] we;
	logic unsigned [globalDefinitions::cores - 1:0] weVar;
	logic unsigned [WE_LATENCY - 1:0] weVarLat;
	logic unsigned [CURWINDOW_LATENCY - 1:0][5:0] curWindow;
	
	// real rams address send out to memory
	logic unsigned [INTEGRAL_BLOCK_COUNTER_WIDTH-1:0] integralBlockAddr;
	logic unsigned [INTEGRAL_Y_COUNTER_WIDTH-1:0] integralYAddr;
	
	// registers for the the real start position when the module begins operation
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] localStartY;
	logic unsigned [pkg_integralImageCache::integralRowBits-1:0] localStartX;
   logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] localStartBlock;
	logic unsigned [pkg_windowCache::windowBits-1:0] localWinSize;
	
	// threholds to guide real and relitive address indexing
	logic unsigned [pkg_windowCache::windowBits:0] nextYThres;		
	logic unsigned [pkg_windowCache::windowBits:0] nextWindowBlockThres;
	logic unsigned [pkg_windowCache::windowBits:0] finishStreamYThres;
	logic unsigned [pkg_windowCache::windowBits:0] windowWEThres;
	
	// misc counters
	logic unsigned [pkg_windowCache::windowBits-1:0] nextYCounter;	
	logic unsigned [PROC_OFFSETS_BITS-1:0] varCounter; 
	logic unsigned [WINDOW_BLOCK_COUNTER_WIDTH-1:0] varCount;
	logic unsigned [PIPELINE_COUNTER_WIDTH-1:0] emptyPipelineCounter;
	
	// misc control signals
	logic unsigned [WINDOW_BLOCK_COUNTER_WIDTH-1:0] blocksPerWindow;
	logic varData;
	logic finishStream;
	logic finishPipe;
	logic finishVar;
	
	//define states variables
	STATES_t NextState,CurState;
	
	// update states
	always_ff @(posedge clk) begin
		CurState <= NextState;       
	end
	
	

	
	//// ---- direct assignments---- ////
	
	// decide whether to use variance or window addresses
	assign icr_out.raddrY = varData ? integralYAddr : varYAddr ;
	assign icr_out.raddrXBlock = varData ? integralBlockAddr : varBlockAddr;	
	assign sqcr_out.raddrY = varData ? 0 : varYAddr;
	assign sqcr_out.raddrXBlock = varData ? 0 : varBlockAddr;
	
	// decide if the state machine is in variance load or image load mode
	assign varData = (CurState == S_StartCount || CurState == S_StreamData || CurState == S_EmptyPipeline);

	// update block control signals about process of hardware
	assign plc_out.done = (CurState == S_Done);	
	assign plc_out.ready = (CurState == S_Ready);	
	assign plc_out.varLoaded = (CurState == S_StartCount);	
	assign plc_out.windowLoaded = (CurState == S_Done);
			
	//// ---- Combinational Logic ---- ////		
	always_comb begin		
		// finished loading variance info for all processors
		finishVar = (varCount + 1) == NUM_PROC_OFFSETS-1;		
		// calulate real block address from virtual X coordinate
		varBlockAddr = varXAddr/WINDOW_BLOCKING;		
	end
	
	//// ---- Registered Logic ---- ////
	always_ff @ (posedge clk) begin    

		// calulate which element of the data block was the actual data requested
		varElement <= varXAddr%WINDOW_BLOCKING;
		
		// these states represent the need to write out data WE_LATENCY cycles later, thus write into chained regiters pipline to create that delay
		weVarLat[0] <= (CurState == S_StartVarA || CurState == S_StartVarB || CurState == S_StartVarC || CurState == S_StartVarD);
		
		// chain the variance WE registers together
		for(int i = 1 ; i < WE_LATENCY; i++)weVarLat[i] <= weVarLat[i-1];
		
		// register chain for which window is being loaded with variance data
		for(int i = 1 ; i < CURWINDOW_LATENCY; i++) curWindow[i] <= curWindow[i-1];
		
		
		
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
				S_Ready				: NextState = plc_in.start ? S_StoreLocal : S_Ready;
				S_StoreLocal		: NextState = S_StartVarA;
				
				// varince constants first - to start normilization calulation early
				S_StartVarA			: NextState = S_StartVarB;				
				S_StartVarB			: NextState = S_StartVarC;			
				S_StartVarC			: NextState = S_StartVarD;				
				S_StartVarD			: NextState = (curWindow[0] == (globalDefinitions::cores-1)) ? S_EmptyVar : S_StartVarA;				
				S_EmptyVar			: NextState = S_StartCount;
				
				// load the bulk of the window data in parellel to all avilible cores
				S_StartCount		: NextState = S_StreamData;
				S_StreamData		: NextState = finishStream ? S_EmptyPipeline : S_StreamData;
				S_EmptyPipeline	: NextState = finishPipe ? S_Done : S_EmptyPipeline;
				S_Done				: NextState = S_Done;
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
				S_StoreLocal	:	begin
											localStartY <= plc_in.startY;
											localStartX <= (plc_in.startBlock * WINDOW_BLOCKING);
											localStartBlock <= plc_in.startBlock;											
											localWinSize <= plc_in.winSize;											
										end
				S_StartVarA 	: 	begin
											varYAddr <= localStartY + 1;
											varXAddr <= localStartX + 1 + curWindow[0];
											varAddr <= 0;											
										end
				S_StartVarB 	: 	begin
											varYAddr <= localStartY + 1;
											varXAddr <= localStartX + localWinSize - 1 + curWindow[0];
											varAddr <= 1;	
										end
				S_StartVarC 	: 	begin
											varYAddr <= localStartY + localWinSize - 1;
											varXAddr <= localStartX + 1 + curWindow[0];
											varAddr <= 2;	
										end										
				S_StartVarD 	: 	begin
											varYAddr <= localStartY + localWinSize - 1;
											varXAddr <= localStartX + localWinSize - 1 + curWindow[0];
											varAddr <= 3;
											curWindow[0] <= curWindow[0] + 1;											
										end
				S_StartCount 	: 	begin
											nextYThres <= localWinSize + CORES - 1;
											nextWindowBlockThres <= localWinSize - 1;	
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
	
	// write data to each of the cores variance caches
	genvar i;
	generate	
		for(i = 0 ; i < CORES ; i++) begin : varLoop			
			always_ff @(posedge clk) begin			
				vcwOut[i].waddr <= varAddr;			
				vcwOut[i].waddrSQ <= varAddr;
				
				if(curWindow[CURWINDOW_LATENCY - 1] == i) begin
					vcwOut[i].we <= weVarLat[WE_LATENCY - 1];
					vcwOut[i].weSQ <= weVarLat[WE_LATENCY - 1];		
				end else begin
					vcwOut[i].we <= 0;
					vcwOut[i].weSQ <= 0;			
				end
				
			end
			
			// select the proper data element from the block
			always_comb begin				
				vcwOut[i].wdata = icr_in.q[varElement];
				vcwOut[i].wdataSQ = sqcr_in.q[varElement];
			end
		end
	endgenerate
	
	// write bulk data to windows in the processing cores
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
			assign waIn[i].wdata = icr_in.q;
			
			// connect the aligned data to output window cache write interfaces
			assign wcwOut[i].waddrY = waOut[i].waddrY;
			assign wcwOut[i].waddrBlock = waOut[i].waddrBlock;
			assign wcwOut[i].wdata = waOut[i].wdata;
			assign wcwOut[i].we = waOut[i].we;		
			
		end
	endgenerate
	


	
	

	//// ---- helper tasks ---- ////
	
	task updateYAddress();		
		// if we need to start the next row
		if(nextYCounter >= nextYThres) begin
		
			// reset for start of new row
			integralBlockAddr <= localStartY;
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
		if(nextYCounter < (windowWEThres)) we[0] <= 1;
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
		varYAddr <= 0;		
		curWindow[0] <= 0;
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
	
endmodule : procLoader