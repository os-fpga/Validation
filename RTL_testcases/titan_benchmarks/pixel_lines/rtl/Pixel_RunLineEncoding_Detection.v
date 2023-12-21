//**************************************************************************
// author: Alexander Bochem
// date:   06.05.2010
//**************************************************************************
//input:	raw pixel data in RGB format [32b value, 11b Y, 11b X]
//output:	detected runs [32b y-w., 32b x-w., 32 pixel-w., 10b length, 11b startY, 11b startX]
//			runs contain information for Blob detection and 
//			center point computation for Bounding Box [32:0] and Center-Of-Mass [127:0]
//			frameRate is computed frame rate, based on pixel coordinates
//description: 
//  - read raw pixel data from input fifo
//	- performs threshold check on pixel value
//  - combines line adjacent pixels above the threshold to runs
//  - write RLE encoded data to output fifo
//**************************************************************************
//change:	13.05.2010		
//			extended output to [32b y-w., 32b x-w., 32 pixel-w., 10b length, 11b startY, 11b startX]
//			previous [24b y-weigth, 24b x-weigth, 10b length, 11b startY, 11b startX]
//**************************************************************************

module Pixel_RunLineEncoding_Detection(
	input iClock, 				//module clock
	input iReset,				//module reset signal
	input [11:0]iThreshold,		//threshold value for pixel sorting
	input iReadFifoEmpty,		//fifo empty signal from input fifo
	input [33:0]iReadFifoData,	//data bus from input fifo [32b value, 11b Y, 11b X]
	input iWriteFifoFull,		//fifo full signal from output fifo
	
	output reg oReadFifoRequest,	//read request to input fifo
	output reg [127:0]oWritePixelData,	//data bus to output fifo
	output reg oWriteRequest,		//write request to output fifo
	output reg [7:0]frameRate  //computed frame rate
);

//configuration settings
parameter MIN_X=11'd0, MAX_X=11'd640, MIN_Y=11'd0, MAX_Y=11'd480;
parameter MIN_RUN_LENGTH=2; //runs shorter than this value, will be skipped
parameter RUN_RANGE=5'd20;
parameter LSB_READ_FIFO=0, MSB_READ_FIFO=54;
parameter LSB_X=0, 	MSB_X=10; //start and end bit for x coordiante
parameter LSB_Y=11, MSB_Y=21; //start and end bit for y coordiante
//parameter LSB_VAL_R=22, MSB_VAL_R=32; //start and end bit for Red Value
//parameter LSB_VAL_G=33, MSB_VAL_G=43; //start and end bit for Green Value
//parameter LSB_VAL_B=44, MSB_VAL_B=54; //start and end bit for Blue Value
parameter LSB_VAL=22, MSB_VAL=33; //start and end bit for Greyscale Value

//parameter declaration
parameter TRUE=1'b1, FALSE=1'b0;
parameter INIT=0, IDLE=1, CHECK_PIXEL_RANGE=7;
parameter CHECK_PIXEL=2, WRITE_FIFO=3,  WAIT_FIFO=4, PROCESS_PIXEL=5, CHECK_RUN_LENGTH=6;
parameter CLEAR_OUTPUT_DATA = 32'd0;
parameter CLOCK_RATE = 32'd125000000;  //required for computation of fps. rate, has to be equal input clock

parameter CREATE_NEW_RUN=5'b01000;
parameter WRITE_EOF_AND_START_NEW_RUN=5'b01010;
parameter WRITE_EOF=5'b00010;
parameter EOF=128'h000000000000000000000000ffffffff;
parameter NEXT_PIXEL=5'b00000;

//internal registers
reg [3:0]  state;	//state flag for state machine
reg [9:0]  run_length; //store the length of a detected run
reg [10:0] run_start_x;//store starting X position of run
reg [10:0] run_start_y;//store starting Y position of run
reg [31:0] run_sum_x_positions;//store weighted sum of pixel values for x positions
reg [31:0] run_sum_y_positions;//store weighted sum of pixel values for y positions
reg [31:0] run_sum_values; //store sum of pixel values
reg isProceedingRun;  //flag TRUE if pixel has been detected for current frame line, requires adjacency check for latest pixel
reg [10:0] previousY; //stores Y position of previous pixel to detect start of a new frame line
reg [4:0]  checkResult; //each flag represents result of conditional checks
reg [4:0]  nextResultState; //to assign next state after last pixel process state

reg [31:0] countClk;
reg [7:0] countFrames;

//read raw pixel data from input fifo and detect runs in frame lines
//store detected runs to output fifo
always@(posedge iClock or posedge iReset) begin
	
	//reset internal registers on reset signal
	if(iReset) begin
		state <= INIT;
	end
	else begin				
	//module state machine				
		case(state)
		//initialze internal registers
		INIT: begin
			countFrames		=8'd0;
			countClk		=32'd0;
			
			isProceedingRun	=FALSE;
			run_length		=10'd0;
			run_start_x		=11'd0;
			run_start_y		=11'd0;
			run_sum_x_positions=32'd0;
			run_sum_y_positions=32'd0;			
			run_sum_values	=32'd0;
			previousY		=11'd0;
			checkResult		= 4'd0;
			
			oReadFifoRequest<=FALSE;
			oWriteRequest<=FALSE;
			oWritePixelData<=CLEAR_OUTPUT_DATA;
			state <= IDLE;
		end
		
	//read data from input fifo
		IDLE: begin
			//read pixel data from input fifo, if not empty
			if(!iReadFifoEmpty) begin
				oReadFifoRequest=TRUE; //enable read request signal to input fifo
				state <= CHECK_PIXEL_RANGE;
				//state <= CHECK_PIXEL;
			end
			//wait for new value in input fifo
			else begin
				state <= IDLE;
			end
		end//IDLE
	
	
	//check if pixel is in coordinate range
		CHECK_PIXEL_RANGE: begin
			if((iReadFifoData[MSB_Y:LSB_Y]<MAX_Y) && (iReadFifoData[MSB_X:LSB_X]<MAX_X) &&
			   (iReadFifoData[MSB_Y:LSB_Y]>MIN_Y) && (iReadFifoData[MSB_X:LSB_X]>MIN_X)) begin				
				state <= CHECK_PIXEL;
			end
			else begin
				state <= IDLE;
			end
		end
	
	//check pixel for position values and brightness value
		CHECK_PIXEL: begin	
			oReadFifoRequest=FALSE; //disable read request signal to input fifo
		
			//check if pixel line has not changed
			if(iReadFifoData[MSB_Y:LSB_Y] == previousY) begin
				checkResult[0]=TRUE;
			end

			//check if new frame line has started
			if(iReadFifoData[MSB_Y:LSB_Y] < previousY) begin
			//if((iReadFifoData[MSB_Y:LSB_Y]==MAX_X) && (iReadFifoData[MSB_X:LSB_X]==MAX_X)) begin
				checkResult[1]=TRUE;
			end
			
			//check if run processing active
			checkResult[2]=isProceedingRun;
			
			//check if pixel value is higher as threshold value
			//if((iReadFifoData[MSB_VAL_B:LSB_VAL_B]+iReadFifoData[MSB_VAL_G:LSB_VAL_G]+iReadFifoData[MSB_VAL_R:LSB_VAL_R]) > iThreshold) begin
			if(iReadFifoData[MSB_VAL:LSB_VAL] > iThreshold) begin
				checkResult[3]=TRUE;
			end
			
			//check if pixel adjacent to current run
			if((iReadFifoData[MSB_X:LSB_X] >= run_start_x)&&
			   (iReadFifoData[MSB_X:LSB_X] <= (run_start_x+run_length+RUN_RANGE))) begin
				checkResult[4]=TRUE;
			end
						
			state <= PROCESS_PIXEL;
		end//CHECK_PIXEL
		
	//perform processing according to check results
		PROCESS_PIXEL: begin
			//DEBUG OUTPUT
			//$display("CheckResult: %b\t", checkResult);
			
			//(a) add pixel to run, than read next pixel
			if( checkResult[0]&checkResult[2]&checkResult[3]&checkResult[4] ) begin
				//run_length=run_length + 10'd1; //increment length of run
				run_length=run_length + (iReadFifoData[MSB_X:LSB_X]-(run_length+run_start_x)+10'd1);
				
				//increase x and y and value sum
				run_sum_x_positions<=run_sum_x_positions+(iReadFifoData[MSB_VAL:LSB_VAL]*iReadFifoData[MSB_X:LSB_X]);
				run_sum_y_positions<=run_sum_y_positions+(iReadFifoData[MSB_VAL:LSB_VAL]*iReadFifoData[MSB_Y:LSB_Y]);
				run_sum_values<=run_sum_values+(iReadFifoData[MSB_VAL:LSB_VAL]);
				state <= IDLE;
				//$display("a");
			end
			
			//(j) write Run, and than read next pixel
			if( ((~checkResult[0])&(~checkResult[1])&checkResult[2]&(~checkResult[3])) )begin
				//(checkResult[0]&checkResult[2]&(~checkResult[3])) ) begin
				//pass run data to output
				oWritePixelData={run_sum_y_positions,run_sum_x_positions,run_sum_values,run_length, run_start_y, run_start_x};
				//set flag to false, since current run is send to output fifo
				isProceedingRun=FALSE;
				
				state<=CHECK_RUN_LENGTH;
				nextResultState<=NEXT_PIXEL;
				//$display("b");
			end
			
			//(c) create new run, and than read next pixel 
			if( ((~checkResult[1])&(~checkResult[2])&checkResult[3])|
				(checkResult[0]&(~checkResult[2])&checkResult[3]) ) begin
				isProceedingRun=TRUE;
				run_length=10'd1;
				run_start_x=iReadFifoData[MSB_X:LSB_X];
				run_start_y=iReadFifoData[MSB_Y:LSB_Y];
				
				//compute x and y sum
//				run_sum_x_positions<=((iReadFifoData[MSB_VAL_B:LSB_VAL_B]+iReadFifoData[MSB_VAL_G:LSB_VAL_G]+iReadFifoData[MSB_VAL_R:LSB_VAL_R])*iReadFifoData[MSB_X:LSB_X]);
//				run_sum_y_positions<=((iReadFifoData[MSB_VAL_B:LSB_VAL_B]+iReadFifoData[MSB_VAL_G:LSB_VAL_G]+iReadFifoData[MSB_VAL_R:LSB_VAL_R])*iReadFifoData[MSB_Y:LSB_Y]);
//				run_sum_values<= (iReadFifoData[MSB_VAL_B:LSB_VAL_B]+iReadFifoData[MSB_VAL_G:LSB_VAL_G]+iReadFifoData[MSB_VAL_R:LSB_VAL_R]);
				run_sum_x_positions<=(iReadFifoData[MSB_VAL:LSB_VAL]*iReadFifoData[MSB_X:LSB_X]);
				run_sum_y_positions<=(iReadFifoData[MSB_VAL:LSB_VAL]*iReadFifoData[MSB_Y:LSB_Y]);
				run_sum_values<=(iReadFifoData[MSB_VAL:LSB_VAL]);
				//update line number
				previousY=iReadFifoData[MSB_Y:LSB_Y];
											
				//read next pixel
				state<=IDLE;
				//$display("c");
			end
			
			//(d+b) drop current pixel, read next pixel
			if( ((~checkResult[1])&(~checkResult[2])&(~checkResult[3])) |
				(checkResult[0]&(~checkResult[2])&(~checkResult[3]))|
				(checkResult[0]&checkResult[2]&(~checkResult[3])) ) begin

				//read next pixel
				state<=IDLE;
				//$display("d");
			end
			
			// (e) write Run, write EOF, start new run, read next pixel
			if( (~checkResult[0])&checkResult[1]&checkResult[2]&checkResult[3] ) begin
				oWritePixelData={run_sum_y_positions,run_sum_x_positions,run_length, run_start_y, run_start_x};
				//set flag to false, since current run is send to output fifo
				isProceedingRun=FALSE;
				
				state<=CHECK_RUN_LENGTH;
				nextResultState<=WRITE_EOF_AND_START_NEW_RUN;
				//$display("e");
			end
			
			// (f) write Run, write EOF, read next pixel
			if( (~checkResult[0])&checkResult[1]&checkResult[2]&(~checkResult[3]) ) begin
				oWritePixelData={run_sum_y_positions,run_sum_x_positions,run_length, run_start_y, run_start_x};
				//set flag to false, since current run is send to output fifo
				isProceedingRun=FALSE;
				
				state<=CHECK_RUN_LENGTH;
				nextResultState<=WRITE_EOF;		
				//$display("f");
			end
			
			// (g) write EOF, start new run, read next pixel
			if( (~checkResult[0])&checkResult[1]&(~checkResult[2])&checkResult[3] ) begin
				oWritePixelData=EOF;
				
				state<=WRITE_FIFO;
				nextResultState<=CREATE_NEW_RUN;
				//$display("g");
				//increment frame counter
				countFrames=countFrames+8'd1;
			end
			
			// (h) write EOF, read next pixel
			if( (~checkResult[0])&checkResult[1]&(~checkResult[2])&(~checkResult[3]) ) begin
				oWritePixelData=EOF;
				
				state<=WRITE_FIFO;
				nextResultState<=NEXT_PIXEL;
				//$display("h");				
				//increment frame counter
				countFrames=countFrames+8'd1;
			end
			
			// (i) write run, create new run, read next pixel
			if( ((~checkResult[0])&(~checkResult[1])&checkResult[2]&checkResult[3]) |
				(checkResult[0]&checkResult[2]&checkResult[3]&(~checkResult[4])) ) begin
				//pass run data to output
				oWritePixelData={run_sum_y_positions,run_sum_x_positions,run_length, run_start_y, run_start_x};
				//set flag to false, since current run is send to output fifo
				isProceedingRun=FALSE;
				
				state<=CHECK_RUN_LENGTH;
				nextResultState<=CREATE_NEW_RUN;
				//$display("j");
			end
			
			//clear check result
			checkResult=5'd0;
			
		end//PIXEL_PROCESS


	//eliminate runs shorter than minimum value MIN_RUN_LENGTH
		CHECK_RUN_LENGTH: begin
			if(run_length > (MIN_RUN_LENGTH-1)) begin
				state <= WRITE_FIFO;
				//$display("Run length: %d \t Y: %d \t X: %d",oWritePixelData[31:22], oWritePixelData[21:11], oWritePixelData[10:0]);
			end
			else begin
				state <= WAIT_FIFO;
			end
		end
		
	//write run data to output fifo
		WRITE_FIFO: begin
			if(!iWriteFifoFull) begin
				oWriteRequest=TRUE;
				state <= WAIT_FIFO;
			end
			else begin
				state <= WRITE_FIFO;
			end		
		end
		
	//clear output registers
		WAIT_FIFO: begin
			oWriteRequest=FALSE;
			oWritePixelData<=CLEAR_OUTPUT_DATA;
			
			//update line number
			previousY=iReadFifoData[MSB_Y:LSB_Y];
							
			//use reassign result value from state PROCESS_PIXEL
			checkResult=nextResultState;
			state <= PROCESS_PIXEL;
		end
		
		endcase
				
	//compute fps. rate and display on 7-segment
		if(countClk == CLOCK_RATE) begin
			countClk     = 32'd0;
			frameRate    = countFrames;
			countFrames <= 8'd0;			
		end
		else begin
			countClk = countClk + 32'd1;
		end			
	end
end    

endmodule
