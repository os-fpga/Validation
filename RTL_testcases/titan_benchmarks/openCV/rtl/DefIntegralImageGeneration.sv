/******************** Integral Image Generation *********************/

/***** package *****/
package pkg_integralImageGeneration;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
  
	// integral counter sizes
	parameter int INTEGRAL_Y_COUNTER_WIDTH = pkg_integralImageCache::integralColBits;
	parameter int INTEGRAL_X_COUNTER_WIDTH = pkg_integralImageCache::integralRowBits;
  	parameter int INTEGRAL_DATA_WIDTH = pkg_integralImageCache::integralImageDepth;
  	parameter int SQ_DATA_WIDTH = pkg_SQImageCache::SQImageDepth;
	
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_FillRowOne,
		S_FillColOne,
		S_Ready,
		S_Index,
		S_Read,
		S_CalcRow,
		S_CalcRes,
		S_Write,
		S_Done } STATES_t; 
              
endpackage


