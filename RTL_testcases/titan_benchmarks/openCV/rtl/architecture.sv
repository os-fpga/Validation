// architecture package for the multiscale detector

package globalDefinitions ;

	// user architecture paramiters ----------------------------------
	
	// largest supported input image
	parameter int supportedImageHeight = 245;
	parameter int supportedImageWidth = 325;
	parameter int inputImageDepth = 8;	
	
	// number of system cores
	// (currently must be a multiple of windowCacheBlocking)
	parameter int cores = 64;
		
	// largest supported number of features in the cascade classifier
	parameter int numberOfFeatures = 7500;


	// acceptable fixed point precision error when determing 
	// that two large numbers A-B = 0 (currently 0.05 << fixed)
	parameter int thresholdBias = 13107;
	
	// largest supported classifier window size
	parameter int logicalWindowSize = 30;
	
	
	// how many words per cycle can cores be filed with image data
	// (for now leave as power of 2 for computer reason)
	parameter int windowCacheBlocking = 4;
		

	// params which effect only small number of registers used for counting -------------------------
	//	all generated classifiers should be well under these limits ----------------------------------

	// largest supported number stages in any given cascade
	parameter int supportedCascadeStages = 1024;
	
	// largest supported classifiers per stage in any given cascade
	parameter int supportedCascadeClassifiers = 4096;
	
	// largest number of supported scale interations
  parameter int supportedScaleIterations = 256; 
  
  
  // number of successful detections that can be stored inbetween reads back to the main system
  parameter int resultQueueDepth = 256; 

// the fixed point decimal/integral percision
parameter int fixed = 18;
parameter int fixedInt = 18;	

	// global derived architecture paramiters from user selected params ----------------------------------	
	
	// total bits in a fixed point number
	parameter int fixedbits = fixed + fixedInt;
	parameter int scaleBits = log2(supportedScaleIterations - 1); 
	
	// minimum bit need to access block memory one elemnt at a time
	parameter int elementBits = log2( windowCacheBlocking - 1 );
	
	// physical dim of memory needed for memory
	parameter int supportedWindowSize = logicalWindowSize+1;
	
	






	
	// user enums tasks and functions ----------------------------------
		
	// take the log2 of a number and return the closest int rounded up
	// number of bits need to express the input number
	// input of 32 results in 6 not 5 becasue 32 = 100000;
	function automatic int log2 (input int n);
		//n = n - 1;		
		log2=0;
		
		if(n <= 1) return (1);			
				
		while( n >= 1 ) begin
			log2++;		
			n = n/2;			
		end
		
		return log2;
	endfunction

	// devide a by b and return the closet int rounded up
	function automatic int CielingADivideB(input int a, input int b);		
		if ( a % b == 0) return (a/b);
		else return(a/b + 1);
	endfunction
	
	
	
	
	

	
endpackage
