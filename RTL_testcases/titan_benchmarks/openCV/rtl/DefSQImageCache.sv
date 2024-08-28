/******************** SQImageCache *********************/

/***** package *****/
package pkg_SQImageCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
	// physical size
	parameter int SQRowSize = supportedImageWidth+1;	
	parameter int SQColSize = supportedImageHeight+1;
	
	// row and col bits needed
	parameter int SQRowBits = log2(SQRowSize -1);	
	parameter int SQColBits = log2(SQColSize -1);
	
	// bits needed if blocked
	parameter int SQBlocksPerRow = CielingADivideB(SQRowSize,windowCacheBlocking);
	parameter int SQBlockBits = log2(SQBlocksPerRow - 1);

	// total address space bits
	parameter int SQAddressBits = log2((SQBlocksPerRow * SQColSize) -1);
	parameter int SQWords = SQBlocksPerRow * SQColSize;
	// minimum word size needed to store the sq image
	parameter int SQImageDepth = log2( supportedImageHeight * supportedImageWidth * (1 << inputImageDepth) * (1 << inputImageDepth) );
	
	
	// ---- private params ---- //	
	
	parameter int	WORD_SIZE = SQImageDepth;
	parameter int	TOTALWORDS = SQWords;
	parameter int	WORDS = windowCacheBlocking;	
	parameter int 	COL_WIDTH = SQColBits;
	parameter int 	ROW_WIDTH = SQRowBits;
	parameter int 	BLOCKS = SQBlocksPerRow;
	parameter int  BLOCK_WIDTH = SQBlockBits;
	parameter int	ADDR_WIDTH = SQAddressBits;	
	parameter int	ELM_WIDTH = elementBits;
	
endpackage

	
/***** interface *****/
interface intf_SQImageCache_Write;
	import  pkg_SQImageCache::*;
	logic unsigned [COL_WIDTH-1:0] waddrY;
	logic unsigned [ROW_WIDTH-1:0] waddrX;
	logic unsigned [WORD_SIZE-1:0] wdata; 	
	logic we;
endinterface

/***** interface *****/
interface intf_SQImageCache_Read;
	import  pkg_SQImageCache::*;
	logic unsigned [COL_WIDTH-1:0] raddrY;
	logic unsigned [BLOCK_WIDTH -1:0] raddrXBlock;
	logic unsigned [WORDS-1:0][WORD_SIZE-1:0] q;		
endinterface
