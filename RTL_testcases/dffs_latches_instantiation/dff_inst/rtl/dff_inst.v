//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2022, RapidSilicon
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF your_company
//                                                                  
//  RapidSilicon                   http://www.rapidsilicon.com         
                                   
//-------------------------------------------------------------------
// Title       : dff_inst
// Created     : 15/11/2022
// Description : Simple DFF instance test-case with input registered at a posedge clock
// This module is instatiating dff model from cell_sims.v, for validation of dff device model.
//               
//-------------------------------------------------------------------  

`timescale 1ns / 1ps

module dff_inst (
	input clk, //clock
	input i_D, //input to flop
	output o_Q  //output from flop
	);

//
// INSTANTIATIONS
//
	dff inst(
		.D(i_D),
		.C(clk),
		.Q(o_Q)
		);

endmodule