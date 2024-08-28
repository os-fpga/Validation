/******************** Scale Param Generation *********************/

/***** package *****/
package pkg_scaleParamGeneration;
	
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
    
	// ---- private params ---- //
	
	// ---- local enums ---- //
  
	// define state names	
	typedef enum logic [3:0] {
		S_Reset,
		S_Ready, 
		S_IndexScaleCount,
		S_CalcNewX,
		S_CalcNewY,
		S_CalcInvS,
		S_CalcXS,
		S_CalcYS,
		S_WaitForDiv,
		S_ReadInvS,
		S_ReadXS,
		S_ReadXY,
		S_CalcNewWinSize,
		S_Done} STATES_t; 
              
endpackage