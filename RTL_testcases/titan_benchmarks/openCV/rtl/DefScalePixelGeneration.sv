/******************** scalePixelGeneration *********************/

/***** package *****/
package pkg_scalePixelGeneration;
	
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_ReadA,
		S_ReadB,
		S_ReadC,
		S_ReadD } STATES_t; 
              
endpackage