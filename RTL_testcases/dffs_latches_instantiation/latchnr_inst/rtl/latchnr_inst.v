//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2022, RapidSilicon
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF your_company
//                                                                  
//  RapidSilicon                   http://www.rapidsilicon.com         
                                   
//-------------------------------------------------------------------
// Title       : latchnr_inst
// Created     : 15/11/2022
// Description : Negative level-sensitive latch with active-high asyncronous reset
// This module is instatiating latchnr model from cell_sims.v, for validation of latchnr device model.
//               
//-------------------------------------------------------------------  

`timescale 1ns / 1ps

module latchnr_inst (
	input i_G, //level sensitive control signal
	input i_Reset, //reset signal
	input i_D, //input to flop
	output o_Q  //output from flop
	);

//
// INSTANTIATIONS
//
	latchnr inst(
		.G(i_G),
		.R(i_Reset),
		.D(i_D),
		.Q(o_Q)
		);

endmodule