/******************** Processor *********************/

/***** interface *****/
interface intf_processor_in #(parameter masterSlave = 1);
	import globalDefinitions::*;
	


	// interface to other componates
	//intf_windowCache_Write wcwA();
	//intf_windowCache_Write wcwB();
	//intf_varianceCache_Write vcw();
	//intf_featureCache_Read fcr();
	//intf_cascadeCache_Read ccr();	

endinterface

interface intf_processor_out;
	import globalDefinitions::*;	
	 
	logic valid;
	logic passfail;
	logic taken;
	
	logic [pkg_integralImageCache::integralRowBits-1:0] x;	
	logic [pkg_integralImageCache::integralColBits-1:0] y;	
	logic [globalDefinitions::scaleBits-1:0] scale;
	
endinterface


interface intf_processor_control;
	import globalDefinitions::*;
	
	// start detection on the loaded window
	logic start;
	logic ready;
	logic done;
	
	// start the varience normilization threshold calculation
	logic startVar;
	logic readyVar;

	logic valid;
	logic passfail;
	logic taken;	
	
	// select which of the 2 window cache to computer from (so the other can be filled in parellel)
	logic dblBuf;
	logic [ log2(globalDefinitions::supportedCascadeStages) - 1 :0] numberOfStages;
	
	// precomputed valued needed for the calulation
	logic [fixedbits-1:0] inv_window_area;	

endinterface
