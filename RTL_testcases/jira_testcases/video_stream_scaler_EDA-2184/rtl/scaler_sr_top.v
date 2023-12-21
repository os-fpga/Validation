/*-----------------------------------------------------------------------------

								Video Stream Scaler
								
							Author: David Kronstein
							


Copyright 2011, David Kronstein, and individual contributors as indicated
by the @authors tag.

This is free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation; either version 2.1 of
the License, or (at your option) any later version.

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this software; if not, write to the Free
Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
02110-1301 USA, or see the FSF site: http://www.fsf.org.

								
-------------------------------------------------------------------------------

Scales streaming video up or down in resolution. Bilinear and nearest neighbor
modes are supported.

Run-time adjustment of input and output resolution, scaling factors, and scale
type. 

-------------------------------------------------------------------------------

Revisions

V1.0.0	Feb 21 2011		Initial Release		David Kronstein
Known bugs:
Very slight numerical errors (+0/-2 LSb) in output data due to coefficient arithmetic.
Impossible to notice without adjustment in video levels. Attempted to fix by setting
coeff11 to 1.0 - other coefficients, but this caused timing issues.

*/

module streamScaler_sr_top #(
//---------------------------Parameters----------------------------------------
parameter	DATA_WIDTH =			8,		//Width of input/output data
parameter	CHANNELS =				1,		//Number of channels of DATA_WIDTH, for color images
parameter 	DISCARD_CNT_WIDTH =		8,		//Width of inputDiscardCnt
parameter	INPUT_X_RES_WIDTH =		11,		//Widths of input/output resolution control signals
parameter	INPUT_Y_RES_WIDTH =		11,
parameter	OUTPUT_X_RES_WIDTH =	11,
parameter	OUTPUT_Y_RES_WIDTH =	11,
parameter	FRACTION_BITS =			8,		//Number of bits for fractional component of coefficients.

parameter	SCALE_INT_BITS =		4,		//Width of integer component of scaling factor. The maximum input data width to
											//multipliers created will be SCALE_INT_BITS + SCALE_FRAC_BITS. Typically these
											//values will sum to 18 to match multipliers available in FPGAs.
parameter	SCALE_FRAC_BITS =		14,		//Width of fractional component of scaling factor
parameter	BUFFER_SIZE =			4,		//Depth of RFIFO
//---------------------Non-user-definable parameters----------------------------
parameter	COEFF_WIDTH =			FRACTION_BITS + 1,
parameter	SCALE_BITS =			SCALE_INT_BITS + SCALE_FRAC_BITS,
parameter	BUFFER_SIZE_WIDTH =		((BUFFER_SIZE+1) <= 2) ? 1 :	//wide enough to hold value BUFFER_SIZE + 1
									((BUFFER_SIZE+1) <= 4) ? 2 :
									((BUFFER_SIZE+1) <= 8) ? 3 :
									((BUFFER_SIZE+1) <= 16) ? 4 :
									((BUFFER_SIZE+1) <= 32) ? 5 :
									((BUFFER_SIZE+1) <= 64) ? 6 : 7
)(
//---------------------------Module IO-----------------------------------------
//Clock and reset
input wire							clk,
input wire							rst,

//User interface
//Input
input wire                          dIn,
input wire							dInValid,
output wire							nextDin,
input wire							start,

//Output
output wire    [DATA_WIDTH*CHANNELS-1:0] dOut,
output	wire						      dOutValid,			//latency of 4 clock cycles after nextDout is asserted
input wire							nextDout,

//Control
input wire                          inputDiscardCnt,	//Number of input pixels to discard before processing data. Used for clipping
input wire                       	inputXRes,			//Resolution of input data minus 1
input wire                          inputYRes,
input wire                          outputXRes,			//Resolution of output data minus 1
input wire                          outputYRes,
input wire                          xScale,				//Scaling factors. Input resolution scaled up by 1/xScale. Format Q SCALE_INT_BITS.SCALE_FRAC_BITS
input wire                          yScale,				//Scaling factors. Input resolution scaled up by 1/yScale. Format Q SCALE_INT_BITS.SCALE_FRAC_BITS

input wire 
									leftOffset,			//Integer/fraction of input pixel to offset output data horizontally right. Format Q OUTPUT_X_RES_WIDTH.SCALE_FRAC_BITS
input wire                          topFracOffset,		//Fraction of input pixel to offset data vertically down. Format Q0.SCALE_FRAC_BITS
input wire							nearestNeighbor		//Use nearest neighbor resize instead of bilinear
);

  reg [DATA_WIDTH*CHANNELS-1:0] dIn_reg;
  reg [DISCARD_CNT_WIDTH-1:0]	inputDiscardCnt_reg;	//Number of input pixels to discard before processing data. Used for clipping
  reg [INPUT_X_RES_WIDTH-1:0]	inputXRes_reg;			//Resolution of input data minus 1
  reg [INPUT_Y_RES_WIDTH-1:0]	inputYRes_reg;
  reg [OUTPUT_X_RES_WIDTH-1:0]	outputXRes_reg;			//Resolution of output data minus 1
  reg [OUTPUT_Y_RES_WIDTH-1:0]	outputYRes_reg;
  reg [SCALE_BITS-1:0]			xScale_reg;				//Scaling factors. Input resolution scaled up by 1/xScale. Format Q SCALE_INT_BITS.SCALE_FRAC_BITS
  reg [SCALE_BITS-1:0]			yScale_reg;				//Scaling factors. Input resolution scaled up by 1/yScale. Format Q SCALE_INT_BITS.SCALE_FRAC_BITS
  reg [OUTPUT_X_RES_WIDTH-1+SCALE_FRAC_BITS:0] leftOffset_reg;			//Integer/fraction of input pixel to offset output data horizontally right. Format Q OUTPUT_X_RES_WIDTH.SCALE_FRAC_BITS
  reg [SCALE_FRAC_BITS-1:0]	topFracOffset_reg;		//Fraction of input pixel to offset data vertically down. Format Q0.SCALE_FRAC_BITS

  always @(posedge clk) begin
    dIn_reg <= {dIn_reg[DATA_WIDTH*CHANNELS-2:0], dIn};
    inputDiscardCnt_reg <= {inputDiscardCnt_reg[DISCARD_CNT_WIDTH-2:0], inputDiscardCnt};
    inputXRes_reg <= {inputXRes_reg[INPUT_X_RES_WIDTH-2:0], inputXRes};
    inputYRes_reg <= {inputYRes_reg[INPUT_Y_RES_WIDTH-2:0], inputYRes};
    outputXRes_reg <= {outputXRes_reg[OUTPUT_X_RES_WIDTH-2:0], outputXRes};
    outputYRes_reg <= {outputYRes_reg[OUTPUT_Y_RES_WIDTH-2:0], outputYRes};
    xScale_reg <= {xScale_reg[SCALE_BITS-2:0], xScale};
    yScale_reg <= {yScale_reg[SCALE_BITS-2:0], yScale};
    leftOffset_reg <= {leftOffset_reg[OUTPUT_X_RES_WIDTH-2+SCALE_FRAC_BITS:0], leftOffset};
    topFracOffset_reg <= {topFracOffset_reg[SCALE_FRAC_BITS-2:0], topFracOffset};
  end


streamScaler #(
//---------------------------Parameters----------------------------------------
  .DATA_WIDTH(DATA_WIDTH),
  .CHANNELS(CHANNELS),
  .DISCARD_CNT_WIDTH(DISCARD_CNT_WIDTH),
  .INPUT_X_RES_WIDTH(INPUT_X_RES_WIDTH),
  .INPUT_Y_RES_WIDTH(INPUT_Y_RES_WIDTH),
  .OUTPUT_X_RES_WIDTH(OUTPUT_X_RES_WIDTH),
  .OUTPUT_Y_RES_WIDTH(OUTPUT_Y_RES_WIDTH),
  .FRACTION_BITS(FRACTION_BITS),
  .SCALE_INT_BITS(SCALE_INT_BITS),
  .SCALE_FRAC_BITS(SCALE_FRAC_BITS),
  .BUFFER_SIZE(BUFFER_SIZE),
  .COEFF_WIDTH(COEFF_WIDTH),
  .SCALE_BITS(SCALE_BITS),
  .BUFFER_SIZE_WIDTH(BUFFER_SIZE_WIDTH)
) U0 (
//---------------------------Module IO-----------------------------------------
//Clock and reset
  .clk(clk),
  .rst(rst),

//User interface
//Input
  .dIn(dIn_reg),
  .dInValid(dInValid),
  .nextDin(nextDin),
  .start(start),

//Output
  .dOut(dOut),
  .dOutValid(dOutValid),			//latency of 4 clock cycles after nextDout is asserted
  .nextDout(nextDout),

//Control
  .inputDiscardCnt(inputDiscardCnt_reg),	//Number of input pixels to discard before processing data. Used for clipping
  .inputXRes(inputXRes_reg),			//Resolution of input data minus 1
  .inputYRes(inputYRes_reg),
  .outputXRes(outputXRes_reg),			//Resolution of output data minus 1
  .outputYRes(outputYRes_reg),
  .xScale(xScale_reg),				//Scaling factors. Input resolution scaled up by 1/xScale. Format Q SCALE_INT_BITS.SCALE_FRAC_BITS
  .yScale(yScale_reg),				//Scaling factors. Input resolution scaled up by 1/yScale. Format Q SCALE_INT_BITS.SCALE_FRAC_BITS

  .leftOffset(leftOffset_reg),			//Integer/fraction of input pixel to offset output data horizontally right. Format Q OUTPUT_X_RES_WIDTH.SCALE_FRAC_BITS
  .topFracOffset(topFracOffset_reg),		//Fraction of input pixel to offset data vertically down. Format Q0.SCALE_FRAC_BITS
  .nearestNeighbor(nearestNeighbor)		//Use nearest neighbor resize instead of bilinear
); 
 
endmodule //ramDualPort
