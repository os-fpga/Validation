/******************** ImageCache *********************/

/***** package *****/
package pkg_imageCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //

	// physical size
	parameter int rowSize = supportedImageWidth;
	parameter int colSize = supportedImageHeight;

	
	// row and col bits needed
	parameter int rowBits = log2(rowSize);	
	parameter int colBits = log2(colSize);

	// bits/words needed to construct the whole memory
	parameter int addressBits = log2( (rowSize * colSize) - 1);	
	parameter int words = (rowSize * colSize);
	
	
	// minimum word size needed to store the intergral image
	//parameter int depth = inputImageDepth;		
	
	// ---- private params ---- //		
	parameter int	WORD_SIZE 		= inputImageDepth;
	parameter int	WORDS 			= words;	
	parameter int 	COL_WIDTH 		= colBits;
	parameter int 	ROW_WIDTH 		= rowBits;	
	parameter int	ADDR_WIDTH		= addressBits;
	
endpackage
