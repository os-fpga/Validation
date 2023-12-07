//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2022, RapidSilicon
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF your_company
//                                                                  
//  RapidSilicon                   http://www.rapidsilicon.com         
                                   
//-------------------------------------------------------------------
// Title       : latch_inst
// Created     : 15/11/2022
// Description : Positive level-sensitive latch
// This module is instatiating latch model from cell_sims.v, for validation of latch device model.
//               
//-------------------------------------------------------------------  

`timescale 1ns / 1ps

module latch_inst (
	input i_G, //level sensitive control signal
	input i_D, //input to flop
	output o_Q  //output from flop
	);

//
// INSTANTIATIONS
//
	latch inst(
		.G(i_G),
		.D(i_D),
		.Q(o_Q)
		);

endmodule