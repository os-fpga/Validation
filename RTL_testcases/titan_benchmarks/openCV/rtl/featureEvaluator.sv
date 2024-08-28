module featureEvaluator
  #( 
    parameter masterSlave = 1	
  )
  (		
     // input logic
    input logic clk,start,resetn,dblBuf,validVarNormilizationFactor,
    input logic [pkg_cascadeCache::cascadeStageBits - 1 : 0] numberOfStages,
    input logic [globalDefinitions::fixedbits-1:0] varNormilizationFactor,
    
    // output logic
    output logic done,ready,passfail,takenVarNormilizationFactor,valid,	
	 input logic taken,
    
    // interface to read external features
    output structs::struct_featureCache_Read_In fcr_in ,
	 input structs::struct_featureCache_Read_Out fcr_out,
	 
    output structs::struct_cascadeCache_Read_In ccr_in,
	 input structs::struct_cascadeCache_Read_Out ccr_out ,
    
    // interface to write to the window buffers from the outside world
    output structs::struct_windowCache_Read_In wcrA_out,
	 input structs::struct_windowCache_Read_Out wcrA_in,
	
	 output structs::struct_windowCache_Read_In wcrB_out,
	 input structs::struct_windowCache_Read_Out wcrB_in
    
  );
  
	// import global variables	
	import structs::*;
	import globalDefinitions::*; 
	import pkg_featureEvaluator::*;
  
	/************************************ Signals ***********************************************/
  
	// state enums 
	CS_t NextStateParam,CurStateParam, localStateParam;
	FS_t NextStateFeature,CurStateFeature;	  
  
	// pipeline latacy numbers ---  
	// number of cycles between asking for a feature location and reciving a window result
	int windowLookupCycles = 3;
  
	// number of cycles after you start a new stage before you know if the previous stage failed
	int stageFailCycles = 7;		 
   
	// counters for the which stage and classifier is being worked on
   logic [pkg_cascadeCache::cascadeStageBits-1:0] curStage, stages;
   logic [pkg_cascadeCache::cascadeClassifierBits-1:0] curClassifier, classifiers;
   
   // thresholds provided by classifierCascade
   logic [fixedbits-1:0] stageThres,classifierThres;
   logic [fixedbits-1:0] normilizedThres;
   logic [fixedbits-1:0] localVarNormilizationFactor;
	
	// does the feature contain 2 rects of 3 (8 reads to mem or 12)
   logic threeRects, threeRects1;
   
   // pipeline storeage for the stage threshold
   logic [fixedbits-1:0]stageThres1,normilizedThres1;
   
   // classifier weights and alpha values, weight is always < 0 so the register size can be smaller 
   logic [fixedbits-1:0] alpha1,alpha2,alpha11,alpha21;		
   logic [fixed-1:0] weight1,weight2,weight3;	
   
   // counters to index into feature and cascade memories
   logic [pkg_featureCache::ADDR_WIDTH - 1 : 0] featureAddr;
   logic [pkg_cascadeCache::ADDR_WIDTH - 1 : 0] cascadeAddr;
   
   // final result for the area of feature A, B and C, small registers becasue this must be integer valued
   logic [fixedInt-1:0] areaA, areaB, areaC;	
	
	// running sums compared agiast threshold values to determine pass/fail status
   logic [fixedbits-1:0] sumA,sumB,sumC,sumClassifier,stageSum;
	
	// temp register
   logic [pkg_integralImageCache::integralImageDepth-1:0] areaFeature; 
  
   // hardware enable signals
   logic featureCountEn,cascadeCountEn,cascadeCountStall;
   logic classifierCountEn, stageCountEn;
   logic finalstage,calcThres;   
   logic [2:0] calcStageFail;
   
   // hardware reset signals
   logic classifierCountReset;
   
   // signal wires from instantiate modules
   logic [fixedbits-1:0] sumAWire,sumBWire,sumCWire;
   logic [fixedbits*2-1:0] normilizedThresWire;
   logic classifierCompareWire;
   logic stageCompareSTWire,stageCompareST1Wire;
   
   logic localDblBuf;
   
   
  /************************************ Hardware ***********************************************/
  

  // update states
  always_ff @(posedge clk) begin
    
	 // update state registers
    CurStateFeature <= (~resetn) ? FS_Reset : NextStateFeature;
    CurStateParam <= (~resetn) ? CS_Reset : NextStateParam;	
    
    //  stage counter
	 if(~resetn || CurStateParam == CS_Reset ) curStage <= 1; 
   else if(stageCountEn) curStage <= curStage+1;
    
    // classifier counter
	 if(~resetn || CurStateParam == CS_Reset ) curClassifier <= 1;
    else if(classifierCountReset) curClassifier <= 1;
    else if(classifierCountEn) curClassifier <= curClassifier + 1; 
      
    // cascade memory index
	 if(~resetn || CurStateParam == CS_Reset ) cascadeAddr <=0;
   else if(cascadeCountEn) if(cascadeCountStall == 0) cascadeAddr <= cascadeAddr + 1;
    
	 // feature memory index
	 if(~resetn || CurStateFeature == FS_Reset ) featureAddr <= 0;
   else if(featureCountEn)  featureAddr <= featureAddr + 1;	    
    
	 // connect addresses to real memory if a master block
	 if(masterSlave) fcr_in.raddr <= featureAddr;	
    if(masterSlave) ccr_in.raddr <= cascadeAddr; 

  end


  
  // define param state transition table
  always_comb begin 
	   case(CurStateParam)
          CS_Reset 				                     : localStateParam = CS_Ready;
          CS_Ready					                     : localStateParam = start ? CS_GetVarianceNormilizationThres : CS_Ready;
          CS_GetVarianceNormilizationThres  : localStateParam = validVarNormilizationFactor ? CS_Stall : CS_GetVarianceNormilizationThres;
          CS_Stall					                     : localStateParam = (cascadeAddr == 1) ? CS_CountStages : CS_Stall;
          CS_CountStages			                 : localStateParam = CS_StageThreshold;
          CS_StageThreshold		               : localStateParam = CS_CountClassifiers;
          CS_CountClassifiers               : localStateParam = CS_ClassifierThreshold;
          CS_ClassifierThreshold            : localStateParam = CS_GetWeight1;
          CS_GetWeight1                     : localStateParam = CS_GetWeight2;
          CS_GetWeight2                     : localStateParam = threeRects ? CS_GetWeight3 : CS_GetAlpha1;
          CS_GetWeight3                     : localStateParam = CS_GetAlpha1;
          CS_GetAlpha1                      : localStateParam = CS_GetAlpha2;
          CS_GetAlpha2                      : begin
                                                if(CurStateFeature == (threeRects ? FS_F3D : FS_F2D)) begin
                                                  if(curClassifier < classifiers) localStateParam = CS_ClassifierThreshold;
                                                  else if ( curStage < stages) localStateParam = CS_StageThreshold;                
                                                  else localStateParam = CS_Done;
                                                end else begin
                                                  localStateParam = CS_GetAlpha2; 
                                                end         
                                              end                                           
          CS_Done                           : localStateParam = CS_Done;    
			   default 									                  : localStateParam = CS_Reset;
      endcase		
      
      if(masterSlave == 1)
        NextStateParam = (taken == 1) ? CS_Reset : localStateParam;
      else 
        NextStateParam = (taken == 1) ? CS_Reset : ((done == 1) ? CS_Done : localStateParam);
        
  end 
  
  logic paramDone;
  
  // define feature state transition table
  always_comb begin
    
    paramDone <= 	((CurStateParam == CS_Done) || (CurStateParam == CS_Ready)	|| (CurStateParam == CS_Reset));
    
     case(CurStateFeature)
        FS_Reset				     : NextStateFeature = FS_Ready;
        FS_Ready				     : NextStateFeature = start ? FS_Stall : FS_Ready;
        FS_Stall         : NextStateFeature = (featureAddr == windowLookupCycles) ? FS_F1A : FS_Stall;
        FS_F1A					      : NextStateFeature = FS_F1B;
        FS_F1B					      : NextStateFeature = FS_F1C;
        FS_F1C					      : NextStateFeature = FS_F1D;
        FS_F1D					      : NextStateFeature = FS_F2A;
        FS_F2A					      : NextStateFeature = FS_F2B;
        FS_F2B					      : NextStateFeature = paramDone ? FS_Reset : FS_F2C;
        FS_F2C					      : NextStateFeature = paramDone ? FS_Reset : FS_F2D;
        FS_F2D					      : NextStateFeature = paramDone ? FS_Reset : threeRects ? FS_F3A : FS_F1A;
        FS_F3A					      : NextStateFeature = paramDone ? FS_Reset : FS_F3B;
        FS_F3B					      : NextStateFeature = paramDone ? FS_Reset : FS_F3C;
        FS_F3C					      : NextStateFeature = paramDone ? FS_Reset : FS_F3D;
        FS_F3D					      : NextStateFeature = paramDone ? FS_Reset : FS_F1A;
        default 						   : NextStateFeature = FS_Reset;
      endcase
      
      
      
      
  end // end always
  
  
  // define cascade state data path
  always_ff @(posedge clk) begin	 	 
       case(CurStateParam)
        CS_Reset                				      : begin
                                              localVarNormilizationFactor = 0;
                                              stages=0;     
                                              stageThres = 0;
                                              stageThres1 = 0;    
                                              classifiers = 0;    
                                              classifierThres = 0;                                                 
                                              alpha1 = 0; 
                                              alpha2 = 0;
                                              alpha21 = 0;
                                              weight1 = 0; 
                                              weight2 = 0;
                                              weight3 = 0;  
                                              threeRects=0;
                                              threeRects1=0;
                                            end 
        CS_Ready                          : begin 
                                              if(start) begin
                                                stages <= numberOfStages;
                                                localDblBuf <= dblBuf;
                                              end
                                            end 
        CS_GetVarianceNormilizationThres 	: localVarNormilizationFactor <= varNormilizationFactor;
        CS_CountStages          				      : if(stages == 0) stages <= ccr_out.q;	
        CS_StageThreshold       				      : 	begin 
																              stageThres1 <= stageThres; 
																              stageThres <= signed'(ccr_out.q);                                     
															               end
        CS_CountClassifiers     				      : classifiers <= ccr_out.q;	
        CS_ClassifierThreshold            : begin 
                                              classifierThres <= signed'(ccr_out.q[pkg_cascadeCache::WORD_SIZE - 2 : 0]);	
                                              threeRects <= ccr_out.q[pkg_cascadeCache::WORD_SIZE - 1];  
                                              threeRects1 <= threeRects;
                                              alpha21 <= alpha2;
                                            end
        CS_GetAlpha1                      : alpha1 <= signed'(ccr_out.q);	
        CS_GetAlpha2                      : alpha2 <= signed'(ccr_out.q);
        CS_GetWeight1                     : weight1 <= signed'(ccr_out.q);	
        CS_GetWeight2                     : weight2 <= signed'(ccr_out.q);
        CS_GetWeight3                     : weight3 <= signed'(ccr_out.q);           
      endcase	
  end
  
 
  // define feature state data path
  always_ff @(posedge clk) begin	  
		case(CurStateFeature)
			 FS_Reset :  begin
			                areaFeature <= 0;
                      areaA <= 0;
                      areaB <= 0;
                      areaC <= 0;	
			             end 
			 FS_F1A    : areaFeature <= (localDblBuf ? wcrB_in.q: wcrA_in.q); 
			 FS_F1B    : areaFeature <= areaFeature - (localDblBuf ? wcrB_in.q: wcrA_in.q);
			 FS_F1C    : areaFeature <= areaFeature - (localDblBuf ? wcrB_in.q: wcrA_in.q);
			 FS_F1D    : areaA <= areaFeature + (localDblBuf ? wcrB_in.q: wcrA_in.q);
			 FS_F2A    : areaFeature <= (localDblBuf ? wcrB_in.q: wcrA_in.q);  
			 FS_F2B    : areaFeature <= areaFeature - (localDblBuf ? wcrB_in.q: wcrA_in.q);
			 FS_F2C    : areaFeature <= areaFeature - (localDblBuf ? wcrB_in.q: wcrA_in.q);
			 FS_F2D    : areaB <= areaFeature + (localDblBuf ? wcrB_in.q: wcrA_in.q);
			 FS_F3A    : areaFeature <= (localDblBuf ? wcrB_in.q: wcrA_in.q);
			 FS_F3B    : areaFeature <= areaFeature - (localDblBuf ? wcrB_in.q: wcrA_in.q);
			 FS_F3C    : areaFeature <= areaFeature - (localDblBuf ? wcrB_in.q: wcrA_in.q);
			 FS_F3D    : areaC <= areaFeature + (localDblBuf ? wcrB_in.q: wcrA_in.q);
			endcase 
		
		// store area of feature one * weight one
		if(~resetn || CurStateParam == CS_Reset ) sumA<=0;
		else if(CurStateFeature == FS_F1B) sumA <= sumAWire;
		
		// store area of feature two * weight two
		if(~resetn || CurStateParam == CS_Reset) sumB<=0;
		else if(CurStateFeature == FS_F1B) sumB <= sumBWire;
		
		// store area of feature three * weight three
		if(~resetn || CurStateParam == CS_Reset ) sumC<=0;
		else if(CurStateFeature == FS_F1B) sumC <= sumCWire;

		// store total result for the classifier
		if(~resetn || CurStateParam == CS_Reset ) sumClassifier<=0;
		else if(CurStateFeature == FS_F1C) sumClassifier <= sumA + sumB;
		else if(CurStateFeature == FS_F1D) if (threeRects1) sumClassifier <= sumClassifier + sumC;
		
		// add classifier result to the total for the whole stage
		if(~resetn || CurStateParam == CS_Reset) stageSum<=0;
		else if(calcStageFail == stageFailCycles) stageSum <= 0; 
		else if(CurStateFeature == FS_F2A) stageSum <= stageSum + (classifierCompareWire ? alpha21 : alpha11);
		
		
		// forward alpha1 into alpha11 as it can be need a few cycles after a new alpha1 is store from the next classifier
		if(~resetn || CurStateParam == CS_Reset ) alpha11 <= 0;
		else if(CurStateParam==CS_ClassifierThreshold) alpha11 <= alpha1;
		else if(CurStateParam==CS_GetAlpha1) alpha11 <= alpha1;		
    else if (calcStageFail == 1) alpha11 <= alpha1;
          
			 

    end
   
   
   
   // main data path pipeline
   always_ff @(posedge clk) begin
	  if(~resetn || CurStateParam == CS_Reset ) begin
		done <= 0;
		passfail <= 0;
		calcStageFail <= 0;
	  end else begin
      if(done == 1) begin
        if(taken) done <= 0;
      end else  if(done == 0) begin 
		  // && CurStateParam != CS_Donefinal
			// unpack data into X and Y coordinates			
			if(!localDblBuf) begin
				wcrA_out.raddrX <= fcr_out.q[pkg_windowCache::windowBits-1:0];
				wcrA_out.raddrY <= fcr_out.q[pkg_windowCache::windowBits*2-1:pkg_windowCache::windowBits];			
			end else begin
				wcrB_out.raddrX <= fcr_out.q[pkg_windowCache::windowBits-1:0];
				wcrB_out.raddrY <= fcr_out.q[pkg_windowCache::windowBits*2-1:pkg_windowCache::windowBits];			
			end	

			
			if(CurStateParam == CS_StageThreshold || finalstage == 1) begin      
				calcStageFail <= 1;     
			end else if(calcStageFail > 0) begin
				if(calcStageFail < stageFailCycles)begin        
					calcStageFail <= calcStageFail + 1;
				end else begin
					calcStageFail <= 0;
					done <= (CurStateParam == CS_Done) ? 1 : stageCompareST1Wire;	
					if((CurStateParam == CS_Done)) passfail <= ~stageCompareSTWire; 		 
				end
			end  
	  end    
    end
    
    

      if(~resetn || CurStateParam == CS_Reset ) calcThres <= 0;
      if(CurStateParam == CS_GetWeight1 || CurStateParam == CS_StageThreshold) calcThres <= 1; 
		else calcThres <=0;
      
		
		if(~resetn || CurStateParam == CS_Reset ) begin
				normilizedThres <= 0;
				normilizedThres1 <= 0;
		end else if(calcThres == 1 ) begin
           normilizedThres <= normilizedThresWire >>> fixed;
           normilizedThres1 <= normilizedThres;
           
      end
      
      
       
        
    end
    
    
    
  // combinational state-controlled paramiters
  always_comb begin
    featureCountEn <= (CurStateFeature != FS_Reset) && (CurStateFeature != FS_Ready) && (CurStateParam != CS_Done) && (CurStateParam != CS_GetVarianceNormilizationThres);
    cascadeCountEn <= (CurStateParam != CS_Done &&  CurStateParam != CS_Ready &&  CurStateParam != CS_Reset) && (CurStateParam != CS_GetVarianceNormilizationThres);	
    ready <= (CurStateParam == CS_Ready) && (CurStateFeature == FS_Ready); 
    takenVarNormilizationFactor <= (CurStateParam == CS_GetVarianceNormilizationThres);
    valid <= done; //CurStateParam == CS_Done;
    
  end
  
  // registered state-controled paramiters
  always_ff @(posedge clk) begin
	
	
		if(~resetn || CurStateParam == CS_Reset ) cascadeCountStall <= 0;
		else begin
		  if( threeRects == 0 ) begin
			if(CurStateParam == CS_GetWeight1) cascadeCountStall <= 1;
			else if(CurStateFeature == FS_F2A) cascadeCountStall <= 0;
		  end else begin
			if(CurStateParam == CS_GetWeight2) cascadeCountStall <= 1;
			else if(CurStateFeature == FS_F3A) cascadeCountStall <= 0;
		  end
	  end
     
   if (NextStateParam == CS_Done && CurStateParam != CS_Done) finalstage <= 1;
   else finalstage <= 0;
       
	if(~resetn || CurStateParam == CS_Reset ) classifierCountEn <= 0;   
   else if(CurStateParam == CS_GetAlpha2) begin
		if(CurStateFeature == (threeRects ? FS_F3D : FS_F2D)) begin
			if(curClassifier < classifiers) classifierCountEn <= 1;
		end else begin
			classifierCountEn <=0;
		end
	end else classifierCountEn <=0;

	if(~resetn || CurStateParam == CS_Reset ) stageCountEn <= 0;   
   else if(CurStateParam == CS_GetAlpha2) begin
		if(CurStateFeature == (threeRects ? FS_F3D : FS_F2D)) begin
			if(curClassifier >= classifiers) begin
				if ( curStage < stages) stageCountEn <= 1;
				else stageCountEn <= 0;
			end else stageCountEn <= 0;	
		end else stageCountEn <= 0;
	end else stageCountEn <=0;
	
	if(~resetn || CurStateParam == CS_Reset ) classifierCountReset <= 0;   
   else if(CurStateParam == CS_GetAlpha2) begin 
		if(CurStateFeature == (threeRects ? FS_F3D : FS_F2D)) begin
			if(curClassifier >= classifiers) begin
				if ( curStage < stages) classifierCountReset <= 1;	
				else classifierCountReset <= 0;
			end else classifierCountReset <= 0;
		end else classifierCountReset <= 0;
	end else classifierCountReset <=0;
       
  end
  
  // lpm multipliers
  weightSumMult myWeightSumMult1(1'd1,clk,areaA,weight1,sumAWire);
  weightSumMult myWeightSumMult2(1'd1,clk,areaB,weight2,sumBWire);
  weightSumMult myWeightSumMult3(1'd1,clk,areaC,weight3,sumCWire);
  classifierThresholdMult myclassifierThresholdMult 
    (1'd1,clk,classifierThres,localVarNormilizationFactor,normilizedThresWire);
  classifierCompare myClassifierCompare(sumClassifier,normilizedThres1,classifierCompareWire);
  stageCompare myClassifierCompareST1(stageSum,stageThres1,stageCompareST1Wire);
  stageCompare myClassifierCompareST(stageSum,stageThres,stageCompareSTWire);	
  
endmodule : featureEvaluator



