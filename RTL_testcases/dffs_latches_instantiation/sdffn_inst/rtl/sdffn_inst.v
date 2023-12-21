//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2022, RapidSilicon
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF your_company
//                                                                  
//  RapidSilicon                   http://www.rapidsilicon.com         
                                   
//-------------------------------------------------------------------
// Title       : sdffn_inst
// Created     : 15/11/2022
// Description : Falling-edge D-flip-flop with active-high synchronous reset
// This module is instatiating sdffn model from cell_sims.v, for validation of sdffn device model.
//               
//-------------------------------------------------------------------  

`timescale 1ns / 1ps

module sdffn_inst (
	input clk, //clock
	input i_Reset, //reset signal
	input i_D, //input to flop
	output o_Q  //output from flop
	);

//
// INSTANTIATIONS
//
	sdffn inst(
		.D(i_D),
		.R(i_Reset),
		.C(clk),
		.Q(o_Q)
		);

endmodule