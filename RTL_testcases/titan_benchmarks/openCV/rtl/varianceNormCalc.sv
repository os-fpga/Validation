module varianceNormCalc
(
		input clk,resetn,start,taken,dblBuf,
		output logic ready,valid,
		
		input logic [globalDefinitions::fixedbits-1:0] inv_window_area,		
		output logic [globalDefinitions::fixedbits-1:0] varianceNormFactor,
		
		output structs::struct_varianceCache_Read_in vcrA_out,
		input structs::struct_varianceCache_Read_out vcrA_in,
		output structs::struct_varianceCache_Read_in vcrB_out,
    input structs::struct_varianceCache_Read_out vcrB_in
);

	import globalDefinitions::*;

  //create state ensums	
  typedef enum logic [6:0]	
    {	Reset,
      Ready,
		CalcArea,
		StoreArea,
		MultArea,
		StoreResult,
		StoreAreaSq,
		MultAreaSq,
		StoreResultSq,
		StoreMean,
		MultMean,
		StoreResultMean,
		CompResult,
		CheckComp,
		SubResult,
		SetOne,
		CompThres,
		CheckThres,
		SqRoot,
		Finish
    } VS_t;
	 
	 VS_t NextState,CurState;
	 
	 

	
	// create local logic signals
	logic [pkg_integralImageCache::integralImageDepth-1:0] areaReg;
	logic [pkg_SQImageCache::SQImageDepth-1:0] sqAreaReg;
	
	logic [fixedbits-1:0] preMultReg,preMultReg1;
	logic [fixedbits*2-1:0] postMultReg;
	logic [fixedbits-1:0] varReg;
	logic [fixedbits-1:0] varSqReg;
	logic [fixedbits-1:0] subResult;
	
	logic [fixed-1:0] varianceNormFactorWire;
	
	logic greater,thresCutOff;
	
	logic [2:0] count;
	logic [5:0] countSq;
	
	// create math symbols
	longint temp;
	
	logic localdblBuf;
	
	
	
	
	// update states
	always_ff @(posedge clk) begin
		if(~resetn) CurState <= Reset;
		else CurState <= NextState;
	end
	
	
	// registed logic
	always_ff @(posedge clk) begin
		if(~resetn)begin				
		end else begin
			case (CurState)
			Reset 				: 	resetAllSignals() ; 
			Ready 				: 	if(start) localdblBuf <= dblBuf;	
			CalcArea 			: begin 
											count <= count + 1;	
											case(count)
											1 : begin areaReg <= areaReg + (localdblBuf ? vcrB_in.q : vcrA_in.q); sqAreaReg <= sqAreaReg + (localdblBuf ? vcrB_in.qSQ : vcrA_in.qSQ); end
											2 : begin areaReg <= areaReg - (localdblBuf ? vcrB_in.q : vcrA_in.q); sqAreaReg <= sqAreaReg - (localdblBuf ? vcrB_in.qSQ : vcrA_in.qSQ); end
											3 : begin areaReg <= areaReg - (localdblBuf ? vcrB_in.q : vcrA_in.q); sqAreaReg <= sqAreaReg - (localdblBuf ? vcrB_in.qSQ : vcrA_in.qSQ); end
											4 : begin areaReg <= areaReg + (localdblBuf ? vcrB_in.q : vcrA_in.q); sqAreaReg <= sqAreaReg + (localdblBuf ? vcrB_in.qSQ : vcrA_in.qSQ); end
											endcase
										end
			StoreArea 			: begin preMultReg <= areaReg; preMultReg1 <= inv_window_area; end
			MultArea 			: postMultReg <= preMultReg * preMultReg1;
			StoreResult 		: varReg <= postMultReg >> (fixedbits - fixed);
			StoreAreaSq 		: begin preMultReg <= sqAreaReg; preMultReg1 <= inv_window_area; end
			MultAreaSq 			: postMultReg <= preMultReg * preMultReg1;
			StoreResultSq 		: varSqReg <= postMultReg >> (fixedbits - fixed);
			StoreMean 			: begin preMultReg <= varReg; preMultReg1 <= varReg; end
			MultMean 			 : postMultReg <= preMultReg * preMultReg1;
			StoreResultMean 	: varReg <= postMultReg >> (fixedInt);
			CompResult 			: greater <= varSqReg >= varReg;
			SubResult 			: subResult <= varSqReg - varReg;
			CompThres 			: thresCutOff <= subResult < thresholdBias;
			SetOne				   : varianceNormFactor <= 1 << fixedInt;
			SqRoot       : begin 
			                 countSq = countSq + 1;
									//if(countSq == 51) varianceNormFactor <= (varianceNormFactorWire << (fixedInt/2));
			                 if(countSq == 6) varianceNormFactor <= (varianceNormFactorWire << (fixedInt/2));
			               end
			Finish 				: begin  valid <= 1; end
			default : ;
			endcase
		end
	end
	
	// unregisted logic
	always_comb begin
		ready = (CurState == Ready);
		vcrB_out.raddr = count;
		vcrA_out.raddr = count;
		vcrB_out.raddrSQ = count;	
		vcrA_out.raddrSQ = count;
	end

  
	

	// define state transition table
	always_comb begin
		if(~resetn) begin
			NextState = Reset;
		end else begin		
			case(CurState)
				Reset 				   : NextState = Ready;
				Ready					   : NextState = start ? CalcArea : Ready;
				CalcArea					: NextState = (count == 4) ? StoreArea : CalcArea;		
				StoreArea 				: NextState = MultArea; 			
				MultArea 				: NextState = StoreResult;	 
				StoreResult 			: NextState = StoreAreaSq;	 
				StoreAreaSq 			: NextState = MultAreaSq; 			
				MultAreaSq 				: NextState = StoreResultSq;	 
				StoreResultSq 			: NextState = StoreMean;	
				StoreMean 				: NextState = MultMean; 			
				MultMean 				: NextState = StoreResultMean;	 
				StoreResultMean 		: NextState = CompResult;
				CompResult				: NextState = CheckComp;
				CheckComp				: NextState = greater ? SubResult : SetOne;
				SubResult				: NextState = CompThres;
				CompThres				: NextState = CheckThres;
				CheckThres				: NextState = thresCutOff ? SetOne : SqRoot;
				SetOne				   : NextState = Finish;
				SqRoot					  : NextState = (countSq == 50) ? Finish : SqRoot;
				Finish					: NextState = taken ? Reset : Finish;
				
				
			endcase		
		end // end if	
	end // end always	
	
	

	// instantiate internal hardware
	
	varianceSqRoot mySqRoot(.clk(clk), .ena((CurState == SqRoot)), .radical(subResult), .q(varianceNormFactorWire), .remainder());



task resetAllSignals();
  valid <= 0;
  count <= 0; 
  sqAreaReg <= 0 ; 
  areaReg <=0; 
  greater<=0; 
  thresCutOff <= 0; 
  countSq <= 0;
  preMultReg <= 0;
  preMultReg1 <= 0;
  postMultReg <= 0;
  varReg <= 0;
  varSqReg <= 0;
  subResult <= 0;
  varianceNormFactor <= 0;
endtask	




endmodule : varianceNormCalc