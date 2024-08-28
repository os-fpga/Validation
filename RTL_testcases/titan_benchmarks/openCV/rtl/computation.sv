module computation(
	
	//////////// CLOCK //////////////////
	input bit clk,
	input bit resetn,
	
	//////////// Data Signals //////////	
	input bit start,
	output bit ready,
	output bit done,	
	
	input [7:0] stages,
	input [pkg_imageCache::rowBits - 1 : 0] baseImageWidth,
  input [pkg_imageCache::colBits - 1 : 0] baseImageHeight,
  input [globalDefinitions::fixedbits -1 : 0 ] baseScaleFactor,
  input [globalDefinitions::fixed - 1 : 0 ] winSize,
  input [globalDefinitions::fixed - 1 : 0 ] minWinSize,
  input [globalDefinitions::fixedbits - 1 : 0 ] winSizeInv,	
		
	//////////// Interfaces //////////////

  output structs::struct_imageCache_Read_In icr_in,
  input structs::struct_imageCache_Read_Out icr_out,

	output 	structs::struct_featureCache_Read_In 			fcr_in,
	input 	structs::struct_featureCache_Read_Out 			fcr_out,
	
	output 	structs::struct_cascadeCache_Read_In 			ccr_in,
	input 	structs::struct_cascadeCache_Read_Out 			ccr_out,
	
	output 	structs::struct_resultQueue_Write_In 			rqw_in,
	input 	structs::struct_resultQueue_Write_Out 			rqw_out

);
	
	
	// internal wires
	logic internalResetn,integralMux;
	
	// internal data structures
	structs::struct_scaleCache_Write scw;
	structs::struct_scaleCache_Read_In scr_in;
  structs::struct_scaleCache_Read_Out scr_out;
	structs::struct_integralImageCache_Write iicw;
  structs::struct_integralImageCache_Write_Out iicw_out;
  structs::struct_integralImageCache_Read_In  iicr_in;
  structs::struct_integralImageCache_Read_Out iicr_out;
  structs::struct_SQImageCache_Write sqcw;
	structs::struct_SQImageCache_Write_Out sqcw_out;
	structs::struct_SQImageCache_Read_In sqcr_in;
  structs::struct_SQImageCache_Read_Out sqcr_out;
	structs::struct_windowCache_Write 	wcwOut[globalDefinitions::cores-1:0];
	structs::struct_varianceCache_Write vcwOut[globalDefinitions::cores-1:0];
	structs::struct_scaleParams_in sp_in;
  structs::struct_scaleParams_out sp_out;
	
	// internal control structures
  structs::struct_resize_control_out rc_out;
  structs::struct_resize_control_in rc_in;
  structs::struct_integralImageGeneration_control_in iigc_in;
  structs::struct_integralImageGeneration_control_out iigc_out;
  structs::struct_varLoader_control_in vlc_in;
  structs::struct_varLoader_control_out vlc_out;
  structs::struct_winLoader_control_in wlc_in;
  structs::struct_winLoader_control_out wlc_out;
  structs::struct_processor_control_in pc_in[globalDefinitions::cores-1:0];
  structs::struct_processor_control_out pc_out[globalDefinitions::cores-1:0];
  structs::struct_processor_Result_Out pr_out[globalDefinitions::cores-1:0];
  structs::struct_processor_Result_In pr_in[globalDefinitions::cores-1:0];
  structs::struct_resultStore_control_in rsc_in;
  structs::struct_resultStore_control_out rsc_out;

  // create a blank integral read struct (for synthesis purposes)
  structs::struct_integralImageCache_Read_In win_iicr_in;
  structs::struct_integralImageCache_Read_In var_iicr_in;
  
  // decide which block (varLoader or winLoader) get to address in integral image
  always_ff @(posedge clk) begin
    if(resetn == 0) integralMux <= 0;
    else begin
      if(vlc_in.start) integralMux <= 0;
      else if(wlc_in.start) integralMux <= 1;		
    end	
  end
  
  always_comb begin
    iicr_in <= integralMux ? win_iicr_in : var_iicr_in;    
  end




genvar x;
generate 

  masterControler myMasterControler
  (
    .clk(clk), 
    .resetn(resetn), 
    .done(done),
    .internalResetn(internalResetn),
    .start(start),
    .ready(ready),    
    .sp_in(sp_in),
    .sp_out(sp_out),
    .rc_in(rc_in),
    .rc_out(rc_out),
    .iigc_in(iigc_in),
    .iigc_out(iigc_out),
    .vlc_out(vlc_out),
    .vlc_in(vlc_in),
    .wlc_out(wlc_out),
    .wlc_in(wlc_in),
    .pc_out(pc_out),
    .pc_in(pc_in),		
    .rsc_in(rsc_in),
    .rsc_out(rsc_out),			
    
    .baseImageWidth(baseImageWidth),
    .baseImageHeight(baseImageHeight),
    .baseScaleFactor(baseScaleFactor),
    .winSize(winSize),
    .minWinSize(minWinSize),
    .winSizeInv(winSizeInv),
    .stages(stages)	 	
  );	 
  
  
  
  // scale param generation
  scaleParamGeneration myScaleParamGeneration( .clk(clk), .resetn(internalResetn), .sp_in(sp_in), .sp_out(sp_out));
  
  // scale image
  resize myresize( .clk(clk), .resetn(internalResetn),.icr_in(icr_in),.icr_out(icr_out),.rc_in(rc_in),.rc_out(rc_out), .scw(scw));
  
  // write scale image to a cache
  scaleCache myscaleCache(  .clk(clk), .scw(scw), .scr_in(scr_in), .scr_out(scr_out) );
  
  // generate an integral image from the scaled image
  integralImageGeneration myIntegralImageGeneration(  .clk(clk),.resetn(internalResetn),.icw(iicw),.icw_out(iicw_out),.sqcw(sqcw),.sqcw_out(sqcw_out),
                                                      .scr_in(scr_in),.scr_out(scr_out),.iigc_in(iigc_in),.iigc_out(iigc_out));
  // write integral image to a cahce
  integralImageCache myIntegralImageCache(  .clk(clk),.icw(iicw),.icw_out(iicw_out),.icr_in(iicr_in),.icr_out(iicr_out));
  SQImageCache mySQImageCache(.clk(clk), .sqcw(sqcw), .sqcw_out(sqcw_out), .sqcr_in(sqcr_in),.sqcr_out(sqcr_out));
  
  // hardware to load a processor window cache from the integral and sqaure integral image cache
  winLoader myWinLoader(.clk(clk),.resetn(internalResetn),.wlc_in(wlc_in),.wlc_out(wlc_out),.icr_in(win_iicr_in),.icr_out(iicr_out),.wcwOut(wcwOut));
  varLoader myVarLoader(.clk(clk),.resetn(internalResetn),.vlc_in(vlc_in),.vlc_out(vlc_out),.icr_in(var_iicr_in),.icr_out(iicr_out),.sqcr_in(sqcr_in),.sqcr_out(sqcr_out),.vcwOut(vcwOut));


// create a carible number of processors, 1 master and n-1 slaves connected to cascade and feature caches as well as the window and variance loading hardware
for(x = 0 ; x < globalDefinitions::cores ; x++) begin : intfLoop
  // processor instantiation		
  if(x == 0 )
  processor #( .masterSlave(1) ,.coreNum(x) )
    myProc
      (
        .clk(clk),
        .resetn(internalResetn),
        .wcw(wcwOut[x]),
        .vcw(vcwOut[x]),
        .fcr_out(fcr_out),
        .fcr_in(fcr_in),
        .ccr_out(ccr_out),
        .ccr_in(ccr_in),
        .pr_out(pr_out[x]),
        .pr_in(pr_in[x]),
        .pc_out(pc_out[x]),
        .pc_in(pc_in[x])
      );
  
  else
  processor #( .masterSlave(0) ,.coreNum(x) )
    myProc 
      (
        .clk(clk),
        .resetn(internalResetn),
        .wcw(wcwOut[x]),
        .vcw(vcwOut[x]),
        .fcr_out(fcr_out),
        .fcr_in(),
        .ccr_out(ccr_out),
        .ccr_in(),
        .pr_out(pr_out[x]),
        .pr_in(pr_in[x]),
        .pc_out(pc_out[x]),
        .pc_in(pc_in[x])
      );			
  end
  
  // store the result of the processors to an output fifo
  resultStore myResultStore(.clk(clk),.resetn(internalResetn),.rqw_in(rqw_in),.rqw_out(rqw_out),
                            .rsc_in(rsc_in),.rsc_out(rsc_out),.pr_out(pr_out),.pr_in(pr_in));
									 
endgenerate

endmodule : computation


