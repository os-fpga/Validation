/******************** procLoader *********************/

/***** package *****/
package pkg_winLoader;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
  
	// integral counter sizes
	parameter int INTEGRAL_Y_COUNTER_WIDTH = pkg_integralImageCache::integralColBits;
	parameter int INTEGRAL_X_COUNTER_WIDTH = pkg_integralImageCache::integralRowBits;
	parameter int INTEGRAL_BLOCK_COUNTER_WIDTH = pkg_integralImageCache::integralBlockBits; 

	// window counter sizes
	parameter int WINDOW_Y_COUNTER_WIDTH = pkg_windowCache::windowBits;
	parameter int WINDOW_BLOCK_COUNTER_WIDTH = pkg_windowCache::windowBlockBits; 
  
	// how many cycles to fill each core with its first piece of data
	parameter int NUM_PROC_OFFSETS = globalDefinitions::CielingADivideB(cores,windowCacheBlocking);
	parameter int PROC_OFFSETS_BITS = globalDefinitions::log2(NUM_PROC_OFFSETS);
	
	// Words per Read
	parameter int WINDOW_BLOCKING = globalDefinitions::windowCacheBlocking;
	parameter int CORES = globalDefinitions::cores;
	
	// bits needed to count which element inside a block read was requested
	parameter int ELEM_WIDTH = globalDefinitions::elementBits;

  
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_StoreLocal,
		S_StartCount,
		S_StreamData,
		S_EmptyPipeline,
		S_Done } STATES_t; 
              
endpackage



/*
interface intf_procLoader_control;
	import globalDefinitions::*;
	
	logic unsigned [pkg_windowCache::windowBits-1:0] winSize;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] startBlock;
		
	logic start;	
	logic done;
	logic ready;

endinterface
*/



