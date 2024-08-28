/******************** Master Controler *********************/

/***** package *****/
package pkg_masterControler;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	parameter int CORE_COUNTER_WIDTH = log2( cores );
   parameter int CORES = cores;
  
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset, 
		S_Ready,
		S_CalcScaleVars,
		S_Scale,
		S_GenIntegralImages,
		S_LoadVar,
		S_LoadWindow,
		S_StartVar,
		S_StartFeat,
		S_StoreRes,
		S_Finish,
		S_FinishScale,
		S_WriteExitCode,
		S_Done	} STATES_t; 
              
endpackage



