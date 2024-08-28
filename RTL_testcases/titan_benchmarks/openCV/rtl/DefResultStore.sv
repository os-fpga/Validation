/******************** resultStore *********************/

/***** package *****/
package pkg_resultStore;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	parameter int CORE_COUNTER_WIDTH = log2(cores);
   parameter int CORES = cores;
  
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_StoreLocal,
		S_PopulateFIFO,
		S_Exit,
		S_Finish } STATES_t; 
              
endpackage



