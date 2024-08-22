/////////////////////////////////////////////////////////////////
//
// CARPAT:
//
// This is a ray triangle intersection framework design capable
// of rendering an arbitrary number of 3-D triangles on a VGA
// monitor.
// The Phong lighting model is evaluated by the ray tracer.
// A rotation effect is achieved by camera rotation across all
// 3 axes.
// The design is fully pipelined capable of computing the lighting
// model per triangle per screen pixel in 1 cycle of "sys_clk" which
// is currently 54Mhz
// The 64Mbit SDRAM is used to store the computed color per pixel
// and is read out on the vga_clk (CLOCK_27) to run the vga interface
// The triangle data is read out from a MIF file (tri_mif.mif).
// The current example is a goblet dataset (502 vertices, 1500 edges
// , 1000 triangles) that we got from 
// http://gts.sourceforge.net/samples.html
//
// Authors: Kamal Patel, Neville Carvalho (Altera Corporation)
// Copyright (c) 2007
// 
// Credits: Joshua Fender for his ray-triangle intersection module
//          from his thesis work.
//          We would say that about 15% of our code is from
//          Joshua's work.
////////////////////////////////////////////////////////////////
`include "pll_sys_bb.v"
module carpat
	(
		////////////////////	Clock Input	 	////////////////////	 
		CLOCK_27,						//	27 MHz
		CLOCK_50,						//	50 MHz
		EXT_CLOCK,						//	External Clock
		////////////////////	Push Button		////////////////////
		// KEY[0] is used for reset
		KEY,							//	Pushbutton[3:0]
		////////////////////	DPDT Switch		////////////////////
		SW,								//	Toggle Switch[17:0]
		////////////////////////	LED		////////////////////////
		LEDG,							//	LED Green[8:0]
		LEDR,							//	LED Red[17:0]
		////////////////////////	UART	////////////////////////
		UART_RXD,						//	UART Receiver
		/////////////////////	SDRAM Interface		////////////////
		DRAM_DQ,						//	SDRAM Data bus 16 Bits
		DRAM_ADDR,						//	SDRAM Address bus 12 Bits
		DRAM_LDQM,						//	SDRAM Low-byte Data Mask 
		DRAM_UDQM,						//	SDRAM High-byte Data Mask
		DRAM_WE_N,						//	SDRAM Write Enable
		DRAM_CAS_N,						//	SDRAM Column Address Strobe
		DRAM_RAS_N,						//	SDRAM Row Address Strobe
		DRAM_CS_N,						//	SDRAM Chip Select
		DRAM_BA_0,						//	SDRAM Bank Address 0
		DRAM_BA_1,						//	SDRAM Bank Address 0
		DRAM_CLK,						//	SDRAM Clock
		DRAM_CKE,						//	SDRAM Clock Enable
		////////////////////	Flash Interface		////////////////
		FL_DQ,							//	FLASH Data bus 8 Bits
		////////////////////	SRAM Interface		////////////////
		SRAM_DQ,						//	SRAM Data bus 16 Bits
		SRAM_WE_N,						//	SRAM Write Enable
		SRAM_CE_N,						//	SRAM Chip Enable
		SRAM_OE_N,						//	SRAM Output Enable
		////////////////////	ISP1362 Interface	////////////////
		OTG_DATA,						//	ISP1362 Data bus 16 Bits
		OTG_ADDR,						//	ISP1362 Address 2 Bits
		OTG_CS_N,						//	ISP1362 Chip Select
		OTG_RD_N,						//	ISP1362 Write
		OTG_WR_N,						//	ISP1362 Read
		OTG_RST_N,						//	ISP1362 Reset
		OTG_FSPEED,						//	USB Full Speed,	0 = Enable, Z = Disable
		OTG_LSPEED,						//	USB Low Speed, 	0 = Enable, Z = Disable
		OTG_INT0,						//	ISP1362 Interrupt 0
		OTG_INT1,						//	ISP1362 Interrupt 1
		OTG_DREQ0,						//	ISP1362 DMA Request 0
		OTG_DREQ1,						//	ISP1362 DMA Request 1
		OTG_DACK0_N,					//	ISP1362 DMA Acknowledge 0
		OTG_DACK1_N,					//	ISP1362 DMA Acknowledge 1
		////////////////////	LCD Module 16X2		////////////////
		LCD_ON,							//	LCD Power ON/OFF
		LCD_BLON,						//	LCD Back Light ON/OFF
		LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
		LCD_EN,							//	LCD Enable
		LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		LCD_DATA,						//	LCD Data bus 8 bits
		////////////////////	SD_Card Interface	////////////////
		SD_DAT,							//	SD Card Data
		SD_DAT3,						//	SD Card Data 3
		SD_CMD,							//	SD Card Command Signal
		SD_CLK,							//	SD Card Clock
		////////////////////	USB JTAG link	////////////////////
		TDI,  							// CPLD -> FPGA (data in)
		TCK,  							// CPLD -> FPGA (clk)
		TCS,  							// CPLD -> FPGA (CS)
	    TDO,  							// FPGA -> CPLD (data out)
		////////////////////	I2C		////////////////////////////
		I2C_SDAT,						//	I2C Data
		I2C_SCLK,						//	I2C Clock
		////////////////////	PS2		////////////////////////////
		PS2_DAT,						//	PS2 Data
		PS2_CLK,						//	PS2 Clock
		////////////////////	VGA		////////////////////////////
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK,						//	VGA BLANK
		VGA_SYNC,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,  						//	VGA Blue[9:0]
		////////////	Ethernet Interface	////////////////////////
		//ENET_DATA,						//	DM9000A DATA bus 16Bits
		//ENET_CMD,						//	DM9000A Command/Data Select, 0 = Command, 1 = Data
		//ENET_CS_N,						//	DM9000A Chip Select
		//ENET_WR_N,						//	DM9000A Write
		//ENET_RD_N,						//	DM9000A Read
		//ENET_RST_N,						//	DM9000A Reset
		//ENET_INT,						//	DM9000A Interrupt
		//ENET_CLK,						//	DM9000A Clock 25 MHz
		////////////////	Audio CODEC		////////////////////////
		AUD_ADCLRCK,					//	Audio CODEC ADC LR Clock
		AUD_ADCDAT,						//	Audio CODEC ADC Data
		AUD_DACLRCK,					//	Audio CODEC DAC LR Clock
		AUD_DACDAT,						//	Audio CODEC DAC Data
		AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
		AUD_XCK,						//	Audio CODEC Chip Clock
		////////////////	TV Decoder		////////////////////////
		TD_DATA,    					//	TV Decoder Data bus 8 bits
		TD_HS,							//	TV Decoder H_SYNC
		TD_VS,							//	TV Decoder V_SYNC
		TD_RESET,						//	TV Decoder Reset
		////////////////////	GPIO	////////////////////////////
		GPIO_0,							//	GPIO Connection 0
		GPIO_1,							//	GPIO Connection 1
		// Neville's add
		do_z_buffer,
		request_out,
	
		trigger_clk,
		debug_frame_done,
				  w1_full,
				  w2_full,
			      r1_empty,
				  r2_empty,
		count_diff,
		sys_pll_locked
	);

////triangle to test how much real logic will be without hardcoded triangles
parameter VERTEX_FRAC_WIDTH = 8;
parameter VERTEX_DATA_WIDTH = 12;
parameter VERTEX_WORD_LENGTH = VERTEX_FRAC_WIDTH + VERTEX_DATA_WIDTH;

////////////////////////	Clock Input	 	////////////////////////
input			CLOCK_27;				//	27 MHz
input			CLOCK_50;				//	50 MHz
input			EXT_CLOCK;				//	External Clock
////////////////////////	Push Button		////////////////////////
input	[3:0]	KEY;					//	Pushbutton[3:0]
////////////////////////	DPDT Switch		////////////////////////
input	[17:0]	SW;						//	Toggle Switch[17:0]
////////////////////////////	LED		////////////////////////////
output	[8:0]	LEDG;					//	LED Green[8:0]
output	[0:0]	LEDR;					//	LED Red[17:0]
////////////////////////////	UART	////////////////////////////
input			UART_RXD;				//	UART Receiver
////////////////////////////	IRDA	////////////////////////////

///////////////////////		SDRAM Interface	////////////////////////
inout	[15:0]	DRAM_DQ;				//	SDRAM Data bus 16 Bits
output	[11:0]	DRAM_ADDR;				//	SDRAM Address bus 12 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask 
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 0
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable
////////////////////////	Flash Interface	////////////////////////
inout	[7:0]	FL_DQ;					//	FLASH Data bus 8 Bits
////////////////////////	SRAM Interface	////////////////////////
inout	[15:0]	SRAM_DQ;				//	SRAM Data bus 16 Bits
output			SRAM_WE_N;				//	SRAM Write Enable
output			SRAM_CE_N;				//	SRAM Chip Enable
output			SRAM_OE_N;				//	SRAM Output Enable
////////////////////	ISP1362 Interface	////////////////////////
inout	[15:0]	OTG_DATA;				//	ISP1362 Data bus 16 Bits
output	[1:0]	OTG_ADDR;				//	ISP1362 Address 2 Bits
output			OTG_CS_N;				//	ISP1362 Chip Select
output			OTG_RD_N;				//	ISP1362 Write
output			OTG_WR_N;				//	ISP1362 Read
output			OTG_RST_N;				//	ISP1362 Reset
output			OTG_FSPEED;				//	USB Full Speed,	0 = Enable, Z = Disable
output			OTG_LSPEED;				//	USB Low Speed, 	0 = Enable, Z = Disable
input			OTG_INT0;				//	ISP1362 Interrupt 0
input			OTG_INT1;				//	ISP1362 Interrupt 1
input			OTG_DREQ0;				//	ISP1362 DMA Request 0
input			OTG_DREQ1;				//	ISP1362 DMA Request 1
output			OTG_DACK0_N;			//	ISP1362 DMA Acknowledge 0
output			OTG_DACK1_N;			//	ISP1362 DMA Acknowledge 1
////////////////////	LCD Module 16X2	////////////////////////////
inout	[7:0]	LCD_DATA;				//	LCD Data bus 8 bits
output			LCD_ON;					//	LCD Power ON/OFF
output			LCD_BLON;				//	LCD Back Light ON/OFF
output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
output			LCD_EN;					//	LCD Enable
output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////	SD Card Interface	////////////////////////
inout			SD_DAT;					//	SD Card Data
inout			SD_DAT3;				//	SD Card Data 3
inout			SD_CMD;					//	SD Card Command Signal
output			SD_CLK;					//	SD Card Clock
////////////////////////	I2C		////////////////////////////////
inout			I2C_SDAT;				//	I2C Data
output			I2C_SCLK;				//	I2C Clock
////////////////////////	PS2		////////////////////////////////
input		 	PS2_DAT;				//	PS2 Data
input			PS2_CLK;				//	PS2 Clock
////////////////////	USB JTAG link	////////////////////////////
input  			TDI;					// CPLD -> FPGA (data in)
input  			TCK;					// CPLD -> FPGA (clk)
input  			TCS;					// CPLD -> FPGA (CS)
output 			TDO;					// FPGA -> CPLD (data out)
////////////////////////	VGA			////////////////////////////
output			VGA_CLK;   				//	VGA Clock
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output			VGA_BLANK;				//	VGA BLANK
output			VGA_SYNC;				//	VGA SYNC
output	[9:0]	VGA_R;   				//	VGA Red[9:0]
output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
////////////////	Ethernet Interface	////////////////////////////
//inout	[15:0]	ENET_DATA;				//	DM9000A DATA bus 16Bits
//output			ENET_CMD;				//	DM9000A Command/Data Select, 0 = Command, 1 = Data
//output			ENET_CS_N;				//	DM9000A Chip Select
//output			ENET_WR_N;				//	DM9000A Write
//output			ENET_RD_N;				//	DM9000A Read
//output			ENET_RST_N;				//	DM9000A Reset
//input			ENET_INT;				//	DM9000A Interrupt
//output			ENET_CLK;				//	DM9000A Clock 25 MHz
////////////////////	Audio CODEC		////////////////////////////
inout			AUD_ADCLRCK;			//	Audio CODEC ADC LR Clock
input			AUD_ADCDAT;				//	Audio CODEC ADC Data
inout			AUD_DACLRCK;			//	Audio CODEC DAC LR Clock
output			AUD_DACDAT;				//	Audio CODEC DAC Data
inout			AUD_BCLK;				//	Audio CODEC Bit-Stream Clock
output			AUD_XCK;				//	Audio CODEC Chip Clock
////////////////////	TV Devoder		////////////////////////////
input	[7:0]	TD_DATA;    			//	TV Decoder Data bus 8 bits
input			TD_HS;					//	TV Decoder H_SYNC
input			TD_VS;					//	TV Decoder V_SYNC
output			TD_RESET;				//	TV Decoder Reset
////////////////////////	GPIO	////////////////////////////////
inout	[35:0]	GPIO_0;					//	GPIO Connection 0
inout	[35:0]	GPIO_1;					//	GPIO Connection 1

// Neville's hacks
input do_z_buffer;
output request_out;
output trigger_clk;
output [9:0] count_diff;
output sys_pll_locked;

wire request;
wire sys_clk;

output debug_frame_done;
output w1_full;
output				  w2_full;
output			      r1_empty;
output				  r2_empty;

assign	LCD_ON		=	1'b1;
assign	LCD_BLON	=	1'b1;
assign	TD_RESET	=	1'b1;

//	All inout port turn to tri-state
assign	FL_DQ		=	8'hzz;
assign	SRAM_DQ		=	16'hzzzz;
assign	OTG_DATA	=	16'hzzzz;
assign	LCD_DATA	=	8'hzz;
assign	SD_DAT		=	1'bz;
assign	I2C_SDAT	=	1'bz;
//assign	ENET_DATA	=	16'hzzzz;
assign	AUD_ADCLRCK	=	1'bz;
assign	AUD_DACLRCK	=	1'bz;
assign	AUD_BCLK	=	1'bz;

//	CCD
reg	[9:0]	CCD_DATA;
wire		CCD_SDAT;
wire		CCD_SCLK;
reg			CCD_FLASH;
reg			CCD_FVAL;
reg			CCD_LVAL;
wire		CCD_PIXCLK;
reg			CCD_MCLK;	//	CCD Master Clock

wire	[15:0]	Read_DATA1;
wire	[15:0]	Read_DATA2;
wire			VGA_CTRL_CLK;
wire			AUD_CTRL_CLK;
wire	[9:0]	mCCD_DATA;
wire			mCCD_DVAL;
wire			mCCD_DVAL_d;
wire	[10:0]	X_Cont;
wire	[10:0]	Y_Cont;
wire	[10:0]	X_ADDR;
wire    [10:0]  Y_ADDR;
wire	[31:0]	Frame_Cont;
wire	[9:0]	mCCD_R;
wire	[9:0]	mCCD_G;
wire	[9:0]	mCCD_B;
wire			DLY_RST_0;
wire			DLY_RST_1;
wire			DLY_RST_2;
wire			Read;

wire    [3:0]   paddle_left;
wire    [3:0]   paddle_right;

wire    [9:0]   ballx;
wire    [9:0]   bally;

wire    Locked;

wire    goal_left;
wire    goal_right;

/*
wire    w1_full;
wire    w2_full;
wire    r1_empty;
wire    r2_empty;
*/

reg    [1:0] flags_empty;
reg    [1:0] flags_full;

wire    ccd_error;
wire	rst_write;

wire   [2:0] score_l;
wire   [2:0] score_r;

// Neville's hacks
parameter REAL_COLOR_SIZE = 10;



wire [REAL_COLOR_SIZE-1:0] model_r;
wire [REAL_COLOR_SIZE-1:0] model_b;
wire [REAL_COLOR_SIZE-1:0] model_g;

//	For Sensor 1
assign	GPIO_1[11]	=	CCD_MCLK;
assign	GPIO_1[15]	=	CCD_SDAT;
assign	GPIO_1[14]	=	CCD_SCLK;
assign	CCD_PIXCLK	=	GPIO_1[10];

assign  rst_write   = !DLY_RST_0;
//assign	LEDR		=	SW;
// nc
assign LEDR[0] = CLOCK_27;
assign	LEDG		=	{4'b0, flags_empty, flags_full};//{paddle_left,paddle_right};//Y_Cont;
assign	VGA_CTRL_CLK=	CCD_MCLK;
//assign	VGA_CLK		=	~CCD_MCLK;
//assign  Read        =   Read_tmp & !Frame_Cont[2];

always@(posedge CCD_PIXCLK)
begin
	CCD_DATA[0]	<=	GPIO_1[0];
	CCD_DATA[1]	<=	GPIO_1[1];
	CCD_DATA[2]	<=	GPIO_1[5];
	CCD_DATA[3]	<=	GPIO_1[3];
	CCD_DATA[4]	<=	GPIO_1[2];
	CCD_DATA[5]	<=	GPIO_1[4];
	CCD_DATA[6]	<=	GPIO_1[6];
	CCD_DATA[7]	<=	GPIO_1[7];
	CCD_DATA[8]	<=	GPIO_1[8];
	CCD_DATA[9]	<=	GPIO_1[9];

	CCD_FVAL	<=	GPIO_1[13];
	CCD_LVAL	<=	GPIO_1[12];	
end

always@(posedge CLOCK_50)	CCD_MCLK	<=	~CCD_MCLK;

always@(posedge CCD_MCLK or negedge KEY[3])	
begin
	if(!KEY[3])
	begin
		flags_empty <= 2'b0;
	end
	else
	begin

	flags_empty <= flags_empty | {!locked,r2_empty};
	
	end
end

always@(posedge CCD_PIXCLK or negedge KEY[3])	
begin
	if(!KEY[3])
	begin
		flags_full <= 2'b0;
	end
	else
	begin

	flags_full <= flags_full | {w1_full,w2_full};
	
	end
end
paddle				u99 (   .clk(VGA_CTRL_CLK),
							.rst_n(KEY[0]),
							.p_r(Read_DATA2[9:0]),
							.p_g({Read_DATA1[14:10],Read_DATA2[14:10]}),
							.p_b(Read_DATA1[9:0]),
							.p_x(X_ADDR),
							.p_y(Y_ADDR),
							.paddle_1(paddle_left),
							.paddle_2(paddle_right),
							.ball_x(ballx),
							.ball_y(bally),
							.goal_1(goal_left),
							.goal_2(goal_right),
							.score_1(score_l),
							.score_2(score_r) );
							
VGA_DATA_REQ		u0	(	.oREQ(Read),
							.iADDR(X_ADDR),
							.iCLK(CLOCK_27),
							.iRST(DLY_RST_1)	);
							
// Ask the vga driver to compute h_sync and v_sync
vga_driver my_vga_driver(
		.r(model_r), .g(model_g), .b(model_b),
		.current_x(X_ADDR), .current_y(Y_ADDR), .request(request),
		.vga_r(VGA_R), .vga_g(VGA_G), .vga_b(VGA_B), .vga_hs(VGA_HS), .vga_vs(VGA_VS), .vga_blank(VGA_BLANK), 
		.vga_clock(VGA_CLK), .clk27(CLOCK_27), .rst27(!DLY_RST_1));

//assign request = VGA_HS && VGA_VS;
// Tell the multi_tri to only read from the RAM when both H sync and V sync 
// are asserted

Reset_Delay			u2	(	.iCLK(CLOCK_50),
							.iRST(KEY[0]),
							.oRST_0(DLY_RST_0),
							.oRST_1(DLY_RST_1),
							.oRST_2(DLY_RST_2)	);

CCD_Capture			u3	(	.oDATA(mCCD_DATA),
							.oDVAL(mCCD_DVAL),
							.oX_Cont(X_Cont),
							.oY_Cont(Y_Cont),
							.oFrame_Cont(Frame_Cont),
							.iDATA(CCD_DATA),
							.iFVAL(CCD_FVAL),
							.iLVAL(CCD_LVAL),
							.iSTART(!KEY[3]),
							.iEND(!KEY[2]),
							.iCLK(CCD_PIXCLK),
							.iRST(DLY_RST_1)	);

RAW2RGB				u4	(	.oRed(mCCD_R),
							.oGreen(mCCD_G),
							.oBlue(mCCD_B),
							.oDVAL(mCCD_DVAL_d),
							.iX_Cont(X_Cont),
							.iY_Cont(Y_Cont),
							.iDATA(mCCD_DATA),
							.iDVAL(mCCD_DVAL),
							.iCLK(CCD_PIXCLK),
							.iRST(DLY_RST_1)	);


// Get the current color from the model
model_vhd m(
	.current_x(X_ADDR), .current_y(Y_ADDR),
	.vga_clk(CLOCK_27), .sys_clk(sys_clk), 
	.sdram_refclk_50mhz(CLOCK_50),
	.rst27(!DLY_RST_1), .sdram_reset(!DLY_RST_0), 
	.nleft(SW[6]), .nright(SW[7]),
	.nup(SW[4]), .ndown(SW[5]), .model_r(model_r),
	.model_g(model_g), .model_b(model_b),

	// sdram pins		
    .DRAM_DQ(DRAM_DQ),
    .DRAM_ADDR(DRAM_ADDR),
    .DRAM_LDQM(DRAM_LDQM),		
    .DRAM_UDQM(DRAM_UDQM),
    .DRAM_WE_N(DRAM_WE_N), 	
    .DRAM_CAS_N(DRAM_CAS_N), 		
    .DRAM_RAS_N(DRAM_RAS_N), 		
    .DRAM_CS_N(DRAM_CS_N),				
    .DRAM_BA_0(DRAM_BA_0),			
    .DRAM_BA_1(DRAM_BA_1),		
    .DRAM_CLK(DRAM_CLK),			
    .DRAM_CKE(DRAM_CKE),
	.request(request),
	.debug_frame_done(debug_frame_done),
				  .w1_full(w1_full),
				  .w2_full(w2_full),
			      .r1_empty(r1_empty),
				  .r2_empty(r2_empty),
	.count_diff(count_diff),	
	.intersected_tri_out(intersected_tri_out),
	.rotx(SW[1]),.roty(SW[2]),.rotz(SW[3]),
    .do_z_buffer(do_z_buffer),
	.accumulate(SW[17])
	);


// Hack

assign locked = 1;

assign request_out = request;

// PLL to generate a system clock from the vga_clk(CLOCK_27)
pll_sys my_pll_sys(
	.inclk0(CLOCK_27),
	.c0(sys_clk),
	.locked(sys_pll_locked));

endmodule

