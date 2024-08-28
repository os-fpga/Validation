/******************** WindowCache *********************/

/***** package *****/
package pkg_windowCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
	// bits needed for X,Y access is not blocked
	parameter int windowBits = log2(supportedWindowSize-1);

	// bits needed for X,Y, access if blocked
	parameter int windowBlocksPerRow = CielingADivideB(supportedWindowSize,windowCacheBlocking);
	parameter int windowBlockBits = log2(windowBlocksPerRow-1);
	
	// bits needed to construct the whole memory
	parameter int windowAddressBits = log2( (windowBlocksPerRow * supportedWindowSize) - 1 );
	parameter int windowWords = windowBlocksPerRow * supportedWindowSize;
	
	// bits needed to store the virtual window size as it increases in size
	parameter int windowScaleSizeBits = (supportedImageWidth < supportedImageHeight)  ? log2(supportedImageWidth) : log2(supportedImageHeight); 
	
	
	// ---- private params ---- //		
	parameter int	ADDR_WIDTH = windowAddressBits;
	parameter int	TOTALWORDS		= windowWords;
	parameter int	WORD_SIZE = pkg_integralImageCache::integralImageDepth;
	parameter int	WORDS = windowCacheBlocking;
	parameter int	INDEX_WIDTH = windowBits;
	parameter int 	BLOCKS = windowBlocksPerRow;
	parameter int	BLOCK_WIDTH = windowBlockBits;
	parameter int	ELM_WIDTH = elementBits;
	

	
	
endpackage
