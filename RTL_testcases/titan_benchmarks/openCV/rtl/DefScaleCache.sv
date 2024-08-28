/******************** ScaleImageCache *********************/

/***** package *****/
package pkg_scaleCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //

	// physical size
	parameter int scaleRowSize = supportedImageWidth;
	parameter int scaleColSize = supportedImageHeight;
	
	// row and col bits needed
	parameter int scaleRowBits = log2(scaleRowSize - 1);	
	parameter int scaleColBits = log2(scaleColSize - 1);


	// bits/words needed to construct the whole memory
	parameter int scaleAddressBits = log2( (scaleRowSize * scaleColSize) - 1);	
	parameter int scaleWords = (scaleRowSize * scaleColSize);
	
	// minimum word size needed to store the intergral image
	parameter int scaleDepth = inputImageDepth;		
	
	// ---- private params ---- //		
	parameter int	WORD_SIZE = scaleDepth;
	parameter int	WORDS = scaleWords;	
	parameter int 	COL_WIDTH = scaleColBits;
	parameter int 	ROW_WIDTH = scaleRowBits;	
	parameter int	ADDR_WIDTH = scaleAddressBits;
	
endpackage
