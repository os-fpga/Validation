/******************** ResultQueue *********************/

/***** package *****/
package pkg_resultQueue;
	import globalDefinitions::*;
	
	// ---- public params ---- //
	
	// bits need to store x location of detected object
	parameter int resultQueueXBits = pkg_integralImageCache::integralRowBits;
	
	// bits need to store Y location of detected object
	parameter int resultQueueYBits = pkg_integralImageCache::integralColBits;
	
	// bits need to store how many times the origonal image has been scaled
	parameter int resultQueueScaleBits = log2(supportedScaleIterations);
	
	
	// ---- private params ---- //
	
	parameter int	WIDTH = resultQueueXBits + resultQueueYBits + resultQueueScaleBits;
	parameter int	DEPTH = resultQueueDepth;
	
endpackage




/***** interface *****/
interface intf_resultQueue_Write;
	import  pkg_resultQueue::*;
	logic unsigned [WIDTH-1:0] data;
	logic full; 	
	logic we;
endinterface

/***** interface *****/
interface intf_resultQueue_Read;
	import pkg_resultQueue::*;
	logic unsigned [WIDTH-1:0] q;
	logic empty;
	logic re;	
endinterface
