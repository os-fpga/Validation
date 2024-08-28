//auto-generated LUControl.v
//control block that creates all the control signals
//by Wei Zhang

module LUControl (clk, start_in, m_in, n_in, loop_in, mode_in, done,
					curReadAddr, curWriteAddr, curWriteByteEn, curWriteEn, curWriteSel, 
					leftReadAddr, leftWriteAddr, leftWriteByteEn, leftWriteEn,  leftWriteSel,
					topReadAddr, topWriteAddr, topWriteEn, topWriteSel, topSourceSel, diagEn, MOSel, MOEn);

parameter NUMPE = 230, PEWIDTH = 8;
parameter BLOCKWIDTH = 8, BLOCKDIVK = 1, BLOCKDIVKWIDTH = 1;
parameter INTDIVLAT = 15;
parameter CURLAT = 5, LEFTLAT = 5, TOPLAT = 6, DIVLAT = 51;
parameter DIVLATWIDTH = 6, MADELAY = 32, MCDELAY = 16, MDELAY = 12;
parameter LTDELAY = 1;
parameter MAXCURLEFTLAT = 5, MAXTOPLEFTLAT = 6, MAXCURTOPLAT = 6;
parameter RAMNUMBYTES = 920, RAMSIZEWIDTH = 8, TOPSIZEWIDTH = 16;

input clk, start_in;
input[BLOCKWIDTH-1:0] m_in, n_in, loop_in;
input[1:0] mode_in;
output done;

output[RAMNUMBYTES-1:0] curWriteByteEn;
output[RAMSIZEWIDTH-1:0] curWriteAddr, curReadAddr;
output curWriteEn;

output[RAMNUMBYTES-1:0] leftWriteByteEn;
output[RAMSIZEWIDTH-1:0] leftWriteAddr, leftReadAddr;
output leftWriteEn;

output[TOPSIZEWIDTH-1:0] topWriteAddr, topReadAddr;
output topWriteEn;

output leftWriteSel, curWriteSel, topSourceSel, diagEn;
output[PEWIDTH-1:0] topWriteSel;

output MOSel;
output MOEn;

parameter SETUP = 0, START = 1, FETCH_COL = 2, WAIT_COL = 3, FIND_REC = 4, MULT_COL = 5, UPDATE_J = 6,
		  STORE_MO = 7, MULT_SUB = 8, INCRE_I = 9, WAIT = 10, DONE = 11,  STORE_DIAG = 12, STORE_DIAG2 = 13, START_FETCH_ROW = 14;
parameter ROW_WAIT = 0, FETCH_ROW = 1, DONE_FETCH_ROW = 2, LOAD_ROW_INC_J = 3;

reg start, startDelay[INTDIVLAT:0];
reg[BLOCKWIDTH-1:0] m, n, stop, stop2, loop;
reg[1:0] mode;
reg[3:0] nextState, currentState;
reg[1:0] nextRowState, currentRowState;
reg startFetchRow, doneFetchRow, loadRow, writeRow;
reg updateCounter;

reg[BLOCKWIDTH-1:0] i1, j;
reg[TOPSIZEWIDTH-1:0] nextTopIdx, nextTopIdx2, curTopIdx, nextTopIdxCounter;
reg[BLOCKDIVKWIDTH-1:0] topIdx, topIdxCounter, mdivk;
reg[RAMSIZEWIDTH-1:0] diagIdx, leftIdx, msIdx;
reg[PEWIDTH-1:0] imodk, i1modk;
reg[RAMSIZEWIDTH-1:0] diagIdxCounter, leftIdxCounter, msIdxCounter, readRowCounter, topWriteCounter;
reg[RAMNUMBYTES-1:0] byteEn, i1modkByteEn;

reg done;

reg[RAMNUMBYTES-1:0] curWriteByteEn;
reg[RAMSIZEWIDTH-1:0] curWriteAddr, curReadAddr;
reg curWriteEn;

reg[RAMNUMBYTES-1:0] leftWriteByteEn;
reg[RAMSIZEWIDTH-1:0] leftWriteAddr, leftReadAddr;
reg leftWriteEn;

reg[TOPSIZEWIDTH-1:0] topWriteAddr, topReadAddr;
reg topWriteEn;

reg leftWriteSel, curWriteSel, topSourceSel, diagEn;
reg[PEWIDTH-1:0] topWriteSel;

reg MOSel;
reg MOEn;

reg[RAMSIZEWIDTH-1:0] counter;
reg[DIVLATWIDTH-1:0] divCounter;

reg[RAMNUMBYTES-1:0] writeByteEnDelay[MADELAY-1:0];
reg[RAMSIZEWIDTH-1:0] curWriteAddrDelay[MADELAY-1:0], curReadAddrDelay[MDELAY-1:0];
reg leftWriteEnDelay[MADELAY-1:0], curWriteEnDelay[MADELAY-1:0];
reg leftWriteSelDelay[CURLAT-1:0], curWriteSelDelay[MCDELAY-1:0];
reg[RAMSIZEWIDTH-1:0] leftReadAddrDelay[LTDELAY-1:0];
reg[TOPSIZEWIDTH-1:0] topWriteAddrDelay[MADELAY-1:0];
reg topWriteEnDelay[MADELAY-1:0], topSourceSelDelay[CURLAT-1:0];
reg[PEWIDTH-1:0] topWriteSelDelay[MADELAY-1:0];
reg diagEnDelay[TOPLAT-1:0];
reg MOEnDelay[MAXTOPLEFTLAT-1:0];
reg [RAMSIZEWIDTH-1:0] waitCycles;

// register store m, n and mdivk value
always @ (posedge clk)
begin
	if (start_in == 1)
	begin
		n <= n_in;
		m <= m_in;
		loop <= loop_in;
		mode <= mode_in;
	end
	if (mode[0] == 0 && m == loop)
		stop <= loop;
	else
		stop <= loop+1;
	stop2 <= loop;
	startDelay[0] <= start_in;
	startDelay[1] <= startDelay[0];
	startDelay[2] <= startDelay[1];
	startDelay[3] <= startDelay[2];
	startDelay[4] <= startDelay[3];
	startDelay[5] <= startDelay[4];
	startDelay[6] <= startDelay[5];
	startDelay[7] <= startDelay[6];
	startDelay[8] <= startDelay[7];
	startDelay[9] <= startDelay[8];
	startDelay[10] <= startDelay[9];
	startDelay[11] <= startDelay[10];
	startDelay[12] <= startDelay[11];
	startDelay[13] <= startDelay[12];
	startDelay[14] <= startDelay[13];
	startDelay[15] <= startDelay[14];
	start <= startDelay[15];
	mdivk <= (m+NUMPE-1)/NUMPE;
end

// registers that store values that are used in FSM, dependent on i and/or j
always @ (posedge clk)
begin
	if (start == 1)
		topIdx <= 0; //offset1divk;
	else if (currentState == INCRE_I && i1modk == NUMPE-1 && mode[0] == 0)
		topIdx <= topIdx + 1;
		
	if (start == 1)
		diagIdx <= 0; //offsetdivk;
	else if (currentState == STORE_DIAG && mode == 1)
		diagIdx <= BLOCKDIVK; //uppermdivk;
	else if (currentState == INCRE_I)
	begin
		if ((imodk == NUMPE-1 && mode == 0) || (i1modk == NUMPE-1 && mode == 1))
			diagIdx <= diagIdx + BLOCKDIVK + 1;
		else
			diagIdx <= diagIdx + BLOCKDIVK;
	end
	
	if (start == 1)
		leftIdx <= 0;
	else if (currentState == INCRE_I)
	begin
		if (i1modk == NUMPE-1 && mode[0] == 0)
			leftIdx <= leftIdx + BLOCKDIVK + 1;
		else
			leftIdx <= leftIdx + BLOCKDIVK;
	end

	if (start == 1)
		msIdx <= 0;
	else if (currentState == UPDATE_J)
		if (mode[1] == 0)
			msIdx <= leftIdx + BLOCKDIVK;
		else
			msIdx <= topIdx;
	else if (nextRowState == LOAD_ROW_INC_J)
		msIdx <= msIdx + BLOCKDIVK;

	if (start == 1)
		imodk <= 0; //offsetmodk;
	else if (currentState == INCRE_I)
	begin
		if (imodk == NUMPE-1)
			imodk <= 0;
		else
			imodk <= imodk + 1;
	end
	
	if (start == 1)
		i1modk <= 1; //offset1modk;
	else if (currentState == INCRE_I)
	begin
		if (i1modk == NUMPE-1)
			i1modk <= 0;
		else
			i1modk <= i1modk + 1;
	end
	
	if (start == 1)
			nextTopIdx <= 0;
	else if (currentState == INCRE_I)
		if (mode[1] == 0)
			nextTopIdx <= nextTopIdx + n + 1;
		else
			nextTopIdx <= nextTopIdx + n;
 nextTopIdx2 <= nextTopIdx + n + 1;

	if (start == 1)
		curTopIdx <= 1;
	else if (currentState == UPDATE_J)
   if (mode[1] == 0)
		  curTopIdx <= nextTopIdx+1;
   else
		  curTopIdx <= nextTopIdx;
	else if (nextRowState == LOAD_ROW_INC_J)
		curTopIdx <= curTopIdx + 1;
	
	if (start == 1)
	   i1 <= 1;
	else if (currentState == INCRE_I)
	   i1 <= i1 + 1;

	if (start == 1)
		j <= 0;
	else if (currentState == UPDATE_J)
		if (mode[1] == 0)
			j <= i1;
		else
			j <= 0;
	else if (currentRowState == LOAD_ROW_INC_J)
		j <= j + 1;

// compute cycles of delay in FSM
	if (currentState == STORE_MO)
		waitCycles <= MADELAY-1;
	else if (currentState == INCRE_I)
	begin
		if (i1 == stop-1)
			if (mode[1] == 1)
				waitCycles <= MADELAY-1 + MAXCURTOPLAT - 3;
			else
				waitCycles <= waitCycles + MAXCURLEFTLAT - 2;
		else if (mode == 1 && waitCycles < MADELAY-1 - (MCDELAY-1) - 4)
			waitCycles <= MADELAY-1 - (MCDELAY-1) - 4;
		else if (mode == 2 && i1modk == NUMPE-1)
			waitCycles <= MADELAY-1 + MAXCURTOPLAT - 3;
		else if (mode == 0)
			waitCycles <= waitCycles + MAXCURTOPLAT ;
	end
	else if (waitCycles > 0)
		waitCycles <= waitCycles - 1;

end

// determining next state of main FSM
always @ (*)
begin
	case (currentState)
	SETUP:
	begin
		if (start == 1)
			nextState = START;
		else
			nextState = SETUP;
		updateCounter = 1;
	end
	START:
	begin
		if (mode == 0)
		begin
			if (m == 1 && n == 1)
				nextState = DONE;
			else
				nextState = FETCH_COL;
		end
		else if (mode == 1)
			nextState = STORE_DIAG;
		else if (mode == 2)
			nextState = START_FETCH_ROW;
		else
			nextState = UPDATE_J;
		updateCounter = 1;
	end
	START_FETCH_ROW:
	begin
		if (counter == CURLAT+TOPLAT-1)
   begin
		  if (mode == 0)
			  nextState = STORE_DIAG;
		  else
			  nextState = UPDATE_J;
	  end
		else
			nextState = START_FETCH_ROW;
		updateCounter = 0;
	end
	FETCH_COL:
		if (counter >= mdivk-1)
		begin
			if (mode == 0 && counter < CURLAT)
			begin
				nextState = WAIT_COL;
				updateCounter = 0;
			end
			else
			begin
				if (mode == 0)
					nextState = START_FETCH_ROW;
				else
					nextState = FIND_REC;
				updateCounter = 1;
			end
		end
		else
		begin
			nextState = FETCH_COL;
			updateCounter = 0;
		end
	WAIT_COL:
		if (counter >= CURLAT)
		begin
			if (mode == 0)
				nextState = START_FETCH_ROW;
			else
				nextState = FIND_REC;
			updateCounter = 1;
		end
		else
		begin
			nextState = WAIT_COL;
			updateCounter = 0;
		end
	STORE_DIAG:
	begin
		if (mode == 0)
			nextState =  FIND_REC;
		else
			nextState =  FETCH_COL;
		updateCounter = 1;
	end
	FIND_REC:
		if (divCounter == DIVLAT)
		begin
			if (mode == 0)
				nextState = MULT_COL;
			else
				nextState = STORE_DIAG2;
			updateCounter = 1;
		end
		else
		begin
			nextState = FIND_REC;
			updateCounter = 0;
		end
	STORE_DIAG2:
	begin
		nextState =  MULT_COL;
		updateCounter = 1;
	end
	MULT_COL:
		if (topIdxCounter == mdivk-1)
		begin
			nextState = UPDATE_J;
			updateCounter = 0;
		end
		else
		begin
			nextState = MULT_COL;
			updateCounter = 0;
		end
	UPDATE_J:
		if ((mode[1] == 1 || counter >= MCDELAY-1) && doneFetchRow == 1)
		begin
			nextState = STORE_MO;
			updateCounter = 1;
		end
		else
		begin
			nextState = UPDATE_J;
			updateCounter = 0;
		end
	STORE_MO:
	begin
		if (j == stop2)
		begin
			if (counter == mdivk-1+MAXCURLEFTLAT-2)
				nextState = DONE;
			else
				nextState = STORE_MO;
			updateCounter = 0;
		end
		else
		begin
			nextState =  MULT_SUB;
			updateCounter = 1;
		end
	end
	MULT_SUB:
		if (topIdxCounter == mdivk-1)
		begin
			if (j == n-1)
				nextState = INCRE_I;
			else
				nextState = MULT_SUB;
			updateCounter = 1;
		end
		else
		begin
			nextState = MULT_SUB;
			updateCounter = 0;
		end
	INCRE_I:
	begin
		nextState = WAIT;
		updateCounter = 1;
	end
	WAIT:
		if (waitCycles == 0)
		begin
			if (i1 == stop)
				nextState = DONE;
			else if (mode == 0)
				nextState = STORE_DIAG;
			else if (mode == 1)
				nextState = FIND_REC;
			else
				nextState = UPDATE_J;
			updateCounter = 1;
		end
		else
		begin
			nextState = WAIT;
			updateCounter = 0;
		end
	DONE:
	begin
		nextState = DONE;
		updateCounter = 0;
	end
	default:
	begin
		nextState = SETUP;
		updateCounter = 1;
	end
	endcase
end

always @ (*)
begin
	if (currentRowState == DONE_FETCH_ROW)
		doneFetchRow = 1;
	else
		doneFetchRow = 0;
		if((nextState == START_FETCH_ROW && currentState != START_FETCH_ROW && i1 == 1))
		startFetchRow = 1;
	else
		startFetchRow = 0;
	if (currentState == MULT_SUB && topIdxCounter+2 == mdivk)
		loadRow = 1;
	else
		loadRow = 0;
	writeRow = (msIdxCounter == readRowCounter)&&(currentState==MULT_SUB)&&(j!=n)&&(mode[0] == 0);
end

// second FSM that controls the control signals to temp_top block
always @ (*)
begin
	case (currentRowState)
	FETCH_ROW:
		if (nextTopIdxCounter == n-1)
			nextRowState = DONE_FETCH_ROW;
		else
			nextRowState = FETCH_ROW;
	DONE_FETCH_ROW:
		if (startFetchRow == 1)
			nextRowState = FETCH_ROW;
		else if (loadRow == 1 || (topIdx+1 == mdivk && nextState == MULT_SUB))
			nextRowState = LOAD_ROW_INC_J;
		else
			nextRowState = DONE_FETCH_ROW;
	LOAD_ROW_INC_J:
		if (topIdx+1 == mdivk && nextState == MULT_SUB)
			nextRowState = LOAD_ROW_INC_J;
		else
			nextRowState = DONE_FETCH_ROW;
	default:
		nextRowState = DONE_FETCH_ROW;
	endcase
end

// address counters
always @ (posedge clk)
begin
	if (updateCounter == 1 || currentRowState == LOAD_ROW_INC_J)
		topIdxCounter <= topIdx;
	else
		topIdxCounter <= topIdxCounter + 1;

	if (updateCounter == 1)
		diagIdxCounter <= diagIdx;
	else
		diagIdxCounter <= diagIdxCounter + 1;

	if (updateCounter == 1 || currentRowState == LOAD_ROW_INC_J)
		msIdxCounter <= msIdx;
	else
		msIdxCounter <= msIdxCounter + 1;

	if (updateCounter == 1 || currentRowState == LOAD_ROW_INC_J)
		leftIdxCounter <= leftIdx;
	else
		leftIdxCounter <= leftIdxCounter + 1;
	
	if (currentState == FETCH_COL || currentState == STORE_MO)
		topWriteCounter <= i1;
	else if (writeRow == 1 || currentRowState == FETCH_ROW)
		topWriteCounter <= topWriteCounter + 1;

	if (currentState == START)
		nextTopIdxCounter <= nextTopIdx;
 else if (currentState == STORE_MO)
		if (mode[1] == 0)
			nextTopIdxCounter <= nextTopIdx + n + 1;
		else
			nextTopIdxCounter <= nextTopIdx + n;
	else if (writeRow == 1 || currentRowState == FETCH_ROW)
		nextTopIdxCounter <= nextTopIdxCounter + 1;

	if (currentState == START)
			readRowCounter <= 0; //offsetdivk;
	else if (currentState == STORE_MO)
		if (mode[1] == 0)
			readRowCounter <= leftIdx + BLOCKDIVK;
		else
			readRowCounter <= topIdx;
	else if (writeRow == 1 || currentRowState == FETCH_ROW)
	   readRowCounter <= readRowCounter + BLOCKDIVK;

	if (updateCounter == 1)
		counter <= 0;
	else
		counter <= counter + 1;

	if (currentState == STORE_DIAG || currentState == STORE_DIAG2)
		divCounter <= 0;
	else if (divCounter < DIVLAT)
		divCounter <= divCounter + 1;

	i1modkByteEn <= ~(920'h0) >> (i1modk*4);
end

// compute Byte Enable
always @ (posedge clk)
begin
	if ((nextState == MULT_COL && currentState != MULT_COL) || (currentState == STORE_MO) || currentRowState == LOAD_ROW_INC_J)
		byteEn <= i1modkByteEn;
	else
		byteEn <= ~0;
end

// update FSM state register
always @ (posedge clk)
begin
	if (start_in == 1)
		currentState <= SETUP;
	else
		currentState <= nextState;
	if (start == 1)
		currentRowState <= DONE_FETCH_ROW;
	else
		currentRowState <= nextRowState;
end

// delay register for control signals
// control signals are delayed to match latency of operations and/or memory access
always @ (posedge clk)
begin
	curReadAddrDelay[0] <= curReadAddrDelay[1];
	curReadAddrDelay[1] <= curReadAddrDelay[2];
	curReadAddrDelay[2] <= curReadAddrDelay[3];
	curReadAddrDelay[3] <= curReadAddrDelay[4];
	curReadAddrDelay[4] <= curReadAddrDelay[5];
	curReadAddrDelay[5] <= curReadAddrDelay[6];
	curReadAddrDelay[6] <= curReadAddrDelay[7];
	curReadAddrDelay[7] <= curReadAddrDelay[8];
	curReadAddrDelay[8] <= curReadAddrDelay[9];
	curReadAddrDelay[9] <= curReadAddrDelay[10];
	curReadAddrDelay[10] <= curReadAddrDelay[11];
	curReadAddrDelay[11] <= msIdxCounter;
	
	curWriteAddrDelay[0] <= curWriteAddrDelay[1];
	curWriteAddrDelay[1] <= curWriteAddrDelay[2];
	curWriteAddrDelay[2] <= curWriteAddrDelay[3];
	curWriteAddrDelay[3] <= curWriteAddrDelay[4];
	if (currentState == FETCH_COL)
		curWriteAddrDelay[4] <= diagIdxCounter;
	else
		curWriteAddrDelay[4] <= curWriteAddrDelay[5];
	curWriteAddrDelay[5] <= curWriteAddrDelay[6];
	curWriteAddrDelay[6] <= curWriteAddrDelay[7];
	curWriteAddrDelay[7] <= curWriteAddrDelay[8];
	curWriteAddrDelay[8] <= curWriteAddrDelay[9];
	curWriteAddrDelay[9] <= curWriteAddrDelay[10];
	curWriteAddrDelay[10] <= curWriteAddrDelay[11];
	curWriteAddrDelay[11] <= curWriteAddrDelay[12];
	curWriteAddrDelay[12] <= curWriteAddrDelay[13];
	curWriteAddrDelay[13] <= curWriteAddrDelay[14];
	curWriteAddrDelay[14] <= curWriteAddrDelay[15];
	if (currentState == MULT_COL)
		curWriteAddrDelay[15] <= leftIdxCounter;
	else
		curWriteAddrDelay[15] <= curWriteAddrDelay[16];
	curWriteAddrDelay[16] <= curWriteAddrDelay[17];
	curWriteAddrDelay[17] <= curWriteAddrDelay[18];
	curWriteAddrDelay[18] <= curWriteAddrDelay[19];
	curWriteAddrDelay[19] <= curWriteAddrDelay[20];
	curWriteAddrDelay[20] <= curWriteAddrDelay[21];
	curWriteAddrDelay[21] <= curWriteAddrDelay[22];
	curWriteAddrDelay[22] <= curWriteAddrDelay[23];
	curWriteAddrDelay[23] <= curWriteAddrDelay[24];
	curWriteAddrDelay[24] <= curWriteAddrDelay[25];
	curWriteAddrDelay[25] <= curWriteAddrDelay[26];
	curWriteAddrDelay[26] <= curWriteAddrDelay[27];
	curWriteAddrDelay[27] <= curWriteAddrDelay[28];
	curWriteAddrDelay[28] <= curWriteAddrDelay[29];
	curWriteAddrDelay[29] <= curWriteAddrDelay[30];
	curWriteAddrDelay[30] <= curWriteAddrDelay[31];
	curWriteAddrDelay[31] <= msIdxCounter;
	
	writeByteEnDelay[0] <= writeByteEnDelay[1];
	writeByteEnDelay[1] <= writeByteEnDelay[2];
	writeByteEnDelay[2] <= writeByteEnDelay[3];
	writeByteEnDelay[3] <= writeByteEnDelay[4];
	if (mode[0] == 1)
		writeByteEnDelay[4] <= ~0;
	else if (currentState == FETCH_COL)
		writeByteEnDelay[4] <= byteEn;
	else
		writeByteEnDelay[4] <= writeByteEnDelay[5];
	writeByteEnDelay[5] <= writeByteEnDelay[6];
	writeByteEnDelay[6] <= writeByteEnDelay[7];
	writeByteEnDelay[7] <= writeByteEnDelay[8];
	writeByteEnDelay[8] <= writeByteEnDelay[9];
	writeByteEnDelay[9] <= writeByteEnDelay[10];
	writeByteEnDelay[10] <= writeByteEnDelay[11];
	writeByteEnDelay[11] <= writeByteEnDelay[12];
	writeByteEnDelay[12] <= writeByteEnDelay[13];
	writeByteEnDelay[13] <= writeByteEnDelay[14];
	writeByteEnDelay[14] <= writeByteEnDelay[15];
	if (currentState == MULT_COL)
		writeByteEnDelay[15] <= byteEn;
	else
		writeByteEnDelay[15] <= writeByteEnDelay[16];
	writeByteEnDelay[16] <= writeByteEnDelay[17];
	writeByteEnDelay[17] <= writeByteEnDelay[18];
	writeByteEnDelay[18] <= writeByteEnDelay[19];
	writeByteEnDelay[19] <= writeByteEnDelay[20];
	writeByteEnDelay[20] <= writeByteEnDelay[21];
	writeByteEnDelay[21] <= writeByteEnDelay[22];
	writeByteEnDelay[22] <= writeByteEnDelay[23];
	writeByteEnDelay[23] <= writeByteEnDelay[24];
	writeByteEnDelay[24] <= writeByteEnDelay[25];
	writeByteEnDelay[25] <= writeByteEnDelay[26];
	writeByteEnDelay[26] <= writeByteEnDelay[27];
	writeByteEnDelay[27] <= writeByteEnDelay[28];
	writeByteEnDelay[28] <= writeByteEnDelay[29];
	writeByteEnDelay[29] <= writeByteEnDelay[30];
	writeByteEnDelay[30] <= writeByteEnDelay[31];
	writeByteEnDelay[31] <= byteEn;
	
	curWriteSelDelay[0] <= curWriteSelDelay[1];
	curWriteSelDelay[1] <= curWriteSelDelay[2];
	curWriteSelDelay[2] <= curWriteSelDelay[3];
	curWriteSelDelay[3] <= curWriteSelDelay[4];
	curWriteSelDelay[4] <= curWriteSelDelay[5];
	curWriteSelDelay[5] <= curWriteSelDelay[6];
	curWriteSelDelay[6] <= curWriteSelDelay[7];
	curWriteSelDelay[7] <= curWriteSelDelay[8];
	curWriteSelDelay[8] <= curWriteSelDelay[9];
	curWriteSelDelay[9] <= curWriteSelDelay[10];
	curWriteSelDelay[10] <= curWriteSelDelay[11];
	curWriteSelDelay[11] <= curWriteSelDelay[12];
	curWriteSelDelay[12] <= curWriteSelDelay[13];
	curWriteSelDelay[13] <= curWriteSelDelay[14];
	curWriteSelDelay[14] <= curWriteSelDelay[15];
	if (currentState == MULT_COL)
		curWriteSelDelay[15] <= 0;
	else
		curWriteSelDelay[15] <= 1;

	curWriteEnDelay[0] <= curWriteEnDelay[1];
	curWriteEnDelay[1] <= curWriteEnDelay[2];
	curWriteEnDelay[2] <= curWriteEnDelay[3];
	curWriteEnDelay[3] <= curWriteEnDelay[4];
	curWriteEnDelay[4] <= curWriteEnDelay[5];
	curWriteEnDelay[5] <= curWriteEnDelay[6];
	curWriteEnDelay[6] <= curWriteEnDelay[7];
	curWriteEnDelay[7] <= curWriteEnDelay[8];
	curWriteEnDelay[8] <= curWriteEnDelay[9];
	curWriteEnDelay[9] <= curWriteEnDelay[10];
	curWriteEnDelay[10] <= curWriteEnDelay[11];
	curWriteEnDelay[11] <= curWriteEnDelay[12];
	curWriteEnDelay[12] <= curWriteEnDelay[13];
	curWriteEnDelay[13] <= curWriteEnDelay[14];
	curWriteEnDelay[14] <= curWriteEnDelay[15];
	if (currentState == MULT_COL)
		curWriteEnDelay[15] <= 1;
	else
		curWriteEnDelay[15] <= curWriteEnDelay[16];
	curWriteEnDelay[16] <= curWriteEnDelay[17];
	curWriteEnDelay[17] <= curWriteEnDelay[18];
	curWriteEnDelay[18] <= curWriteEnDelay[19];
	curWriteEnDelay[19] <= curWriteEnDelay[20];
	curWriteEnDelay[20] <= curWriteEnDelay[21];
	curWriteEnDelay[21] <= curWriteEnDelay[22];
	curWriteEnDelay[22] <= curWriteEnDelay[23];
	curWriteEnDelay[23] <= curWriteEnDelay[24];
	curWriteEnDelay[24] <= curWriteEnDelay[25];
	curWriteEnDelay[25] <= curWriteEnDelay[26];
	curWriteEnDelay[26] <= curWriteEnDelay[27];
	curWriteEnDelay[27] <= curWriteEnDelay[28];
	curWriteEnDelay[28] <= curWriteEnDelay[29];
	curWriteEnDelay[29] <= curWriteEnDelay[30];
	curWriteEnDelay[30] <= curWriteEnDelay[31];
	if (currentState == MULT_SUB)
		curWriteEnDelay[31] <= 1;
	else
		curWriteEnDelay[31] <= 0;

	leftWriteSelDelay[0] <= leftWriteSelDelay[1];
	leftWriteSelDelay[1] <= leftWriteSelDelay[2];
	leftWriteSelDelay[2] <= leftWriteSelDelay[3];
	leftWriteSelDelay[3] <= leftWriteSelDelay[4];
	if (currentState == FETCH_COL)
		leftWriteSelDelay[4] <= 0;
	else
		leftWriteSelDelay[4] <= 1;

	leftWriteEnDelay[0] <= leftWriteEnDelay[1];
	leftWriteEnDelay[1] <= leftWriteEnDelay[2];
	leftWriteEnDelay[2] <= leftWriteEnDelay[3];
	leftWriteEnDelay[3] <= leftWriteEnDelay[4];
	if (currentState == FETCH_COL)
		leftWriteEnDelay[4] <= 1;
	else
		leftWriteEnDelay[4] <= leftWriteEnDelay[5];
	leftWriteEnDelay[5] <= leftWriteEnDelay[6];
	leftWriteEnDelay[6] <= leftWriteEnDelay[7];
	leftWriteEnDelay[7] <= leftWriteEnDelay[8];
	leftWriteEnDelay[8] <= leftWriteEnDelay[9];
	leftWriteEnDelay[9] <= leftWriteEnDelay[10];
	leftWriteEnDelay[10] <= leftWriteEnDelay[11];
	leftWriteEnDelay[11] <= leftWriteEnDelay[12];
	leftWriteEnDelay[12] <= leftWriteEnDelay[13];
	leftWriteEnDelay[13] <= leftWriteEnDelay[14];
	leftWriteEnDelay[14] <= leftWriteEnDelay[15];
	if (currentState == MULT_COL)
		leftWriteEnDelay[15] <= 1;
	else
		leftWriteEnDelay[15] <= leftWriteEnDelay[16];
	leftWriteEnDelay[16] <= leftWriteEnDelay[17];
	leftWriteEnDelay[17] <= leftWriteEnDelay[18];
	leftWriteEnDelay[18] <= leftWriteEnDelay[19];
	leftWriteEnDelay[19] <= leftWriteEnDelay[20];
	leftWriteEnDelay[20] <= leftWriteEnDelay[21];
	leftWriteEnDelay[21] <= leftWriteEnDelay[22];
	leftWriteEnDelay[22] <= leftWriteEnDelay[23];
	leftWriteEnDelay[23] <= leftWriteEnDelay[24];
	leftWriteEnDelay[24] <= leftWriteEnDelay[25];
	leftWriteEnDelay[25] <= leftWriteEnDelay[26];
	leftWriteEnDelay[26] <= leftWriteEnDelay[27];
	leftWriteEnDelay[27] <= leftWriteEnDelay[28];
	leftWriteEnDelay[28] <= leftWriteEnDelay[29];
	leftWriteEnDelay[29] <= leftWriteEnDelay[30];
	leftWriteEnDelay[30] <= leftWriteEnDelay[31];
	if (currentState == MULT_SUB && (mode == 0 || (mode == 1 && j == i1)))
		leftWriteEnDelay[31] <= 1;
	else
		leftWriteEnDelay[31] <= 0;

	topWriteAddrDelay[0] <= topWriteAddrDelay[1];
	topWriteAddrDelay[1] <= topWriteAddrDelay[2];
	topWriteAddrDelay[2] <= topWriteAddrDelay[3];
	topWriteAddrDelay[3] <= topWriteAddrDelay[4];
	if (currentRowState == FETCH_ROW)
		topWriteAddrDelay[4] <= nextTopIdxCounter;
	else
		topWriteAddrDelay[4] <=  topWriteAddrDelay[5];
	topWriteAddrDelay[5] <= topWriteAddrDelay[6];
	topWriteAddrDelay[6] <= topWriteAddrDelay[7];
	topWriteAddrDelay[7] <= topWriteAddrDelay[8];
	topWriteAddrDelay[8] <= topWriteAddrDelay[9];
	topWriteAddrDelay[9] <= topWriteAddrDelay[10];
	topWriteAddrDelay[10] <= topWriteAddrDelay[11];
	topWriteAddrDelay[11] <= topWriteAddrDelay[12];
	topWriteAddrDelay[12] <= topWriteAddrDelay[13];
	topWriteAddrDelay[13] <= topWriteAddrDelay[14];
	topWriteAddrDelay[14] <= topWriteAddrDelay[15];
	topWriteAddrDelay[15] <= topWriteAddrDelay[16];
	topWriteAddrDelay[16] <= topWriteAddrDelay[17];
	topWriteAddrDelay[17] <= topWriteAddrDelay[18];
	topWriteAddrDelay[18] <= topWriteAddrDelay[19];
	topWriteAddrDelay[19] <= topWriteAddrDelay[20];
	topWriteAddrDelay[20] <= topWriteAddrDelay[21];
	topWriteAddrDelay[21] <= topWriteAddrDelay[22];
	topWriteAddrDelay[22] <= topWriteAddrDelay[23];
	topWriteAddrDelay[23] <= topWriteAddrDelay[24];
	topWriteAddrDelay[24] <= topWriteAddrDelay[25];
	topWriteAddrDelay[25] <= topWriteAddrDelay[26];
	topWriteAddrDelay[26] <= topWriteAddrDelay[27];
	topWriteAddrDelay[27] <= topWriteAddrDelay[28];
	topWriteAddrDelay[28] <= topWriteAddrDelay[29];
	topWriteAddrDelay[29] <= topWriteAddrDelay[30];
	topWriteAddrDelay[30] <= topWriteAddrDelay[31];
		topWriteAddrDelay[31] <= nextTopIdxCounter;

	topWriteEnDelay[0] <= topWriteEnDelay[1];
	topWriteEnDelay[1] <= topWriteEnDelay[2];
	topWriteEnDelay[2] <= topWriteEnDelay[3];
	topWriteEnDelay[3] <= topWriteEnDelay[4];
	if (currentRowState == FETCH_ROW)
		topWriteEnDelay[4] <= 1;
	else
		topWriteEnDelay[4] <=  topWriteEnDelay[5];
	topWriteEnDelay[5] <= topWriteEnDelay[6];
	topWriteEnDelay[6] <= topWriteEnDelay[7];
	topWriteEnDelay[7] <= topWriteEnDelay[8];
	topWriteEnDelay[8] <= topWriteEnDelay[9];
	topWriteEnDelay[9] <= topWriteEnDelay[10];
	topWriteEnDelay[10] <= topWriteEnDelay[11];
	topWriteEnDelay[11] <= topWriteEnDelay[12];
	topWriteEnDelay[12] <= topWriteEnDelay[13];
	topWriteEnDelay[13] <= topWriteEnDelay[14];
	topWriteEnDelay[14] <= topWriteEnDelay[15];
	topWriteEnDelay[15] <= topWriteEnDelay[16];
	topWriteEnDelay[16] <= topWriteEnDelay[17];
	topWriteEnDelay[17] <= topWriteEnDelay[18];
	topWriteEnDelay[18] <= topWriteEnDelay[19];
	topWriteEnDelay[19] <= topWriteEnDelay[20];
	topWriteEnDelay[20] <= topWriteEnDelay[21];
	topWriteEnDelay[21] <= topWriteEnDelay[22];
	topWriteEnDelay[22] <= topWriteEnDelay[23];
	topWriteEnDelay[23] <= topWriteEnDelay[24];
	topWriteEnDelay[24] <= topWriteEnDelay[25];
	topWriteEnDelay[25] <= topWriteEnDelay[26];
	topWriteEnDelay[26] <= topWriteEnDelay[27];
	topWriteEnDelay[27] <= topWriteEnDelay[28];
	topWriteEnDelay[28] <= topWriteEnDelay[29];
	topWriteEnDelay[29] <= topWriteEnDelay[30];
	topWriteEnDelay[30] <= topWriteEnDelay[31];
	topWriteEnDelay[31] <= writeRow;

	topWriteSelDelay[0] <= topWriteSelDelay[1];
	topWriteSelDelay[1] <= topWriteSelDelay[2];
	topWriteSelDelay[2] <= topWriteSelDelay[3];
	topWriteSelDelay[3] <= topWriteSelDelay[4];
	if (currentRowState == FETCH_ROW || currentState == UPDATE_J && i1 == 1)
		topWriteSelDelay[4] <= imodk;
	else
		topWriteSelDelay[4] <=  topWriteSelDelay[5];
	topWriteSelDelay[5] <= topWriteSelDelay[6];
	topWriteSelDelay[6] <= topWriteSelDelay[7];
	topWriteSelDelay[7] <= topWriteSelDelay[8];
	topWriteSelDelay[8] <= topWriteSelDelay[9];
	topWriteSelDelay[9] <= topWriteSelDelay[10];
	topWriteSelDelay[10] <= topWriteSelDelay[11];
	topWriteSelDelay[11] <= topWriteSelDelay[12];
	topWriteSelDelay[12] <= topWriteSelDelay[13];
	topWriteSelDelay[13] <= topWriteSelDelay[14];
	topWriteSelDelay[14] <= topWriteSelDelay[15];
	topWriteSelDelay[15] <= topWriteSelDelay[16];
	topWriteSelDelay[16] <= topWriteSelDelay[17];
	topWriteSelDelay[17] <= topWriteSelDelay[18];
	topWriteSelDelay[18] <= topWriteSelDelay[19];
	topWriteSelDelay[19] <= topWriteSelDelay[20];
	topWriteSelDelay[20] <= topWriteSelDelay[21];
	topWriteSelDelay[21] <= topWriteSelDelay[22];
	topWriteSelDelay[22] <= topWriteSelDelay[23];
	topWriteSelDelay[23] <= topWriteSelDelay[24];
	topWriteSelDelay[24] <= topWriteSelDelay[25];
	topWriteSelDelay[25] <= topWriteSelDelay[26];
	topWriteSelDelay[26] <= topWriteSelDelay[27];
	topWriteSelDelay[27] <= topWriteSelDelay[28];
	topWriteSelDelay[28] <= topWriteSelDelay[29];
	topWriteSelDelay[29] <= topWriteSelDelay[30];
	topWriteSelDelay[30] <= topWriteSelDelay[31];
	topWriteSelDelay[31] <= i1modk;

	topSourceSelDelay[0] <= topSourceSelDelay[1];
	topSourceSelDelay[1] <= topSourceSelDelay[2];
	topSourceSelDelay[2] <= topSourceSelDelay[3];
	topSourceSelDelay[3] <= topSourceSelDelay[4];
	if (start == 1)
		topSourceSelDelay[4] <= 0;
	else if (currentState == STORE_MO)
		topSourceSelDelay[4] <= 1;

	leftReadAddrDelay[0] <= leftIdxCounter;


	diagEnDelay[0] <= diagEnDelay[1];
	diagEnDelay[1] <= diagEnDelay[2];
	diagEnDelay[2] <= diagEnDelay[3];
	diagEnDelay[3] <= diagEnDelay[4];
	diagEnDelay[4] <= diagEnDelay[5];
	diagEnDelay[5] <= (currentState == STORE_DIAG || currentState == STORE_DIAG2);

	MOEnDelay[0] <= MOEnDelay[1];
	MOEnDelay[1] <= MOEnDelay[2];
	MOEnDelay[2] <= MOEnDelay[3];
	MOEnDelay[3] <= MOEnDelay[4];
	MOEnDelay[4] <= MOEnDelay[5];
	if (currentState == STORE_MO || currentRowState == LOAD_ROW_INC_J)
		MOEnDelay[5] <= 1;
	else
		MOEnDelay[5] <= 0;
end

// output contorl signals
always @ (*)
begin
	if (currentState == FETCH_COL)
		curReadAddr <= diagIdxCounter;
	else if (currentRowState == FETCH_ROW)
	   curReadAddr <= readRowCounter;
	else
		curReadAddr <= curReadAddrDelay[0];
	curWriteAddr <= curWriteAddrDelay[0];
	curWriteByteEn <= writeByteEnDelay[0];
	curWriteSel <= curWriteSelDelay[0];
	curWriteEn <= curWriteEnDelay[0];

	if (currentState == MULT_COL)
		leftReadAddr <= leftIdxCounter;
	else
		leftReadAddr <= leftReadAddrDelay[0];
	leftWriteAddr <= curWriteAddrDelay[0];
	leftWriteByteEn <= writeByteEnDelay[0];
	leftWriteSel <= leftWriteSelDelay[0];
	leftWriteEn <= leftWriteEnDelay[0];

	if (currentState == STORE_DIAG)
		topReadAddr <= nextTopIdx;
else if (currentState == STORE_DIAG2)
   topReadAddr <= nextTopIdx2;
	else
	topReadAddr <= curTopIdx;
	topWriteAddr <= topWriteAddrDelay[0];
	topWriteEn <= topWriteEnDelay[0];
	topWriteSel <= topWriteSelDelay[0];
	topSourceSel <= topSourceSelDelay[0];

	MOSel <= ~(currentState == FIND_REC);
if (currentState == FIND_REC)
		MOEn <= 1;
	else
		MOEn <= MOEnDelay[0];

	diagEn <= diagEnDelay[0];

	if (currentState == DONE)
		done <= 1;
	else
		done <= 0;
end

endmodule
