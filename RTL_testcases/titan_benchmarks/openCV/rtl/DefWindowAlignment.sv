/******************** windowAlignment *********************/

/***** package *****/
package pkg_windowAlignment;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
	// ---- private params ---- //
	
	parameter int	ADDR_WIDTH = pkg_windowCache::windowAddressBits;
	parameter int	WORD_SIZE = pkg_integralImageCache::integralImageDepth;
	parameter int	WORDS = windowCacheBlocking;
	parameter int	INDEX_WIDTH = pkg_windowCache::windowBits;	
	
endpackage

	
/***** interface *****/
interface intf_windowAlignment;
	import pkg_windowAlignment::*;
	logic unsigned [INDEX_WIDTH-1:0] waddrY; 
	logic unsigned [INDEX_WIDTH-1:0] waddrBlock;
	logic unsigned [WORDS-1:0][WORD_SIZE-1:0] wdata; 
	logic we;
endinterface
