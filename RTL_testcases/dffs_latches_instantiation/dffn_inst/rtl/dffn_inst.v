//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2022, RapidSilicon
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF your_company
//                                                                  
//  RapidSilicon                   http://www.rapidsilicon.com         
                                   
//-------------------------------------------------------------------
// Title       : dffn_inst
// Created     : 15/11/2022
// Description : Simple DFF instance test-case with input registered at a negedge clock
// This module is instatiating dffn model from cell_sims.v, for validation of dffn device model.
//               
//-------------------------------------------------------------------  

`timescale 1ns / 1ps

module dffn_inst (
	input clk, //clock
	input i_D, //input to flop
	output o_Q  //output from flop
	);

//
// INSTANTIATIONS
//
	dffn inst(
		.D(i_D),
		.C(clk),
		.Q(o_Q)
		);

endmodule