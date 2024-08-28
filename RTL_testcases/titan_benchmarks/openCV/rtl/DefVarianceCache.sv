/******************** VarienceCache *********************/

/***** package *****/
package pkg_varianceCache;
	import globalDefinitions::*;

	// ---- public params ---- //
	
	// ---- private params ---- //
	
	parameter int	ADDR_WIDTH = 2;
	parameter int	WORD_SIZE_SQ = pkg_SQImageCache::SQImageDepth;
	parameter int	WORD_SIZE = pkg_integralImageCache::integralImageDepth;
	parameter int	ELM_WIDTH = elementBits;

	
endpackage