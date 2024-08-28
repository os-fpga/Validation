/******************** featureEvaluator *********************/

/***** package *****/
package pkg_featureEvaluator;
  
	// ---- public params ---- //	
    
	// ---- private params ---- //
	
	// ---- local enums ----- //
	
	// define cascade states	
	typedef enum logic [4:0] { 
		CS_Reset, 
		CS_Ready,
		CS_GetVarianceNormilizationThres,
		CS_Stall,
		CS_GetSize,
		CS_CountStages,
		CS_StageThreshold,      
		CS_CountClassifiers, 
		CS_ClassifierThreshold,
		CS_GetAlpha1, 
		CS_GetAlpha2, 
		CS_GetWeight1, 
		CS_GetWeight2,
		CS_GetWeight3,  
		CS_Done } CS_t;   
              
  // define feature states	
	typedef enum logic [4:0] {
		FS_Reset,
		FS_Init,
		FS_Ready,	
		FS_Stall,						
		FS_F1A,
		FS_F1B,
		FS_F1C,
		FS_F1D,
		FS_F2A,
		FS_F2B,
		FS_F2C,
		FS_F2D,
		FS_F3A,
		FS_F3B,
		FS_F3C,
		FS_F3D  } FS_t; 
  
endpackage
