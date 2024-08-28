/******************** featureCache *********************/

/***** package *****/
package pkg_featureCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //	
   
	// integer representation of X,Y location indexing into a window
	parameter int featureDataBits = pkg_windowCache::windowBits * 2;
	parameter int featureWords = numberOfFeatures*4;
	
	// number of bits construct the whole memory
	parameter int freatureAddressBits = log2( (numberOfFeatures*4) - 1);
	
	// ---- private params ---- //
		
	parameter int	ADDR_WIDTH = freatureAddressBits;
	parameter int	WORDS = featureWords;
	parameter int	WORD_SIZE = featureDataBits; 
	
endpackage
