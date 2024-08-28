package structs;

/*************************************************/
/************ Image Memory Structures ************/
/*************************************************/

//-----image-----//
typedef struct {
	logic unsigned [pkg_imageCache::COL_WIDTH -1:0] waddrY;
	logic unsigned [pkg_imageCache::ROW_WIDTH -1:0] waddrX;
	logic unsigned [32-1:0] wdata; 
	logic we;
} struct_imageCache_Write;

typedef struct {
	logic unsigned [pkg_imageCache::COL_WIDTH -1:0] raddrY;
	logic unsigned [pkg_imageCache::ROW_WIDTH -1:0] raddrX;
} struct_imageCache_Read_In;

typedef struct {
	logic unsigned [pkg_imageCache::WORD_SIZE -1:0] q;	
} struct_imageCache_Read_Out;	


//-----scale image-----//
typedef struct {
	logic unsigned [pkg_scaleCache::COL_WIDTH -1:0] waddrY;
	logic unsigned [pkg_scaleCache::ROW_WIDTH -1:0] waddrX;
	logic unsigned [pkg_scaleCache::WORD_SIZE-1:0] wdata; 
	logic we;
} struct_scaleCache_Write;

typedef struct {
	logic unsigned [pkg_scaleCache::COL_WIDTH -1:0] raddrY;
	logic unsigned [pkg_scaleCache::ROW_WIDTH -1:0] raddrX;
} struct_scaleCache_Read_In;

typedef struct {
	logic unsigned [pkg_scaleCache::WORD_SIZE-1:0] q;	
} struct_scaleCache_Read_Out;	


//-----integral image-----//
typedef struct {
	logic unsigned [pkg_integralImageCache::COL_WIDTH -1:0] waddrY;
	logic unsigned [pkg_integralImageCache::ROW_WIDTH -1:0] waddrX;
	logic unsigned [pkg_integralImageCache::WORD_SIZE-1:0] wdata; 
	logic we;
} struct_integralImageCache_Write;

typedef struct {
  logic unsigned [pkg_integralImageCache::WORD_SIZE-1:0] q;	
} struct_integralImageCache_Write_Out;

typedef struct {
	logic unsigned [pkg_integralImageCache::COL_WIDTH -1:0] raddrY;
	logic unsigned [pkg_integralImageCache::BLOCK_WIDTH -1:0] raddrXBlock;
} struct_integralImageCache_Read_In;

typedef struct {
	logic unsigned [pkg_integralImageCache::WORDS-1:0][pkg_integralImageCache::WORD_SIZE-1:0] q;	
} struct_integralImageCache_Read_Out;


//-----sqaure integral image-----//	
typedef struct { 
	logic unsigned [pkg_SQImageCache::COL_WIDTH-1:0] waddrY;
	logic unsigned [pkg_SQImageCache::ROW_WIDTH-1:0] waddrX;
	logic unsigned [pkg_SQImageCache::WORD_SIZE-1:0] wdata; 	
	logic we;
}struct_SQImageCache_Write;

typedef struct { 
  logic unsigned [pkg_SQImageCache::WORD_SIZE-1:0] q;	
}struct_SQImageCache_Write_Out;

typedef struct { 
	logic unsigned [pkg_SQImageCache::COL_WIDTH-1:0] raddrY;
	logic unsigned [pkg_SQImageCache::BLOCK_WIDTH -1:0] raddrXBlock;	
}struct_SQImageCache_Read_In;

typedef struct { 
	logic unsigned [pkg_SQImageCache::WORDS-1:0][pkg_SQImageCache::WORD_SIZE-1:0] q;		
}struct_SQImageCache_Read_Out;


//----- window image -----//	
typedef struct { 
	logic unsigned [pkg_windowCache::INDEX_WIDTH-1:0] waddrY;
	logic unsigned [pkg_windowCache::BLOCK_WIDTH-1:0] waddrBlock;
	logic unsigned [pkg_windowCache::WORDS-1:0][pkg_windowCache::WORD_SIZE-1:0] wdata; 	
	logic we;
	logic dblBuf;
} struct_windowCache_Write;

typedef struct {   
	logic unsigned [pkg_windowCache::INDEX_WIDTH-1:0] raddrX;
	logic unsigned [pkg_windowCache::INDEX_WIDTH-1:0] raddrY;
}struct_windowCache_Read_In;

typedef struct {
	logic unsigned [pkg_windowCache::WORD_SIZE-1:0] q;	
}struct_windowCache_Read_Out;


//-----varience cache-----//	
typedef struct {  
	logic unsigned [ pkg_varianceCache::ADDR_WIDTH-1:0] waddr;
	logic unsigned [ pkg_varianceCache::WORD_SIZE-1:0] wdata; 
	logic we;
	logic unsigned [ pkg_varianceCache::ADDR_WIDTH-1:0] waddrSQ;		
	logic unsigned [ pkg_varianceCache::WORD_SIZE_SQ-1:0] wdataSQ;
	logic weSQ;	
	logic dblBuf;	
} struct_varianceCache_Write;

typedef struct {
	logic unsigned [ pkg_varianceCache::ADDR_WIDTH-1:0] raddr;
	logic unsigned [ pkg_varianceCache::ADDR_WIDTH-1:0] raddrSQ;	
} struct_varianceCache_Read_in;

typedef struct {  
	logic unsigned [ pkg_varianceCache::WORD_SIZE-1:0] q;
	logic unsigned [ pkg_varianceCache::WORD_SIZE_SQ-1:0] qSQ;
} struct_varianceCache_Read_out;





/************************************************************/
/************ Non Image Memory Memory Structures ************/
/************************************************************/

//-----cascade cache-----//	
typedef struct {  	
	logic unsigned [pkg_cascadeCache::ADDR_WIDTH-1:0] waddr;
	logic signed [pkg_cascadeCache::WORD_SIZE-1:0] wdata; 
	logic we;	 	
} struct_cascadeCache_Write;

typedef struct {  	
	logic unsigned [pkg_cascadeCache::ADDR_WIDTH-1:0] raddr;		
}struct_cascadeCache_Read_In;

typedef struct {  	
	logic signed [pkg_cascadeCache::WORD_SIZE-1:0] q;		
}struct_cascadeCache_Read_Out;


//-----feature cache-----//	
typedef struct {  	
	logic unsigned [pkg_featureCache::ADDR_WIDTH-1:0] waddr;
	logic unsigned [pkg_featureCache::WORD_SIZE-1:0] wdata; 
	bit we;		
}struct_featureCache_Write;

typedef struct { 
	logic unsigned [pkg_featureCache::ADDR_WIDTH-1:0] raddr;		
}struct_featureCache_Read_In;

typedef struct { 
	logic unsigned [pkg_featureCache::WORD_SIZE-1:0] q;		
}struct_featureCache_Read_Out;


//-----result queue-----//	
typedef struct { 
	logic unsigned [pkg_resultQueue::WIDTH-1:0] data;	
	logic we;
} struct_resultQueue_Write_In;

typedef struct { 
	logic full; 
} struct_resultQueue_Write_Out;

typedef struct { 
	logic re;	
} struct_resultQueue_Read_In;

typedef struct { 
	logic unsigned [pkg_resultQueue::WIDTH-1:0] q;
	logic empty;
} struct_resultQueue_Read_Out;





/************************************************************/
/************ Processing and Control Structure **************/
/************************************************************/

//----- integral image generation control -----//
typedef struct {  
	bit ready;
	bit done;
} struct_integralImageGeneration_control_out;

typedef struct {  
	bit start;
	bit taken;	
	logic unsigned [pkg_integralImageGeneration::INTEGRAL_Y_COUNTER_WIDTH-1:0] sizeY;
	logic unsigned [pkg_integralImageGeneration::INTEGRAL_X_COUNTER_WIDTH-1:0] sizeX;
} struct_integralImageGeneration_control_in;


//----- processor loader control -----//
typedef struct { 
	logic unsigned [pkg_windowCache::windowBits-1:0] winSize;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] startBlock;		
	logic start;
}struct_procLoader_control_in;

typedef struct { 
	logic done;
	logic ready;	
	logic varLoaded;
	logic windowLoaded;
}struct_procLoader_control_out;


//----- window loader control -----//	
typedef struct { 
	logic unsigned [pkg_windowCache::windowBits-1:0] winSize;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] startBlock;		
	logic start;
	logic ack;
	logic dblBuf;
}struct_winLoader_control_in;

typedef struct { 
	logic done;
	logic ready;	
}struct_winLoader_control_out;


//----- variance loader control -----//	
typedef struct { 
	logic unsigned [pkg_windowCache::windowBits-1:0] winSize;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralBlockBits-1:0] startBlock;		
	logic start;
	logic ack;
	logic dblBuf;
}struct_varLoader_control_in;

typedef struct { 
	logic done;
	logic ready;	
}struct_varLoader_control_out;


//----- window alignment -----//	
typedef struct {  
	logic unsigned [pkg_windowAlignment::INDEX_WIDTH-1:0] waddrY; 
	logic unsigned [pkg_windowAlignment::INDEX_WIDTH-1:0] waddrBlock;
	logic unsigned [pkg_windowAlignment::WORDS-1:0][pkg_windowAlignment::WORD_SIZE-1:0] wdata; 
	logic we;
}struct_windowAlignment;


//----- processor control -----//	
typedef struct { 
	logic start;
	logic startVar;
	logic dblBufVar;
	logic dblBuf;
	logic [ globalDefinitions::log2(globalDefinitions::supportedCascadeStages) - 1 :0] numberOfStages;
	logic [globalDefinitions::fixedbits-1:0] inv_window_area;	
}struct_processor_control_in;

typedef struct { 
	logic ready;
	logic done;
	logic varReady;
}struct_processor_control_out;


//----- processor result -----//	
typedef struct {
	logic valid;
	logic passfail;		
} struct_processor_Result_Out;

typedef struct {
	logic taken;
} struct_processor_Result_In;


//----- store result control -----//	
typedef struct {
  logic ready;
} struct_resultStore_control_out;

typedef struct {
	logic start;
	logic unsigned [pkg_integralImageCache::integralColBits-1:0] startY;
	logic unsigned [pkg_integralImageCache::integralRowBits-1:0] startX;
	logic [globalDefinitions::scaleBits-1:0] scale;
	bit exit;
} struct_resultStore_control_in;


//----- resize control -----//	
typedef struct {  
  logic ready;
  logic done;
} struct_resize_control_out;

typedef struct {
  logic start;
  logic taken;
  logic unsigned [pkg_imageCache::colBits-1:0] imageYSize;
  logic unsigned [pkg_imageCache::rowBits-1:0] imageXSize;
  logic unsigned [pkg_imageCache::colBits-1:0] targetYSize;
  logic unsigned [pkg_imageCache::rowBits-1:0] targetXSize;  
  logic unsigned [globalDefinitions::fixedbits-1:0] factorY;
  logic unsigned [globalDefinitions::fixedbits-1:0] factorX;
} struct_resize_control_in;


//----- resize parameter generation -----//	
typedef struct {
  logic start;
  logic taken;
  logic unsigned [globalDefinitions::fixedbits-1:0] factorY;
  logic unsigned [globalDefinitions::fixedbits-1:0] factorX;
  logic unsigned [globalDefinitions::fixed-1:0] dx;
  logic unsigned [globalDefinitions::fixed-1:0] dy;
 } struct_sfGeneration_in; 
 
 typedef struct {
  logic ready;
  logic done;
  logic unsigned [globalDefinitions::fixedbits-1:0] fx;
  logic unsigned [globalDefinitions::fixedbits-1:0] fy;
  logic unsigned [globalDefinitions::fixedbits-1:0] sx;
  logic unsigned [globalDefinitions::fixedbits-1:0] sy;
 } struct_sfGeneration_out;
 
 //----- resize scale pixel generation -----//	
typedef struct {
  logic start;
  logic unsigned [globalDefinitions::fixedbits-1:0] fx;
  logic unsigned [globalDefinitions::fixedbits-1:0] fy;
  logic unsigned [globalDefinitions::fixedbits-1:0] sx;
  logic unsigned [globalDefinitions::fixedbits-1:0] sy;
  logic unsigned [globalDefinitions::fixed-1:0] dy;
  logic unsigned [globalDefinitions::fixed-1:0] dx;
 } struct_scalePixelGeneration_in; 
 
 typedef struct {
  logic ready;
 } struct_scalePixelGeneration_out;  
 
  //----- generate scaling params -----//	
typedef struct {
	logic start;   
	logic taken;
	logic unsigned [7 : 0 ] stages;
	logic unsigned [pkg_imageCache::rowBits - 1 : 0] baseImageWidth;
	logic unsigned [pkg_imageCache::colBits - 1 : 0] baseImageHeight;
	logic unsigned [globalDefinitions::fixedbits -1 : 0 ] baseScaleFactor;
	logic unsigned [globalDefinitions::fixed - 1 : 0 ] winSize;
	logic unsigned [globalDefinitions::fixed - 1 : 0 ] minWinSize;
	logic unsigned [globalDefinitions::fixedbits - 1 : 0 ] winSizeInv;
	
 } struct_scaleParams_in; 
 
 typedef struct {
	logic ready;
	logic done;
	logic unsigned [7 : 0 ] stages;
	logic unsigned [pkg_imageCache::rowBits - 1 : 0] baseImageWidth;
	logic unsigned [pkg_imageCache::colBits - 1 : 0] baseImageHeight;
	logic unsigned [pkg_imageCache::rowBits - 1 : 0] scaleImageWidth;
	logic unsigned [pkg_imageCache::colBits - 1 : 0] scaleImageHeight;
	logic unsigned [globalDefinitions::fixedbits - 1 : 0 ] scaleFactorX;
	logic unsigned [globalDefinitions::fixedbits - 1 : 0 ] scaleFactorY;
	logic unsigned [globalDefinitions::fixed - 1 : 0 ] winSize;
	logic unsigned [globalDefinitions::fixed - 1 : 0 ] minWinSize;
	logic unsigned [globalDefinitions::fixed - 1 : 0 ] trueWinSize;
	logic unsigned [globalDefinitions::fixedbits - 1 : 0 ] winSizeInv;
	logic unsigned [15:0] scaleCount;
 } struct_scaleParams_out;
 

endpackage
