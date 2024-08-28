module processor
	#( 
		parameter masterSlave = 1,	
		parameter coreNum = 0
	)
	(
	
	input bit clk,
	input bit resetn,
	 
	input structs::struct_windowCache_Write wcw,
	input structs::struct_varianceCache_Write vcw,	
	
	output structs::struct_featureCache_Read_In fcr_in ,
	input structs::struct_featureCache_Read_Out fcr_out,	
	
	output structs::struct_cascadeCache_Read_In ccr_in ,
	input structs::struct_cascadeCache_Read_Out ccr_out,
	
	output structs::struct_processor_Result_Out pr_out,
	input structs::struct_processor_Result_In pr_in,
	
	output structs::struct_processor_control_out pc_out,
	input structs::struct_processor_control_in pc_in
	
	);

	// global variable imports
	import globalDefinitions::*;


	// internal wires and registers
	logic [fixedbits-1:0] varianceNormFactor;
	logic varNormValid, varNormTaken;

	// instantiate internal hardware 
	structs::struct_windowCache_Read_In wcrA_in,wcrB_in;
	structs::struct_windowCache_Read_Out wcrA_out,wcrB_out;
	structs::struct_varianceCache_Read_in vcrA_in,vcrB_in;
	structs::struct_varianceCache_Read_out vcrA_out,vcrB_out;
	
	
	// create a blank windowCache_Write struct (for synthesis purposes)
	structs::struct_windowCache_Write localwcwA;
	structs::struct_windowCache_Write localwcwB;
	
	always_comb begin
		if(wcw.dblBuf == 0 ) begin
		
			localwcwA <= wcw;	
			
			localwcwB.waddrY <= 0;
			localwcwB.waddrBlock <= 0;
			localwcwB.wdata <= 0;
			localwcwB.we <= 0;
			localwcwB.dblBuf <= 0;
			
		end else begin
		
			localwcwA.waddrY <= 0;
			localwcwA.waddrBlock <= 0;
			localwcwA.wdata <= 0;
			localwcwA.we <= 0;
			localwcwA.dblBuf <= 0;
			
			localwcwB <= wcw;
			
		end
	end
	
	// create a blank varianceCache_Write struct (for synthesis purposes)
	structs::struct_varianceCache_Write localvcwA;
	structs::struct_varianceCache_Write localvcwB;
	always_comb begin
		if(vcw.dblBuf == 0) begin
		
			localvcwA <= vcw;	
			
			localvcwB.waddr <= 0;
			localvcwB.wdata <= 0;
			localvcwB.we <= 0;
			localvcwB.waddrSQ <= 0;
			localvcwB.wdataSQ <= 0;
			localvcwB.weSQ <= 0;
			localvcwB.dblBuf <= 0;
			
		end else begin
		
			localvcwA.waddr <= 0;
			localvcwA.wdata <= 0;
			localvcwA.we <= 0;
			localvcwA.waddrSQ <= 0;
			localvcwA.wdataSQ <= 0;
			localvcwA.weSQ <= 0;
			localvcwA.dblBuf <= 0;
			
			localvcwB <= vcw;
			
		end
	end

	
	// local memories
	windowCache windowCacheA(.clk(clk),.wcw(localwcwA), .wcr_in(wcrA_in), .wcr_out(wcrA_out));
	windowCache windowCacheB(.clk(clk),.wcw(localwcwB), .wcr_in(wcrB_in), .wcr_out(wcrB_out));
	varianceCache myVarianceCacheA(.clk(clk),.vcw(localvcwA),.vcr_in(vcrA_in),.vcr_out(vcrA_out));
	varianceCache myVarianceCacheB(.clk(clk),.vcw(localvcwB),.vcr_in(vcrB_in),.vcr_out(vcrB_out));
	
	
	featureEvaluator  
	#( 
		.masterSlave(masterSlave)	
	)myFeatureEvaluator
	(
		.clk(clk),
		.resetn(resetn),
		
		// proc control
		.start(pc_in.start),		
		.dblBuf(pc_in.dblBuf),
		.numberOfStages(pc_in.numberOfStages),		
		.ready(pc_out.ready),		
		.done(pc_out.done),
		
		// proc result
		.valid(pr_out.valid),
		.passfail(pr_out.passfail),
		.taken(pr_in.taken),
				
		//intermediate connections
		.validVarNormilizationFactor(varNormValid),		
		.varNormilizationFactor(varianceNormFactor),		
		.takenVarNormilizationFactor(varNormTaken),
		
		// data read portsadd wave \
		.fcr_in(fcr_in),
		.fcr_out(fcr_out),
		.ccr_in(ccr_in),
		.ccr_out(ccr_out),
		.wcrA_in(wcrA_out ),
		.wcrA_out(wcrA_in),
		.wcrB_in(wcrB_out),
		.wcrB_out(wcrB_in )
	);
	
	varianceNormCalc myVarianceNormCalc
	(
		.clk(clk),
		.resetn(resetn),
		
		// proc control
		.start(pc_in.startVar),
		.dblBuf(pc_in.dblBufVar),
		.ready(pc_out.varReady),
		.inv_window_area(pc_in.inv_window_area),
		
		//intermediate connections
		.taken(varNormTaken),		
		.valid(varNormValid),		
		.varianceNormFactor(varianceNormFactor),
		
		// data read ports
		.vcrA_in(vcrA_out),
		.vcrA_out(vcrA_in),		
		.vcrB_in(vcrB_out),
		.vcrB_out(vcrB_in)	
	);

	
endmodule : processor
