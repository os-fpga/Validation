module system(

	//////////// CLOCK //////////
	input bit clk,
	
	//////////// Ports Signals //////////	
	input [63:0] 	command_data,
	output 			command_wanted,
	input 			command_ready,
		
	output[63:0]	stats_data,
	input				stats_ready_to_accept,
	output			stats_ready_to_return,
	
	input	[63:0]	feature_data,
	output			feature_wanted,
	input				feature_ready,
	
	input	[63:0]	cascade_data,
	output			cascade_wanted,
	input				cascade_ready,
	
	input	[31:0]	image_data,
	output			image_wanted,
	input				image_ready,
	
	output[31:0]	result_data,
	input				result_ready_to_accept,
	output			result_ready_to_return

);

/// system logic
logic start;
logic ready;
logic done;
logic doneWire;
logic resetn;
logic unsigned [63:0] cycleCounter;
logic counterEn;
logic [pkg_resultQueue::WIDTH-1:0] exactBitWidthResult;

// software programable user inputs
logic unsigned [7 : 0 ] stages;
logic unsigned [pkg_imageCache::rowBits - 1 : 0] baseImageWidth;
logic unsigned [pkg_imageCache::colBits - 1 : 0] baseImageHeight;
logic unsigned [globalDefinitions::fixedbits -1 : 0 ] baseScaleFactor;
logic unsigned [globalDefinitions::fixed - 1 : 0 ] winSize,minWinSize;
logic unsigned [globalDefinitions::fixedbits - 1 : 0 ] winSizeInv;


// hard coded system signals
assign command_wanted = command_ready; 
assign resetn = ~(command_ready && (command_data[3:0] == 1));
assign start = command_ready && (command_data[3:0] == 2);
assign stats_ready_to_return = (done);
assign stats_data = cycleCounter;
assign result_data = {1'd0,exactBitWidthResult};

always_ff @(posedge clk) begin   
  if(~resetn) begin 
    counterEn <= 0; 
    cycleCounter <= 0; 
    done <= 0;
  end else if(start) counterEn <= 1;
  else if(doneWire) begin
    counterEn <= 0;  
    done <= 1;
  end 
      
  if(counterEn) cycleCounter <= cycleCounter + 1;   
end

always_ff @(posedge clk) begin  
  if(command_ready) begin
    case( command_data[3:0] )
      4'd3 : baseImageWidth <= command_data >> 4;
      4'd4 : baseImageHeight <= command_data >> 4;
      4'd5 : baseScaleFactor <= command_data >> 4;
      4'd6 : winSize <= command_data >> 4;
      4'd7 : winSizeInv <= command_data >> 4;
      4'd8 : stages <= command_data >> 4;
      4'd9 : minWinSize <= command_data >> 4;
      default : ;
    endcase   
  end  
end






//system interfaces
structs::struct_featureCache_Read_In fcr_in;
structs::struct_featureCache_Read_Out fcr_out;
structs::struct_featureCache_Write fcw;

structs::struct_cascadeCache_Read_In ccr_in;
structs::struct_cascadeCache_Read_Out ccr_out;
structs::struct_cascadeCache_Write ccw;

structs::struct_imageCache_Read_In icr_in;
structs::struct_imageCache_Read_Out icr_out;
structs::struct_imageCache_Write icw;

structs::struct_resultQueue_Read_In rqr_in;
structs::struct_resultQueue_Read_Out rqr_out;
structs::struct_resultQueue_Write_In rqw_in;
structs::struct_resultQueue_Write_Out rqw_out;


// load feature data from outside world
featureCacheLoader myFeatureCacheLoader(
	.clk(clk), 
	.resetn(resetn),
		
	.data(feature_data),
	.data_ready(feature_ready),
	.data_wanted(feature_wanted),
		
	.fcw(fcw)
);
featureCache myFeatureCache(.clk(clk), .fcw(fcw), .fcr_in(fcr_in),.fcr_out(fcr_out));


// load cascade data from outside world	
cascadeCacheLoader myCascadeCacheLoader(
	.clk(clk), 
	.resetn(resetn),
		
	.data(cascade_data),
	.data_ready(cascade_ready),
	.data_wanted(cascade_wanted),
		
	.ccw(ccw)
);
cascadeCache myCascadeCache(.clk(clk), .ccw(ccw), .ccr_in(ccr_in),.ccr_out(ccr_out));

// load cascade data from outside world	
imageCacheLoader myImageeCacheLoader(
  .clk(clk), 
  .resetn(resetn),
    
  .data(image_data),
  .data_ready(image_ready),
  .data_wanted(image_wanted),
    
  .icw(icw)
);
imageCache myimageCache(.clk(clk),.icw(icw),.icr_in(icr_in),.icr_out(icr_out));


// send results back to the outside world
resultQueueUnLoader myResultQueueUnLoader( 
	.clk(clk), 
	.resetn(resetn),	
	
	.data(exactBitWidthResult),
	.data_ready(result_ready_to_return),
	.data_wanted(result_ready_to_accept),
		
	.rqr_in(rqr_in),
	.rqr_out(rqr_out)		
);
resultQueue myResultQueue ( .clk(clk), .resetn(resetn), .rqw_in(rqw_in),.rqw_out(rqw_out), .rqr_in(rqr_in),.rqr_out(rqr_out));

computation mainComp(
	.clk(clk), 
	.resetn(resetn),
	
	.start(start),
	.ready(ready),
	.done(doneWire),

	.icr_out(icr_out),
	.icr_in(icr_in),

	.fcr_out(fcr_out),
	.fcr_in(fcr_in),
	
	.ccr_out(ccr_out),
	.ccr_in(ccr_in),
	.rqw_out(rqw_out),
	.rqw_in(rqw_in),
	
	 //software adjustable parameters
	.baseImageWidth(baseImageWidth),
  .baseImageHeight(baseImageHeight),
  .baseScaleFactor(baseScaleFactor),
  .winSize(winSize),
  .minWinSize(minWinSize),
  .winSizeInv(winSizeInv),
  .stages(stages)
);





endmodule : system