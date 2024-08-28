//lpm_divide CBX_SINGLE_OUTPUT_FILE="ON" LPM_DREPRESENTATION="UNSIGNED" LPM_HINT="MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=TRUE" LPM_NREPRESENTATION="UNSIGNED" LPM_PIPELINE=10 LPM_TYPE="LPM_DIVIDE" LPM_WIDTHD=36 LPM_WIDTHN=36 clock denom numer quotient remain
//VERSION_BEGIN 11.0 cbx_mgl 2011:04:27:21:20:02:SJ cbx_stratixii 2011:04:27:21:05:53:SJ cbx_util_mgl 2011:04:27:21:05:53:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2011 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.



//synthesis_resources = lpm_divide 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mgn5o
	( 
	clock,
	denom,
	numer,
	quotient,
	remain) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [35:0]  denom;
	input   [35:0]  numer;
	output   [35:0]  quotient;
	output   [35:0]  remain;

	wire  [35:0]   wire_mgl_prim1_quotient;
	wire  [35:0]   wire_mgl_prim1_remain;

	lpm_divide   mgl_prim1
	( 
	.clock(clock),
	.denom(denom),
	.numer(numer),
	.quotient(wire_mgl_prim1_quotient),
	.remain(wire_mgl_prim1_remain));
	defparam
		mgl_prim1.lpm_drepresentation = "UNSIGNED",
		mgl_prim1.lpm_nrepresentation = "UNSIGNED",
		mgl_prim1.lpm_pipeline = 10,
		mgl_prim1.lpm_type = "LPM_DIVIDE",
		mgl_prim1.lpm_widthd = 36,
		mgl_prim1.lpm_widthn = 36,
		mgl_prim1.lpm_hint = "MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=TRUE";
	assign
		quotient = wire_mgl_prim1_quotient,
		remain = wire_mgl_prim1_remain;
endmodule //mgn5o
//VALID FILE
