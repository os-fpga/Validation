/******************** IntegralImageCache *********************/

/***** package *****/
package pkg_integralImageCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //

	// physical size
	parameter int integralRowSize = supportedImageWidth  + 1;	
	parameter int integralColSize = supportedImageHeight + 1;
	
	// row and col bits needed
	parameter int integralRowBits = log2(integralRowSize - 1);	
	parameter int integralColBits = log2(integralColSize -1 );

	// bits/words needed if blocked
	parameter int integralBlocksPerRow = CielingADivideB(integralRowSize,windowCacheBlocking);
	parameter int integralBlockBits = log2(integralBlocksPerRow - 1);
	
	// addressable elements needed to construct the whole memory
	parameter int integralAddressBits = log2( (integralBlocksPerRow * integralColSize) - 1);	
	parameter int integralWords = integralBlocksPerRow * integralColSize;
	
	// minimum word size needed to store the intergral image
	parameter int integralImageDepth = log2( (supportedImageHeight * supportedImageWidth * (1 << inputImageDepth)));	
	
			

	// ---- private params ---- //		
	parameter int	WORD_SIZE 		= integralImageDepth;
	parameter int	TOTALWORDS		= integralWords;
	parameter int	WORDS 			= windowCacheBlocking;	
	parameter int 	COL_WIDTH 		= integralColBits;
	parameter int 	ROW_WIDTH 		= integralRowBits;	
	parameter int 	BLOCKS 			= integralBlocksPerRow;
	parameter int  BLOCK_WIDTH 	= integralBlockBits;
	parameter int	ADDR_WIDTH 		= integralAddressBits;
	parameter int	ELM_WIDTH 		= elementBits;

	
endpackage
