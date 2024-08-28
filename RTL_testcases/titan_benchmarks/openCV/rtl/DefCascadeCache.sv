/******************** cascadeCache *********************/

/***** package *****/
package pkg_cascadeCache;
	import globalDefinitions::*;
	
	// ---- public params ---- //	

	// number of bits to store cascade information
	parameter int cascadeCacheDataBits = fixedbits;
	
	// number of bits/words construct the whole memory
	parameter int cascadeAddressBits = log2( (numberOfFeatures*4) - 1);
	parameter int cascadeWords = numberOfFeatures*4;
	
	
	// number of bits required to count stages and classifiers
	parameter int cascadeStageBits = log2( supportedCascadeStages ); 
	parameter int cascadeClassifierBits = log2( supportedCascadeClassifiers);	
	
	// ---- private params ---- //		
	parameter int	ADDR_WIDTH = cascadeAddressBits;
	parameter int	WORDS = cascadeWords;
	parameter int	WORD_SIZE = cascadeCacheDataBits;
	
endpackage
