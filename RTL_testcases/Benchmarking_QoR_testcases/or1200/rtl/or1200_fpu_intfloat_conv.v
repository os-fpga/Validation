/////////////////////////////////////////////////////////////////////
////                                                             ////
////  or1200_fpu_intfloat_conv                                   ////
////  Only conversion between 32-bit integer and single          ////
////  precision floating point format                            ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
//// Modified by Julius Baxter, July, 2010                       ////
////             julius.baxter@orsoc.se                          ////
////                                                             ////
//// TODO: Fix bug where 1.0f in round up goes to integer 2      ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000 Rudolf Usselmann                         ////
////                    rudi@asics.ws                            ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

/*

 FPU Operations (fpu_op):
 ========================

 0 = 
 1 = 
 2 = 
 3 = 
 4 = int to float
 5 = float to int
 6 =
 7 =

 Rounding Modes (rmode):
 =======================

 0 = round_nearest_even
 1 = round_to_zero
 2 = round_up
 3 = round_down

 */


module or1200_fpu_intfloat_conv
  ( 
    clk, rmode, fpu_op, opa, out, snan, ine, inv,
    overflow, underflow, zero
    );
   input		clk;
   input [1:0] 		rmode;
   input [2:0] 		fpu_op;
   input [31:0] 	opa;
   output [31:0] 	out;
   output		snan;   
   output		ine;
   output 		inv;   
   output 		overflow;
   output 		underflow;   
   output		zero;


   parameter	INF  = 31'h7f800000,
		  QNAN = 31'h7fc00001,
		  SNAN = 31'h7f800001;

   ////////////////////////////////////////////////////////////////////////
   //
   // Local Wires
   //
   reg 			zero=0;
   reg [31:0] 		opa_r=0;	// Input operand registers
   reg [31:0] 		out=0;		// Output register
   reg 			div_by_zero=0;	// Divide by zero output register
   wire [7:0] 		exp_fasu;	// Exponent output from EQU block
   reg [7:0] 		exp_r=0;		// Exponent output (registerd)
   wire 		co;		// carry output
   wire [30:0] 		out_d;		// Intermediate final result output
   wire 		overflow_d, underflow_d;// Overflow/Underflow
   reg 			inf=0, snan=0, qnan=0;// Output Registers for INF, S/QNAN
   reg 			ine=0;		// Output Registers for INE
   reg [1:0] 		rmode_r1=0, rmode_r2=0,// Pipeline registers for round mode
			rmode_r3=0;
   reg [2:0] 		fpu_op_r1=0, fpu_op_r2=0,// Pipeline registers for fp 
			                     // operation
			fpu_op_r3=0;

   ////////////////////////////////////////////////////////////////////////
     //
   // Input Registers
   //

   always @(posedge clk)
     opa_r <=  opa;


   always @(posedge clk)
     rmode_r1 <=  rmode;

   always @(posedge clk)
     rmode_r2 <=  rmode_r1;

   always @(posedge clk)
     rmode_r3 <=  rmode_r2;

   always @(posedge clk)
     fpu_op_r1 <=  fpu_op;

   always @(posedge clk)
     fpu_op_r2 <=  fpu_op_r1;

   always @(posedge clk)
     fpu_op_r3 <=  fpu_op_r2;

   ////////////////////////////////////////////////////////////////////////
   //
   // Exceptions block
   //
   wire 		inf_d, ind_d, qnan_d, snan_d, opa_nan;
   wire 		opa_00;   
   wire 		opa_inf;
   wire 		opa_dn;

   or1200_fpu_intfloat_conv_except u0
     (	.clk(clk),
	.opa(opa_r), 
	.opb(),
	.inf(inf_d), 
	.ind(ind_d),
	.qnan(qnan_d), 
	.snan(snan_d),
	.opa_nan(opa_nan), 
	.opb_nan(),
	.opa_00(opa_00),   
	.opb_00(),
	.opa_inf(opa_inf), 
	.opb_inf(),
	.opa_dn(opa_dn), 
	.opb_dn()
	);

   ////////////////////////////////////////////////////////////////////////
   //
   // Pre-Normalize block
   // - Adjusts the numbers to equal exponents and sorts them
   // - determine result sign
   // - determine actual operation to perform (add or sub)
   //

   wire 		nan_sign_d, result_zero_sign_d;
   reg 			sign_fasu_r=0;
   wire [1:0] 		exp_ovf;
   reg [1:0] 		exp_ovf_r=0;
  
   // This is all we need from post-norm module for int-float conversion
   reg 			opa_sign_r=0;
   always @(posedge clk)
     opa_sign_r <= opa_r[31];
   
   always @(posedge clk)
     sign_fasu_r <=  opa_sign_r; //sign_fasu;


   ////////////////////////////////////////////////////////////////////////
   //
   // Normalize Result
   //
   wire 		ine_d;
   wire 		inv_d;   
   wire 		sign_d;
   reg 			sign=0;
   reg [30:0] 		opa_r1=0;
   reg [47:0] 		fract_i2f=0;
   reg 			opas_r1=0, opas_r2=0;
   wire 		f2i_out_sign;
   wire [47:0] 		fract_denorm;

   always @(posedge clk)  // Exponent must be once cycle delayed
     case(fpu_op_r2)
       //4:	exp_r <=  0;
       5:	exp_r <=  opa_r1[30:23];
       default: exp_r <=  0;
     endcase

   always @(posedge clk)
     opa_r1 <=  opa_r[30:0];
   
   always @(posedge clk)
     fract_i2f <=  (fpu_op_r2==5) ?
		   (sign_d ?  1-{24'h00, (|opa_r1[30:23]), opa_r1[22:0]}-1 : 
		    {24'h0, (|opa_r1[30:23]), opa_r1[22:0]})
       : (sign_d ? 1 - {opa_r1, 17'h01} : {opa_r1, 17'h0});

   assign fract_denorm = fract_i2f;
   
   always @(posedge clk)
     opas_r1 <=  opa_r[31];

   always @(posedge clk)
     opas_r2 <=  opas_r1;

   assign sign_d = opa_sign_r; //sign_fasu;

   always @(posedge clk)
     sign <=  (rmode_r2==2'h3) ? !sign_d : sign_d;


   // Special case of largest negative integer we can convert to - usually
   // gets picked up as invalid, but really it's not, so deal with it as a
   // special case.
   wire 		f2i_special_case_no_inv;
   assign f2i_special_case_no_inv = (opa == 32'hcf000000);
   

   or1200_fpu_post_norm_intfloat_conv u4
     (
      .clk(clk),			// System Clock
      .fpu_op(fpu_op_r3),		// Floating Point Operation
      .opas(opas_r2),			// OPA Sign
      .sign(sign),			// Sign of the result
      .rmode(rmode_r3),		// Rounding mode
      .fract_in(fract_denorm),	// Fraction Input

      .exp_in(exp_r),			// Exponent Input
      .opa_dn(opa_dn),		// Operand A Denormalized
      .opa_nan(opa_nan),
      .opa_inf(opa_inf),
      
      .opb_dn(),		// Operand B Denormalized
      .out(out_d),		// Normalized output (un-registered)
      .ine(ine_d),		// Result Inexact output (un-registered)
      .inv(inv_d),            // Invalid input for f2i operation
      .overflow(overflow_d),	// Overflow output (un-registered)
      .underflow(underflow_d),// Underflow output (un-registered)
      .f2i_out_sign(f2i_out_sign)	// F2I Output Sign
      );

   ////////////////////////////////////////////////////////////////////////
     //
   // FPU Outputs
   //
   reg 			fasu_op_r1=0, fasu_op_r2=0;
   wire [30:0] 		out_fixed;
   wire 		output_zero_fasu;
   wire 		overflow_fasu;
   wire 		out_d_00;
   wire 		ine_fasu;
   wire 		underflow_fasu;   


   /*
    always @(posedge clk)
    fasu_op_r1 <=  fasu_op;

    always @(posedge clk)
    fasu_op_r2 <=  fasu_op_r1;
    */
   // Force pre-set values for non numerical output

   assign out_fixed = (	(qnan_d | snan_d) |
			(ind_d /*& !fasu_op_r2*/))  ? QNAN : INF;

   always @(posedge clk)
     out[30:0] <=  /*((inf_d & (fpu_op_r3!=3'b101)) | snan_d | qnan_d) 
		    & fpu_op_r3!=3'b100 ? out_fixed :*/ out_d;

   assign out_d_00 = !(|out_d);


   always @(posedge clk)
     out[31] <= (fpu_op_r3==3'b101) ? 
		f2i_out_sign : sign_fasu_r; 
   
   
   
   // Exception Outputs
   assign ine_fasu = (ine_d | overflow_d | underflow_d) & 
		     !(snan_d | qnan_d | inf_d);

   always @(posedge  clk)
     ine <= 	 fpu_op_r3[2] ? ine_d : ine_fasu;

   assign overflow = overflow_d & !(snan_d | qnan_d | inf_d);
   assign underflow = underflow_d & !(inf_d | snan_d | qnan_d);

   always @(posedge clk)
     snan <=  snan_d & (fpu_op_r3==3'b101);  // Only signal sNaN when ftoi

   // Status Outputs   
   assign output_zero_fasu = out_d_00 & !(inf_d | snan_d | qnan_d);

   always @(posedge clk)
     zero <= 	fpu_op_r3==3'b101 ? out_d_00 & !(snan_d | qnan_d) :
	     output_zero_fasu ;
   assign inv = inv_d & !f2i_special_case_no_inv;
   
endmodule // or1200_fpu_intfloat_conv


module or1200_fpu_intfloat_conv_except
  (	
	clk, opa, opb, inf, ind, qnan, snan, opa_nan, opb_nan,
	opa_00, opb_00, opa_inf, opb_inf, opa_dn, opb_dn
	);
   input		clk;
   input [31:0] 	opa, opb;
   output		inf, ind, qnan, snan, opa_nan, opb_nan;
   output		opa_00, opb_00;
   output		opa_inf, opb_inf;
   output		opa_dn;
   output		opb_dn;

   ////////////////////////////////////////////////////////////////////////
   //
   // Local Wires and registers
   //

   wire [7:0] 		expa, expb;		// alias to opX exponent
   wire [22:0] 		fracta, fractb;		// alias to opX fraction
   reg 			expa_ff=0, infa_f_r=0, qnan_r_a=0, snan_r_a=0;
   reg 			expb_ff=0, infb_f_r=0, qnan_r_b=0, snan_r_b=0;
   reg 			inf=0, ind=0, qnan=0, snan=0;	// Output registers
   reg 			opa_nan=0, opb_nan=0;
   reg 			expa_00=0, expb_00=0, fracta_00=0, fractb_00=0;
   reg 			opa_00=0, opb_00=0;
   reg 			opa_inf=0, opb_inf=0;
   reg 			opa_dn=0, opb_dn=0;

   ////////////////////////////////////////////////////////////////////////
   //
   // Aliases
   //

   assign   expa = opa[30:23];
   assign   expb = opb[30:23];
   assign fracta = opa[22:0];
   assign fractb = opb[22:0];

   ////////////////////////////////////////////////////////////////////////
   //
   // Determine if any of the input operators is a INF or NAN or any other 
   // special number
   //

   always @(posedge clk)
     expa_ff <=  &expa;

   always @(posedge clk)
     expb_ff <=  &expb;
   
   always @(posedge clk)
     infa_f_r <=  !(|fracta);

   always @(posedge clk)
     infb_f_r <=  !(|fractb);

   always @(posedge clk)
     qnan_r_a <=   fracta[22];

   always @(posedge clk)
     snan_r_a <=  !fracta[22] & |fracta[21:0];
   
   always @(posedge clk)
     qnan_r_b <=   fractb[22];

   always @(posedge clk)
     snan_r_b <=  !fractb[22]; // & |fractb[21:0];

   always @(posedge clk)
     ind  <=  (expa_ff & infa_f_r); // & (expb_ff & infb_f_r);

   always @(posedge clk)
     inf  <=  (expa_ff & infa_f_r); // | (expb_ff & infb_f_r);

   always @(posedge clk)
     qnan <=  (expa_ff & qnan_r_a); // | (expb_ff & qnan_r_b);

   always @(posedge clk)
     snan <=  (expa_ff & snan_r_a); // | (expb_ff & snan_r_b);

   always @(posedge clk)
     opa_nan <=  &expa & (|fracta[22:0]);

   always @(posedge clk)
     opb_nan <=  &expb & (|fractb[22:0]);

   always @(posedge clk)
     opa_inf <=  (expa_ff & infa_f_r);

   always @(posedge clk)
     opb_inf <=  (expb_ff & infb_f_r);

   always @(posedge clk)
     expa_00 <=  !(|expa);

   always @(posedge clk)
     expb_00 <=  !(|expb);

   always @(posedge clk)
     fracta_00 <=  !(|fracta);

   always @(posedge clk)
     fractb_00 <=  !(|fractb);

   always @(posedge clk)
     opa_00 <=  expa_00 & fracta_00;

   always @(posedge clk)
     opb_00 <=  expb_00 & fractb_00;

   always @(posedge clk)
     opa_dn <=  expa_00;

   always @(posedge clk)
     opb_dn <=  expb_00;

endmodule // or1200_fpu_intfloat_conv_except


