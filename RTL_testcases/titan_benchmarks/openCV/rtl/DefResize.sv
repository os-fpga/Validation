/******************** procLoader *********************/

/***** package *****/
package pkg_resize;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	parameter int FIXED=11;
  
	
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_StartCalcSF,
		S_StartPixelGen,
		S_Index,	
		S_Done } STATES_t; 
              
endpackage


