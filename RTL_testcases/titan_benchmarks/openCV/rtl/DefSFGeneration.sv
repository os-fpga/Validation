/******************** sfGeneration *********************/

/***** package *****/
package pkg_sfGeneration;
	
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_DXYP5,
		S_FXYP5,
		S_FXYNORM,
		S_FS,
		S_Done } STATES_t; 
              
endpackage


