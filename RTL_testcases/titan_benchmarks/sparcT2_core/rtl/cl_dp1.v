// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cl_dp1.v
// Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
// 4150 Network Circle, Santa Clara, California 95054, U.S.A.
//
// * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// 
// For the avoidance of doubt, and except that if any non-GPL license 
// choice is available it will apply instead, Sun elects to use only 
// the General Public License version 2 (GPLv2) at this time for any 
// software where a choice of GPL license versions is made 
// available with the language indicating that GPLv2 or any later version 
// may be used, or where a choice of which version of the GPL is applied is 
// otherwise unspecified. 
//
// Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
// CA 95054 USA or visit www.sun.com if you need additional information or 
// have any questions. 
// 
// ========== Copyright Header End ============================================
`define LIB
module cl_dp1_msffmin_30ps_16x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
             `ifdef FAST_FLUSH
 always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff




module cl_dp1_msffmin_30ps_8x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
             `ifdef FAST_FLUSH
 always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_dp1_msffmin_30ps_4x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE
	
             reg 	l1;
             `ifdef FAST_FLUSH
	 always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
		`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_dp1_msffmin_30ps_32x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
 `ifdef FAST_FLUSH
 always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_dp1_msffmin_30ps_1x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_dp1_bsac_cell_4x(q, so, d, l1clk, si, siclk, soclk, updateclk,
                           ac_mode, ac_test_signal);
   output     q;
   output       so;

   input         d, ac_test_signal;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   updateclk, ac_mode;

             reg       q;
             reg       so;
             wire      l1clk, siclk, soclk, updateclk;


             reg l1, qm;

             always @(l1clk or siclk or soclk or d or si)
              begin
    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
    if ( l1clk &&  siclk)           l1 <= si;    // Load master with
                                                 // scan or flush
    if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between
                                                   // data and scan
    if ( l1clk &&  !soclk)          so <= l1;     // Load slave with
                                                  // master data
    if ( l1clk &&  siclk && !soclk) so <= si;    // Flush
              end

                initial qm = 1'b0;

           always@(updateclk or l1)
                begin
                if(updateclk)  qm <=l1;
                end
always@(ac_mode or qm or ac_test_signal)
        begin
        if(ac_mode==0)  q=qm;
        else         q=qm ^ ac_test_signal;
        end
endmodule
module cl_dp1_blatch_4x ( latout, so, d, l1clk, si, siclk, soclk);

   output       latout;
   output       so;
   input         d;
   input         l1clk;
   input         si;
   input         siclk;
   input         soclk;
 

   wire  so;
   reg s, m;

   `ifdef SCAN_MODE

      always @(l1clk or siclk or soclk or d or si) begin

        if (!l1clk && !siclk)        m <=  d;    // Load master with data
        else if ( l1clk &&  siclk)   m <=  si;    // Load master with scan or flush
        else if (!l1clk &&  siclk)   m <=  1'bx;    // Conflict between data and scan

        if ( l1clk && !soclk && !siclk)  s <=  m;   // Load slave with master data
        else if (l1clk && siclk && !soclk)  s <= si;    // Flush
      end

   `else
      wire  si_unused = si;
`ifdef INITLATZERO


      initial m = 1'b0;
     `endif


      always @(l1clk or d or si or siclk) begin
        if(siclk==0 && l1clk==0) m =  d;
        else if(siclk && !l1clk)                m = 1'bx;
         if(siclk && l1clk) m = si;
        if(l1clk && !soclk) s = m;
      end

    `endif

      assign latout = m;
      assign so  =  s;


endmodule 
module cl_dp1_alatch_4x ( q, so, d, l1clk, si, siclk, soclk, se );





   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;
   input   se;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	


             reg l1;

             always @(l1clk or siclk or soclk or d or si or se)
              begin

                    if (siclk)           l1 <= si;    // Load master with scan or flush

		if(se && !soclk && l1clk && siclk) q <= si;
                else    if ( se && !soclk && l1clk)  q <= l1;    
                    else if ( !soclk && l1clk)  q <= d;
              end




          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif



         assign so = q;

endmodule // dff
module cl_dp1_msffmin_16x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff




module cl_dp1_msffmin_8x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_dp1_msffmin_4x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_dp1_msffmin_32x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_dp1_msffmin_1x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;
	     	
        `ifdef SCAN_MODE

             reg 	l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_dp1_rep_32x (
in,
out
);
input in;
output out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule

module cl_dp1_rep_m6_32x (
in,
out
);
input in;
output out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule

module cl_dp1_add12_8x (
cin,
in0,
in1,
out,
cout
);
input 	       cin;
input 	[11:0] in0;
input 	[11:0] in1;
output 	[11:0] out;
output 	       cout;

`ifdef LIB
  assign {cout, out[11:0]} = ({1'b0, in0[11:0]} + {1'b0, in1[11:0]} + {{12{1'b0}}, cin});
`endif

endmodule
module cl_dp1_add136_8x (
  din0,
  din1,
  din2,
  sel_din2,
  sum,
  fya_sticky_dp,
  fya_sticky_sp,
  fya_xicc_z);
wire [101:0] p;
wire [100:0] k;
wire [101:0] z;


  input  [135:0]  din0;
  input  [132:0]  din1;
  input  [135:0]  din2;
  input    [3:0]  sel_din2;

  output [135:0]  sum;
  output          fya_sticky_dp;
  output          fya_sticky_sp;
  output [1:0]    fya_xicc_z;

`ifdef LIB

         assign sum[135:0]  = {       din0[135:0]}      +
                               {3'b000,din1[132:0]}     +
                               ({{{40{sel_din2[3]}} & din2[135:96]},
                                 {{32{sel_din2[2]}} & din2[95:64] },
                                 {{32{sel_din2[1]}} & din2[63:32] },
                                 {{32{sel_din2[0]}} & din2[31:0]  }});


        //            127 126   125    ...   74      73  72         0
        //            --- ---   ---------------     ---  ------------
        // Float DP    x   x  .     52 fraction       G  -> Sticky ->

        //            127 126   125    ...   103    102  101        0
        //            --- ---   ---------------     ---  ------------
        // Float SP    x   x  .     23 fraction       G  -> Sticky ->


        assign p[101:0]      =  din0[101:0] ^  {din1[101:4],{4{1'b0}}};
        assign k[100:0]      = ~din0[100:0] & ~{din1[100:4],{4{1'b0}}};

        assign z[101:1]      =  p[101:1] ^  k[100:0];
        assign z[0]          = ~p[0];

        assign fya_sticky_sp = ~(& z[101:0]);
        assign fya_sticky_dp = ~(& z[72:0]);

        assign fya_xicc_z[1] = & z[63:0];
        assign fya_xicc_z[0] = & z[31:0];

`endif

endmodule
module cl_dp1_add16_8x (
cin,
in0,
in1,
out,
cout
);
input 	       cin;
input 	[15:0] in0;
input 	[15:0] in1;
output 	[15:0] out;
output 	       cout;

`ifdef LIB
  assign {cout, out[15:0]} = ({1'b0, in0[15:0]} + {1'b0, in1[15:0]} + {{16{1'b0}}, cin});
`endif

endmodule
module cl_dp1_add32_8x (
cin,
in0,
in1,
out,
cout
);
input 	       cin;
input 	[31:0] in0;
input 	[31:0] in1;
output 	[31:0] out;
output 	       cout;

`ifdef LIB
  assign {cout, out[31:0]} = ({1'b0, in0[31:0]} + {1'b0, in1[31:0]} + {{32{1'b0}}, cin});
`endif

endmodule
module cl_dp1_add4_8x (
cin,
in0,
in1,
out,
cout
);
input 	       cin;
input 	[3:0]  in0;
input 	[3:0]  in1;
output 	[3:0]  out;
output 	       cout;

`ifdef LIB
  assign {cout, out[3:0]} = ({1'b0, in0[3:0]} + {1'b0, in1[3:0]} + {{4{1'b0}}, cin});
`endif

endmodule
module cl_dp1_add64_8x (
cin,
in0,
in1,
out,
cout
);
input 	       cin;
input 	[63:0] in0;
input 	[63:0] in1;
output 	[63:0] out;
output 	       cout;

`ifdef LIB
  assign {cout, out[63:0]} = ({1'b0, in0[63:0]} + {1'b0, in1[63:0]} + {{64{1'b0}}, cin});
`endif

endmodule
module cl_dp1_add8_8x (
cin,
in0,
in1,
out,
cout
);
input 	       cin;
input 	[7:0]  in0;
input 	[7:0]  in1;
output 	[7:0]  out;
output 	       cout;

`ifdef LIB
  assign {cout, out[7:0]} = ({1'b0, in0[7:0]} + {1'b0, in1[7:0]} + {{8{1'b0}}, cin});
`endif

endmodule

module cl_dp1_aomux2_1x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_dp1_aomux2_2x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_dp1_aomux2_4x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_dp1_aomux2_6x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_dp1_aomux2_8x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule

module cl_dp1_aomux3_1x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_dp1_aomux3_2x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_dp1_aomux3_4x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_dp1_aomux3_6x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_dp1_aomux3_8x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule

module cl_dp1_aomux4_1x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_dp1_aomux4_2x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_dp1_aomux4_4x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_dp1_aomux4_6x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_dp1_aomux4_8x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule

module cl_dp1_aomux5_1x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_dp1_aomux5_2x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_dp1_aomux5_4x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_dp1_aomux5_6x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_dp1_aomux5_8x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule

module cl_dp1_aomux6_1x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_dp1_aomux6_2x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_dp1_aomux6_4x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_dp1_aomux6_6x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_dp1_aomux6_8x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule

module cl_dp1_aomux7_1x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_dp1_aomux7_2x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_dp1_aomux7_4x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_dp1_aomux7_6x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_dp1_aomux7_8x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule

module cl_dp1_aomux8_1x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_dp1_aomux8_2x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_dp1_aomux8_4x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_dp1_aomux8_6x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_dp1_aomux8_8x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_dp1_boothenc_4x (
  din,  
  xr_mode,
  dout,
  pout,
  hout
);

  input [2:0] din;

  input xr_mode;

  output [4:0] dout;

  output pout;

  output hout;
`ifdef LIB
 assign dout[0]	= (~xr_mode & ~din[2] & ~din[1] &  din[0]) |	// +1
		  (~xr_mode & ~din[2] &  din[1] & ~din[0]) |
		  ( xr_mode & ~din[2] &  din[1]          );

 assign dout[1]	= (~xr_mode & ~din[2] &  din[1] &  din[0]) |	// +2
		  ( xr_mode &  din[2] & ~din[1]          );
 	     			
 assign dout[2]	= (~xr_mode &  din[2] & ~din[1] & ~din[0]);	// -2

 assign dout[3]	= (~xr_mode &  din[2] & ~din[1] &  din[0]) |	// -1
		  (~xr_mode &  din[2] &  din[1] & ~din[0]);

 assign dout[4]	= ( xr_mode &  din[2] &  din[1]          );	// +3


 assign pout	= (~xr_mode & ~din[2] ) |	// P
		  (~xr_mode &  din[1] &  din[0]);

 assign hout	= (~xr_mode &  din[2] & ~din[1]          ) |	// H
		  (~xr_mode &  din[2] & ~din[0]);

`endif



endmodule

module cl_dp1_boothenc_8x (
  din,  
  xr_mode,
  dout,
  pout,
  hout
);

  input [2:0] din;

  input xr_mode;

  output [4:0] dout;

  output pout;

  output hout;
`ifdef LIB
 assign dout[0]	= (~xr_mode & ~din[2] & ~din[1] &  din[0]) |	// +1
		  (~xr_mode & ~din[2] &  din[1] & ~din[0]) |
		  ( xr_mode & ~din[2] &  din[1]          );

 assign dout[1]	= (~xr_mode & ~din[2] &  din[1] &  din[0]) |	// +2
		  ( xr_mode &  din[2] & ~din[1]          );
 	     			
 assign dout[2]	= (~xr_mode &  din[2] & ~din[1] & ~din[0]);	// -2

 assign dout[3]	= (~xr_mode &  din[2] & ~din[1] &  din[0]) |	// -1
		  (~xr_mode &  din[2] &  din[1] & ~din[0]);

 assign dout[4]	= ( xr_mode &  din[2] &  din[1]          );	// +3


 assign pout	= (~xr_mode & ~din[2] ) |	// P
		  (~xr_mode &  din[1] &  din[0]);

 assign hout	= (~xr_mode &  din[2] & ~din[1]          ) |	// H
		  (~xr_mode &  din[2] & ~din[0]);

`endif



endmodule

module cl_dp1_cmpr12_8x (
in0,
in1,
out
);
input	[11:0] in0;
input	[11:0] in1;
output	out;

`ifdef LIB
assign out = (in0[11:0] == in1[11:0]);
`endif

endmodule
module cl_dp1_cmpr16_8x (
in0,
in1,
out
);
input	[15:0] in0;
input	[15:0] in1;
output	out;

`ifdef LIB
assign out = (in0[15:0] == in1[15:0]);
`endif

endmodule
module cl_dp1_cmpr32_8x (
in0,
in1,
out
);
input	[31:0] in0;
input	[31:0] in1;
output	out;

`ifdef LIB
assign out = (in0[31:0] == in1[31:0]);
`endif

endmodule
module cl_dp1_cmpr4_8x (
in0,
in1,
out
);
input	[3:0] in0;
input	[3:0] in1;
output	out;

`ifdef LIB
assign out = (in0[3:0] == in1[3:0]);
`endif

endmodule
module cl_dp1_cmpr64_8x (
in0,
in1,
out
);
input	[63:0] in0;
input	[63:0] in1;
output	out;

`ifdef LIB
assign out = (in0[63:0] == in1[63:0]);
`endif

endmodule
module cl_dp1_cmpr8_8x (
in0,
in1,
out
);
input	[7:0] in0;
input	[7:0] in1;
output	out;

`ifdef LIB
assign out = (in0[7:0] == in1[7:0]);
`endif

endmodule
module cl_dp1_incr12_8x (
cin,
in0,
out,
cout
);
input		cin;
input [11:0] 	in0;
output [11:0]	out;
output 		cout;

`ifdef LIB
  assign {cout, out[11:0]} = {1'b0, in0[11:0]} + {12'b0, cin};
`endif

endmodule
module cl_dp1_incr16_8x (
cin,
in0,
out,
cout
);
input		cin;
input [15:0] 	in0;
output [15:0]	out;
output 		cout;

`ifdef LIB
  assign {cout, out[15:0]} = {1'b0, in0[15:0]} + {16'b0, cin};
`endif

endmodule
module cl_dp1_incr32_8x (
cin,
in0,
out,
cout
);
input		cin;
input [31:0] 	in0;
output [31:0]	out;
output 		cout;

`ifdef LIB
  assign {cout, out[31:0]} = {1'b0, in0[31:0]} + {32'b0, cin};
`endif

endmodule
module cl_dp1_incr4_8x (
cin,
in0,
out,
cout
);
input		cin;
input [3:0] 	in0;
output [3:0]	out;
output 		cout;

`ifdef LIB
  assign {cout, out[3:0]} = {1'b0, in0[3:0]} + {4'b0, cin};
`endif

endmodule
module cl_dp1_incr48_8x (
cin,
in0,
out,
cout
);
input		cin;
input [47:0] 	in0;
output [47:0]	out;
output 		cout;

`ifdef LIB
  assign {cout, out[47:0]} = {1'b0, in0[47:0]} + {48'b0, cin};
`endif

endmodule
module cl_dp1_incr64_8x (
cin,
in0,
out,
cout
);
input		cin;
input [63:0] 	in0;
output [63:0]	out;
output 		cout;

`ifdef LIB
  assign {cout, out[63:0]} = {1'b0, in0[63:0]} + {64'b0, cin};
`endif

endmodule
module cl_dp1_incr8_8x (
cin,
in0,
out,
cout
);
input		cin;
input [7:0] 	in0;
output [7:0]	out;
output 		cout;

`ifdef LIB
  assign {cout, out[7:0]} = {1'b0, in0[7:0]} + {8'b0, cin};
`endif

endmodule // cl_dp1_incr8_8x
module  cl_dp1_l1hdr_12x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
wire            l1en = (~stop & ( pce | pce_ov ));
assign       l1clk = (l2clk & l1en) | se;
assign siclk_out = aclk;
assign soclk_out = bclk;
`else
 `ifdef LIB
reg             l1en;
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

 //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority  
 assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

 `endif //  `ifdef LIB
`endif // !`ifdef FORMAL_TOOL


endmodule

module  cl_dp1_l1hdr_16x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
    assign siclk_out = aclk;
    assign soclk_out = bclk;
   `else
`ifdef LIB
   reg  l1en;
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif


  

   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

`endif
`endif

endmodule
module  cl_dp1_l1hdr_24x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
    assign siclk_out = aclk;
    assign soclk_out = bclk;
   `else
`ifdef LIB
   reg  l1en;
 
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

   

   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

`endif
`endif

endmodule
module  cl_dp1_l1hdr_32x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
    assign siclk_out = aclk;
    assign soclk_out = bclk;
   `else
`ifdef LIB
   reg  l1en;



  `ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

`endif
`endif

endmodule
module  cl_dp1_l1hdr_4x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
    assign siclk_out = aclk;
    assign soclk_out = bclk;
   `else
`ifdef LIB
   reg  l1en;
 


  `ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

`endif
`endif

endmodule

`ifdef FPGA
`else
module  cl_dp1_l1hdr_8x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
    assign siclk_out = aclk;
    assign soclk_out = bclk;
   `else
`ifdef LIB
   reg  l1en;
 


   `ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating.

assign siclk_out = aclk;
assign soclk_out = bclk;

`endif
`endif
endmodule

`endif // `ifdef FPGA

module  cl_dp1_l1hdr_48x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
    assign siclk_out = aclk;
    assign soclk_out = bclk;
   `else
`ifdef LIB
   reg  l1en;



  `ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

`endif
`endif

endmodule
module  cl_dp1_l1hdr_64x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
    wire l1en = (~stop & ( pce | pce_ov ));
    assign       l1clk = (l2clk & l1en) | se;
    assign siclk_out = aclk;
    assign soclk_out = bclk;
   `else
`ifdef LIB
   reg  l1en;



  `ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else
   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif

   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

`endif
`endif

endmodule
module  cl_dp1_l1hdr_nostop_48x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
    wire l1en = pce | pce_ov ;
    assign       l1clk = (l2clk & l1en) | se;
    assign siclk_out = aclk;
    assign soclk_out = bclk;
   `else
`ifdef LIB
   reg  l1en;
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= ((pce | pce_ov));
       end
`else


   always @ (negedge l2clk )
        begin
           l1en <= (( pce | pce_ov ));
        end
`endif

   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

`endif
`endif

endmodule
module cl_dp1_inv_diode_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
assign out = ~in;
`endif

endmodule
module  cl_dp1_l1hdr_nostop_72x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
    wire l1en =  pce | pce_ov ;
    assign       l1clk = (l2clk & l1en) | se;
    assign siclk_out = aclk;
    assign soclk_out = bclk;
   `else
`ifdef LIB
   reg  l1en;
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= ((pce | pce_ov));
       end
`else


   always @ (negedge l2clk )
        begin
           l1en <= (( pce | pce_ov ));
        end
`endif
   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

`endif
`endif

endmodule
module  cl_dp1_l1hdr_nostop_64x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
    wire l1en =  pce | pce_ov ;
    assign       l1clk = (l2clk & l1en) | se;
    assign siclk_out = aclk;
    assign soclk_out = bclk;
   `else
`ifdef LIB
   reg  l1en;

`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= ((pce | pce_ov));
       end
`else

   always @ (negedge l2clk )
        begin
           l1en <= (( pce | pce_ov ));
        end
`endif
   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

`endif
`endif

endmodule
module cl_dp1_msff_16x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff

module cl_dp1_msff_1x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff

module cl_dp1_msff_32x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff

module cl_dp1_msff_4x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff

module cl_dp1_msff_8x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff

module cl_dp1_msffi_16x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
             reg	q;
             wire     so;
             wire      l1clk, siclk, soclk;

      `ifdef SCAN_MODE
		reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else            

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b1;
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif
	 
	 
	always @ (q)
begin
  q_l=~q;
end



         assign so = q;

endmodule // dff
module cl_dp1_msffi_1x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
             reg	q;
             wire     so;
             wire      l1clk, siclk, soclk;

      `ifdef SCAN_MODE
		reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else            

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b1;
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif
	 
	 
	always @ (q)
begin
  q_l=~q;
end



         assign so = q;

endmodule // dff
module cl_dp1_msffi_32x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
             reg	q;
             wire     so;
             wire      l1clk, siclk, soclk;

     `ifdef SCAN_MODE
		reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else            

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b1;
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif
	 
	 
	always @ (q)
begin
  q_l=~q;
end



         assign so = q;

endmodule // dff
module cl_dp1_msffi_4x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
             reg	q;
             wire     so;
             wire      l1clk, siclk, soclk;

      `ifdef SCAN_MODE
		reg l1;
	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else            

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b1;
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif
	 
	 
	always @ (q)
begin
  q_l=~q;
end



         assign so = q;

endmodule // dff
module cl_dp1_msffi_8x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
             reg	q;
             wire     so;
             wire      l1clk, siclk, soclk;

       `ifdef SCAN_MODE
		reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else            

             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b1;
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif
	 
	 
	always @ (q)
begin
  q_l=~q;
end



         assign so = q;

endmodule // dff
module cl_dp1_msffiz_32x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
           
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q_l <=  1'b0;  //pseudo flush reset
                  end else begin
                    q_l <=  ~d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= ~d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q_l <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q_l <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q_l <=  ~d;
                else                  q_l <= 1'bx;
               end
        `endif

         assign so = q_l;

endmodule // dff
module cl_dp1_msffiz_16x ( q_l, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q_l;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q_l;
          
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q_l <=  1'b0;  //pseudo flush reset
                  end else begin
                    q_l <=  ~d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= ~d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q_l <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q_l <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q_l = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q_l <=  ~d;
                else                  q_l <= 1'bx;
               end
        `endif

         assign so = q_l;

endmodule // dff
module cl_dp1_mux2_12x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule

module cl_dp1_mux2_16x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule

module cl_dp1_mux2_24x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule

module cl_dp1_mux2_2x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule

module cl_dp1_mux2_32x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule

module cl_dp1_mux2_4x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule

module cl_dp1_mux2_6x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule

module cl_dp1_mux2_8x (
in0,
in1,
sel0,
out
);
input   in0;
input   in1;
input   sel0;
output  out;

`ifdef LIB
reg out;
   always @ ( sel0 or in0 or in1)
     case ( sel0 )
       1'b1:            out = in0;
       1'b0:            out = in1;

       default:                 out = 1'bx;

       endcase
`endif

endmodule




module cl_dp1_mux3_12x(
in0,
in1,
in2,
sel0,
sel1,
sel2,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              sel0;
   input              sel1;
   input              sel2;
   input              muxtst;
   output             out;

`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2}
`endif

 wire [3:0] sel= {muxtst,sel2,sel1,sel0};

 assign out = (sel[2:0] == 3'b001)   ?    in0:
              (sel[2:0] == 3'b010)   ?    in1:
              (sel[2:0] == 3'b100)   ?    in2:
              (sel[3:0] == 4'b0000)  ?   1'b1:
                                         1'bx;
`endif
endmodule

module cl_dp1_mux3_16x(
in0,
in1,
in2,
sel0,
sel1,
sel2,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              sel0;
   input              sel1;
   input              sel2;
   input              muxtst;
   output             out;

`ifdef LIB

`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2}
`endif

 wire [3:0] sel = {muxtst,sel2,sel1,sel0};

 assign out = (sel[2:0] == 3'b001)   ?    in0:
              (sel[2:0] == 3'b010)   ?    in1:
              (sel[2:0] == 3'b100)   ?    in2:
              (sel[3:0] == 4'b0000)  ?   1'b1:
                                         1'bx;
`endif
endmodule

module cl_dp1_mux3_24x(
in0,
in1,
in2,
sel0,
sel1,
sel2,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              sel0;
   input              sel1;
   input              sel2;
   input              muxtst;
   output             out;

`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2}
`endif

 wire [3:0] sel = {muxtst,sel2,sel1,sel0};

 assign out = (sel[2:0] == 3'b001)   ?    in0:
              (sel[2:0] == 3'b010)   ?    in1:
              (sel[2:0] == 3'b100)   ?    in2:
              (sel[3:0] == 4'b0000)  ?   1'b1:
                                         1'bx;
`endif
endmodule

module cl_dp1_mux3_2x(
in0,
in1,
in2,
sel0,
sel1,
sel2,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              sel0;
   input              sel1;
   input              sel2;
   input              muxtst;
   output             out;

`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2}
`endif

 wire [3:0] sel= {muxtst,sel2,sel1,sel0};

 assign out = (sel[2:0] == 3'b001)   ?    in0:
              (sel[2:0] == 3'b010)   ?    in1:
              (sel[2:0] == 3'b100)   ?    in2:
              (sel[3:0] == 4'b0000)  ?   1'b1:
                                         1'bx;
`endif
endmodule

module cl_dp1_mux3_32x(
in0,
in1,
in2,
sel0,
sel1,
sel2,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              sel0;
   input              sel1;
   input              sel2;
   input              muxtst;
   output             out;

`ifdef LIB


 wire [3:0] sel= {muxtst,sel2,sel1,sel0};

 assign out = (sel[2:0] == 3'b001)   ?    in0:
              (sel[2:0] == 3'b010)   ?    in1:
              (sel[2:0] == 3'b100)   ?    in2:
              (sel[3:0] == 4'b0000)  ?   1'b1:
                                         1'bx;
`endif
endmodule

module cl_dp1_mux3_4x(
in0,
in1,
in2,
sel0,
sel1,
sel2,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              sel0;
   input              sel1;
   input              sel2;
   input              muxtst;
   output             out;

`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2}
`endif

 wire [3:0] sel= {muxtst,sel2,sel1,sel0};

 assign out = (sel[2:0] == 3'b001)   ?    in0:
              (sel[2:0] == 3'b010)   ?    in1:
              (sel[2:0] == 3'b100)   ?    in2:
              (sel[3:0] == 4'b0000)  ?   1'b1:
                                         1'bx;
`endif
endmodule

module cl_dp1_mux3_6x(
in0,
in1,
in2,
sel0,
sel1,
sel2,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              sel0;
   input              sel1;
   input              sel2;
   input              muxtst;
   output             out;

`ifdef LIB

`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2}
`endif

 wire [3:0] sel= {muxtst,sel2,sel1,sel0};

 assign out = (sel[2:0] == 3'b001)   ?    in0:
              (sel[2:0] == 3'b010)   ?    in1:
              (sel[2:0] == 3'b100)   ?    in2:
              (sel[3:0] == 4'b0000)  ?   1'b1:
                                         1'bx;
`endif
endmodule

module cl_dp1_mux3_8x(
in0,
in1,
in2,
sel0,
sel1,
sel2,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              sel0;
   input              sel1;
   input              sel2;
   input              muxtst;
   output             out;

`ifdef LIB

`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2}
`endif

 wire [3:0] sel = {muxtst,sel2,sel1,sel0};

 assign out = (sel[2:0] == 3'b001)   ?    in0:
              (sel[2:0] == 3'b010)   ?    in1:
              (sel[2:0] == 3'b100)   ?    in2:
              (sel[3:0] == 4'b0000)  ?   1'b1:
                                         1'bx;
`endif
endmodule


module cl_dp1_mux4_12x(
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              muxtst;
   output             out;


 `ifdef LIB

`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3}
`endif 
  
 wire [4:0] sel = {muxtst,sel3,sel2,sel1,sel0};

 assign out = (sel[3:0] == 4'b0001)   ?    in0:
              (sel[3:0] == 4'b0010)   ?    in1:
              (sel[3:0] == 4'b0100)   ?    in2:
              (sel[3:0] == 4'b1000)   ?    in3:
              (sel[4:0] == 5'b00000)  ?   1'b1:
                                          1'bx;
`endif
endmodule

module cl_dp1_mux4_16x(
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              muxtst;
   output             out;


 `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3}
`endif
 
  
 wire [4:0] sel = {muxtst,sel3,sel2,sel1,sel0};

 assign out = (sel[3:0] == 4'b0001)   ?    in0:
              (sel[3:0] == 4'b0010)   ?    in1:
              (sel[3:0] == 4'b0100)   ?    in2:
              (sel[3:0] == 4'b1000)   ?    in3:
              (sel[4:0] == 5'b00000)  ?   1'b1:
                                          1'bx;
`endif
endmodule

module cl_dp1_mux4_24x(
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              muxtst;
   output             out;


 `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3}
`endif
 
  
 wire [4:0] sel = {muxtst,sel3,sel2,sel1,sel0};

 assign out = (sel[3:0] == 4'b0001)   ?    in0:
              (sel[3:0] == 4'b0010)   ?    in1:
              (sel[3:0] == 4'b0100)   ?    in2:
              (sel[3:0] == 4'b1000)   ?    in3:
              (sel[4:0] == 5'b00000)  ?   1'b1:
                                          1'bx;
`endif
endmodule

module cl_dp1_mux4_2x(
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              muxtst;
   output             out;


 `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3}
`endif
 
  
 wire [4:0] sel = {muxtst,sel3,sel2,sel1,sel0};

 assign out = (sel[3:0] == 4'b0001)   ?    in0:
              (sel[3:0] == 4'b0010)   ?    in1:
              (sel[3:0] == 4'b0100)   ?    in2:
              (sel[3:0] == 4'b1000)   ?    in3:
              (sel[4:0] == 5'b00000)  ?   1'b1:
                                          1'bx;
`endif
endmodule

module cl_dp1_mux4_32x(
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              muxtst;
   output             out;


 `ifdef LIB
 `ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3}
`endif
 
  
 wire [4:0] sel = {muxtst,sel3,sel2,sel1,sel0};

 assign out = (sel[3:0] == 4'b0001)   ?    in0:
              (sel[3:0] == 4'b0010)   ?    in1:
              (sel[3:0] == 4'b0100)   ?    in2:
              (sel[3:0] == 4'b1000)   ?    in3:
              (sel[4:0] == 5'b00000)  ?   1'b1:
                                          1'bx;
`endif
endmodule

module cl_dp1_mux4_4x(
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              muxtst;
   output             out;


 `ifdef LIB
 `ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3}
`endif
 
  
 wire [4:0] sel = {muxtst,sel3,sel2,sel1,sel0};

 assign out = (sel[3:0] == 4'b0001)   ?    in0:
              (sel[3:0] == 4'b0010)   ?    in1:
              (sel[3:0] == 4'b0100)   ?    in2:
              (sel[3:0] == 4'b1000)   ?    in3:
              (sel[4:0] == 5'b00000)  ?   1'b1:
                                          1'bx;
`endif
endmodule

module cl_dp1_mux4_6x(
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              muxtst;
   output             out;


 `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3}
`endif
 
  
 wire [4:0] sel = {muxtst,sel3,sel2,sel1,sel0};

 assign out = (sel[3:0] == 4'b0001)   ?    in0:
              (sel[3:0] == 4'b0010)   ?    in1:
              (sel[3:0] == 4'b0100)   ?    in2:
              (sel[3:0] == 4'b1000)   ?    in3:
              (sel[4:0] == 5'b00000)  ?   1'b1:
                                          1'bx;
`endif
endmodule

module cl_dp1_mux4_8x(
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
muxtst,
out
);

 

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              muxtst;
   output             out;


 `ifdef LIB

`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3}
`endif 
  
 wire [4:0] sel = {muxtst,sel3,sel2,sel1,sel0};

 assign out = (sel[3:0] == 4'b0001)   ?    in0:
              (sel[3:0] == 4'b0010)   ?    in1:
              (sel[3:0] == 4'b0100)   ?    in2:
              (sel[3:0] == 4'b1000)   ?    in3:
              (sel[4:0] == 5'b00000)  ?   1'b1:
                                          1'bx;
`endif
endmodule



module cl_dp1_mux5_12x(
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
muxtst,
out
);

  

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              muxtst;
   output             out;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4}
`endif
 
 wire [5:0] sel = {muxtst,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[4:0] == 5'b00001)   ?    in0:
              (sel[4:0] == 5'b00010)   ?    in1:
              (sel[4:0] == 5'b00100)   ?    in2:
              (sel[4:0] == 5'b01000)   ?    in3:
              (sel[4:0] == 5'b10000)   ?    in4:
              (sel[5:0] == 6'b000000)  ?   1'b1:
                                           1'bx;
`endif
endmodule

module cl_dp1_mux5_16x(
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
muxtst,
out
);

  

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              muxtst;
   output             out;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4}
`endif
 
 wire [5:0] sel = {muxtst,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[4:0] == 5'b00001)   ?    in0:
              (sel[4:0] == 5'b00010)   ?    in1:
              (sel[4:0] == 5'b00100)   ?    in2:
              (sel[4:0] == 5'b01000)   ?    in3:
              (sel[4:0] == 5'b10000)   ?    in4:
              (sel[5:0] == 6'b000000)  ?   1'b1:
                                           1'bx;
`endif
endmodule

module cl_dp1_mux5_24x(
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
muxtst,
out
);

  

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              muxtst;
   output             out;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4}
`endif
 
 wire [5:0] sel = {muxtst,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[4:0] == 5'b00001)   ?    in0:
              (sel[4:0] == 5'b00010)   ?    in1:
              (sel[4:0] == 5'b00100)   ?    in2:
              (sel[4:0] == 5'b01000)   ?    in3:
              (sel[4:0] == 5'b10000)   ?    in4:
              (sel[5:0] == 6'b000000)  ?   1'b1:
                                           1'bx;
`endif
endmodule

module cl_dp1_mux5_2x(
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
muxtst,
out
);

  

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              muxtst;
   output             out;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4}
`endif
 
 wire [5:0] sel = {muxtst,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[4:0] == 5'b00001)   ?    in0:
              (sel[4:0] == 5'b00010)   ?    in1:
              (sel[4:0] == 5'b00100)   ?    in2:
              (sel[4:0] == 5'b01000)   ?    in3:
              (sel[4:0] == 5'b10000)   ?    in4:
              (sel[5:0] == 6'b000000)  ?   1'b1:
                                           1'bx;
`endif
endmodule

module cl_dp1_mux5_32x(
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
muxtst,
out
);

  

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              muxtst;
   output             out;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4}
`endif
 
 wire [5:0] sel = {muxtst,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[4:0] == 5'b00001)   ?    in0:
              (sel[4:0] == 5'b00010)   ?    in1:
              (sel[4:0] == 5'b00100)   ?    in2:
              (sel[4:0] == 5'b01000)   ?    in3:
              (sel[4:0] == 5'b10000)   ?    in4:
              (sel[5:0] == 6'b000000)  ?   1'b1:
                                           1'bx;
`endif
endmodule

module cl_dp1_mux5_4x(
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
muxtst,
out
);

  

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              muxtst;
   output             out;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4}
`endif
 
 wire [5:0] sel = {muxtst,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[4:0] == 5'b00001)   ?    in0:
              (sel[4:0] == 5'b00010)   ?    in1:
              (sel[4:0] == 5'b00100)   ?    in2:
              (sel[4:0] == 5'b01000)   ?    in3:
              (sel[4:0] == 5'b10000)   ?    in4:
              (sel[5:0] == 6'b000000)  ?   1'b1:
                                           1'bx;
`endif
endmodule

module cl_dp1_mux5_6x(
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
muxtst,
out
);

  

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              muxtst;
   output             out;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4}
`endif
 
 wire [5:0] sel = {muxtst,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[4:0] == 5'b00001)   ?    in0:
              (sel[4:0] == 5'b00010)   ?    in1:
              (sel[4:0] == 5'b00100)   ?    in2:
              (sel[4:0] == 5'b01000)   ?    in3:
              (sel[4:0] == 5'b10000)   ?    in4:
              (sel[5:0] == 6'b000000)  ?   1'b1:
                                           1'bx;
`endif
endmodule

module cl_dp1_mux5_8x(
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
muxtst,
out
);

  

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              muxtst;
   output             out;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4}
`endif
 
 wire [5:0] sel = {muxtst,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[4:0] == 5'b00001)   ?    in0:
              (sel[4:0] == 5'b00010)   ?    in1:
              (sel[4:0] == 5'b00100)   ?    in2:
              (sel[4:0] == 5'b01000)   ?    in3:
              (sel[4:0] == 5'b10000)   ?    in4:
              (sel[5:0] == 6'b000000)  ?   1'b1:
                                           1'bx;
`endif
endmodule

module cl_dp1_mux6_12x(
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
muxtst,
out
);



   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              muxtst;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5}
`endif
 wire [6:0] sel = {muxtst,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[5:0] == 6'b000001)   ?    in0:
              (sel[5:0] == 6'b000010)   ?    in1:
              (sel[5:0] == 6'b000100)   ?    in2:
              (sel[5:0] == 6'b001000)   ?    in3:
              (sel[5:0] == 6'b010000)   ?    in4:
              (sel[5:0] == 6'b100000)   ?    in5:
              (sel[6:0] == 7'b0000000)  ?   1'b1:
                                            1'bx;
`endif
endmodule

module cl_dp1_mux6_16x(
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
muxtst,
out
);



   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              muxtst;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5}
`endif
 wire [6:0] sel = {muxtst,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[5:0] == 6'b000001)   ?    in0:
              (sel[5:0] == 6'b000010)   ?    in1:
              (sel[5:0] == 6'b000100)   ?    in2:
              (sel[5:0] == 6'b001000)   ?    in3:
              (sel[5:0] == 6'b010000)   ?    in4:
              (sel[5:0] == 6'b100000)   ?    in5:
              (sel[6:0] == 7'b0000000)  ?   1'b1:
                                            1'bx;
`endif
endmodule

module cl_dp1_mux6_24x(
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
muxtst,
out
);



   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              muxtst;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5}
`endif
 wire [6:0] sel = {muxtst,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[5:0] == 6'b000001)   ?    in0:
              (sel[5:0] == 6'b000010)   ?    in1:
              (sel[5:0] == 6'b000100)   ?    in2:
              (sel[5:0] == 6'b001000)   ?    in3:
              (sel[5:0] == 6'b010000)   ?    in4:
              (sel[5:0] == 6'b100000)   ?    in5:
              (sel[6:0] == 7'b0000000)  ?   1'b1:
                                            1'bx;
`endif
endmodule

module cl_dp1_mux6_2x(
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
muxtst,
out
);



   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              muxtst;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5}
`endif
 wire [6:0] sel = {muxtst,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[5:0] == 6'b000001)   ?    in0:
              (sel[5:0] == 6'b000010)   ?    in1:
              (sel[5:0] == 6'b000100)   ?    in2:
              (sel[5:0] == 6'b001000)   ?    in3:
              (sel[5:0] == 6'b010000)   ?    in4:
              (sel[5:0] == 6'b100000)   ?    in5:
              (sel[6:0] == 7'b0000000)  ?   1'b1:
                                            1'bx;
`endif
endmodule

module cl_dp1_mux6_32x(
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
muxtst,
out
);



   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              muxtst;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5}
`endif
 wire [6:0] sel = {muxtst,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[5:0] == 6'b000001)   ?    in0:
              (sel[5:0] == 6'b000010)   ?    in1:
              (sel[5:0] == 6'b000100)   ?    in2:
              (sel[5:0] == 6'b001000)   ?    in3:
              (sel[5:0] == 6'b010000)   ?    in4:
              (sel[5:0] == 6'b100000)   ?    in5:
              (sel[6:0] == 7'b0000000)  ?   1'b1:
                                            1'bx;
`endif
endmodule

module cl_dp1_mux6_4x(
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
muxtst,
out
);



   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              muxtst;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5}
`endif
 wire [6:0] sel = {muxtst,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[5:0] == 6'b000001)   ?    in0:
              (sel[5:0] == 6'b000010)   ?    in1:
              (sel[5:0] == 6'b000100)   ?    in2:
              (sel[5:0] == 6'b001000)   ?    in3:
              (sel[5:0] == 6'b010000)   ?    in4:
              (sel[5:0] == 6'b100000)   ?    in5:
              (sel[6:0] == 7'b0000000)  ?   1'b1:
                                            1'bx;
`endif
endmodule

module cl_dp1_mux6_6x(
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
muxtst,
out
);



   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              muxtst;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5}
`endif
 wire [6:0] sel = {muxtst,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[5:0] == 6'b000001)   ?    in0:
              (sel[5:0] == 6'b000010)   ?    in1:
              (sel[5:0] == 6'b000100)   ?    in2:
              (sel[5:0] == 6'b001000)   ?    in3:
              (sel[5:0] == 6'b010000)   ?    in4:
              (sel[5:0] == 6'b100000)   ?    in5:
              (sel[6:0] == 7'b0000000)  ?   1'b1:
                                            1'bx;
`endif
endmodule

module cl_dp1_mux6_8x(
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
muxtst,
out
);


   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              muxtst;
`ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5}
`endif

 wire [6:0] sel = {muxtst,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[5:0] == 6'b000001)   ?    in0:
              (sel[5:0] == 6'b000010)   ?    in1:
              (sel[5:0] == 6'b000100)   ?    in2:
              (sel[5:0] == 6'b001000)   ?    in3:
              (sel[5:0] == 6'b010000)   ?    in4:
              (sel[5:0] == 6'b100000)   ?    in5:
              (sel[6:0] == 7'b0000000)  ?   1'b1:
                                            1'bx;
`endif
endmodule


module cl_dp1_mux7_12x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
muxtst,
out
);


   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              muxtst;
  
   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6}
`endif   

 wire [7:0] sel = {muxtst,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[6:0] == 7'b0000001)   ?    in0:
              (sel[6:0] == 7'b0000010)   ?    in1:
              (sel[6:0] == 7'b0000100)   ?    in2:
              (sel[6:0] == 7'b0001000)   ?    in3:
              (sel[6:0] == 7'b0010000)   ?    in4:
              (sel[6:0] == 7'b0100000)   ?    in5:
              (sel[6:0] == 7'b1000000)   ?    in6:
              (sel[7:0] == 8'b00000000)  ?   1'b1:
                                             1'bx;
`endif
endmodule

module cl_dp1_mux7_16x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
muxtst,
out
);


   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              muxtst;
  
   `ifdef LIB
   
   `ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6}
`endif

 wire [7:0] sel = {muxtst,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[6:0] == 7'b0000001)   ?    in0:
              (sel[6:0] == 7'b0000010)   ?    in1:
              (sel[6:0] == 7'b0000100)   ?    in2:
              (sel[6:0] == 7'b0001000)   ?    in3:
              (sel[6:0] == 7'b0010000)   ?    in4:
              (sel[6:0] == 7'b0100000)   ?    in5:
              (sel[6:0] == 7'b1000000)   ?    in6:
              (sel[7:0] == 8'b00000000)  ?   1'b1:
                                             1'bx;
`endif
endmodule

module cl_dp1_mux7_24x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
muxtst,
out
);


   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              muxtst;
  
   `ifdef LIB
   `ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6}
`endif

 wire [7:0] sel = {muxtst,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[6:0] == 7'b0000001)   ?    in0:
              (sel[6:0] == 7'b0000010)   ?    in1:
              (sel[6:0] == 7'b0000100)   ?    in2:
              (sel[6:0] == 7'b0001000)   ?    in3:
              (sel[6:0] == 7'b0010000)   ?    in4:
              (sel[6:0] == 7'b0100000)   ?    in5:
              (sel[6:0] == 7'b1000000)   ?    in6:
              (sel[7:0] == 8'b00000000)  ?   1'b1:
                                             1'bx;
`endif
endmodule

module cl_dp1_mux7_2x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
muxtst,
out
);


   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              muxtst;
  
   `ifdef LIB
   `ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6}
`endif

 wire [7:0] sel = {muxtst,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[6:0] == 7'b0000001)   ?    in0:
              (sel[6:0] == 7'b0000010)   ?    in1:
              (sel[6:0] == 7'b0000100)   ?    in2:
              (sel[6:0] == 7'b0001000)   ?    in3:
              (sel[6:0] == 7'b0010000)   ?    in4:
              (sel[6:0] == 7'b0100000)   ?    in5:
              (sel[6:0] == 7'b1000000)   ?    in6:
              (sel[7:0] == 8'b00000000)  ?   1'b1:
                                             1'bx;
`endif
endmodule

module cl_dp1_mux7_32x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
muxtst,
out
);


   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              muxtst;
  
   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6}
`endif   

 wire [7:0] sel = {muxtst,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[6:0] == 7'b0000001)   ?    in0:
              (sel[6:0] == 7'b0000010)   ?    in1:
              (sel[6:0] == 7'b0000100)   ?    in2:
              (sel[6:0] == 7'b0001000)   ?    in3:
              (sel[6:0] == 7'b0010000)   ?    in4:
              (sel[6:0] == 7'b0100000)   ?    in5:
              (sel[6:0] == 7'b1000000)   ?    in6:
              (sel[7:0] == 8'b00000000)  ?   1'b1:
                                             1'bx;
`endif
endmodule

module cl_dp1_mux7_4x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
muxtst,
out
);


   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              muxtst;
  
   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6}
`endif   

 wire [7:0] sel = {muxtst,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[6:0] == 7'b0000001)   ?    in0:
              (sel[6:0] == 7'b0000010)   ?    in1:
              (sel[6:0] == 7'b0000100)   ?    in2:
              (sel[6:0] == 7'b0001000)   ?    in3:
              (sel[6:0] == 7'b0010000)   ?    in4:
              (sel[6:0] == 7'b0100000)   ?    in5:
              (sel[6:0] == 7'b1000000)   ?    in6:
              (sel[7:0] == 8'b00000000)  ?   1'b1:
                                             1'bx;
`endif
endmodule

module cl_dp1_mux7_6x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
muxtst,
out
);


   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              muxtst;
  
   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6}
`endif   

 wire [7:0] sel = {muxtst,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[6:0] == 7'b0000001)   ?    in0:
              (sel[6:0] == 7'b0000010)   ?    in1:
              (sel[6:0] == 7'b0000100)   ?    in2:
              (sel[6:0] == 7'b0001000)   ?    in3:
              (sel[6:0] == 7'b0010000)   ?    in4:
              (sel[6:0] == 7'b0100000)   ?    in5:
              (sel[6:0] == 7'b1000000)   ?    in6:
              (sel[7:0] == 8'b00000000)  ?   1'b1:
                                             1'bx;
`endif
endmodule

module cl_dp1_mux7_8x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
muxtst,
out
);


   output             out;

   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              muxtst;
  
   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6}
`endif   

 wire [7:0] sel = {muxtst,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[6:0] == 7'b0000001)   ?    in0:
              (sel[6:0] == 7'b0000010)   ?    in1:
              (sel[6:0] == 7'b0000100)   ?    in2:
              (sel[6:0] == 7'b0001000)   ?    in3:
              (sel[6:0] == 7'b0010000)   ?    in4:
              (sel[6:0] == 7'b0100000)   ?    in5:
              (sel[6:0] == 7'b1000000)   ?    in6:
              (sel[7:0] == 8'b00000000)  ?   1'b1:
                                             1'bx;
`endif
endmodule


module cl_dp1_mux8_12x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
muxtst,
out
);




   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              in7;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              sel7;
   input              muxtst;
   output             out;

   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6,sel7}
`endif   
 wire [8:0] sel = {muxtst,sel7,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[7:0] == 8'b00000001)   ?    in0:
              (sel[7:0] == 8'b00000010)   ?    in1:
              (sel[7:0] == 8'b00000100)   ?    in2:
              (sel[7:0] == 8'b00001000)   ?    in3:
              (sel[7:0] == 8'b00010000)   ?    in4:
              (sel[7:0] == 8'b00100000)   ?    in5:
              (sel[7:0] == 8'b01000000)   ?    in6:
              (sel[7:0] == 8'b10000000)   ?    in7:
              (sel[8:0] == 9'b000000000)  ?   1'b1:
                                              1'bx;
`endif
endmodule

module cl_dp1_mux8_16x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
muxtst,
out
);




   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              in7;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              sel7;
   input              muxtst;
   output             out;

   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6,sel7}
`endif   
 wire [8:0] sel = {muxtst,sel7,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[7:0] == 8'b00000001)   ?    in0:
              (sel[7:0] == 8'b00000010)   ?    in1:
              (sel[7:0] == 8'b00000100)   ?    in2:
              (sel[7:0] == 8'b00001000)   ?    in3:
              (sel[7:0] == 8'b00010000)   ?    in4:
              (sel[7:0] == 8'b00100000)   ?    in5:
              (sel[7:0] == 8'b01000000)   ?    in6:
              (sel[7:0] == 8'b10000000)   ?    in7:
              (sel[8:0] == 9'b000000000)  ?   1'b1:
                                              1'bx;
`endif
endmodule

module cl_dp1_mux8_24x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
muxtst,
out
);




   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              in7;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              sel7;
   input              muxtst;
   output             out;

   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6,sel7}
`endif   
 wire [8:0] sel = {muxtst,sel7,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[7:0] == 8'b00000001)   ?    in0:
              (sel[7:0] == 8'b00000010)   ?    in1:
              (sel[7:0] == 8'b00000100)   ?    in2:
              (sel[7:0] == 8'b00001000)   ?    in3:
              (sel[7:0] == 8'b00010000)   ?    in4:
              (sel[7:0] == 8'b00100000)   ?    in5:
              (sel[7:0] == 8'b01000000)   ?    in6:
              (sel[7:0] == 8'b10000000)   ?    in7:
              (sel[8:0] == 9'b000000000)  ?   1'b1:
                                              1'bx;
`endif
endmodule

module cl_dp1_mux8_2x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
muxtst,
out
);




   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              in7;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              sel7;
   input              muxtst;
   output             out;

   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6,sel7}
`endif   
 wire [8:0] sel = {muxtst,sel7,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[7:0] == 8'b00000001)   ?    in0:
              (sel[7:0] == 8'b00000010)   ?    in1:
              (sel[7:0] == 8'b00000100)   ?    in2:
              (sel[7:0] == 8'b00001000)   ?    in3:
              (sel[7:0] == 8'b00010000)   ?    in4:
              (sel[7:0] == 8'b00100000)   ?    in5:
              (sel[7:0] == 8'b01000000)   ?    in6:
              (sel[7:0] == 8'b10000000)   ?    in7:
              (sel[8:0] == 9'b000000000)  ?   1'b1:
                                              1'bx;
`endif
endmodule

module cl_dp1_mux8_32x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
muxtst,
out
);




   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              in7;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              sel7;
   input              muxtst;
   output             out;

   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6,sel7}
`endif   
 wire [8:0] sel = {muxtst,sel7,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[7:0] == 8'b00000001)   ?    in0:
              (sel[7:0] == 8'b00000010)   ?    in1:
              (sel[7:0] == 8'b00000100)   ?    in2:
              (sel[7:0] == 8'b00001000)   ?    in3:
              (sel[7:0] == 8'b00010000)   ?    in4:
              (sel[7:0] == 8'b00100000)   ?    in5:
              (sel[7:0] == 8'b01000000)   ?    in6:
              (sel[7:0] == 8'b10000000)   ?    in7:
              (sel[8:0] == 9'b000000000)  ?   1'b1:
                                              1'bx;
`endif
endmodule

module cl_dp1_mux8_4x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
muxtst,
out
);




   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              in7;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              sel7;
   input              muxtst;
   output             out;

   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6,sel7}
`endif   
 wire [8:0] sel = {muxtst,sel7,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[7:0] == 8'b00000001)   ?    in0:
              (sel[7:0] == 8'b00000010)   ?    in1:
              (sel[7:0] == 8'b00000100)   ?    in2:
              (sel[7:0] == 8'b00001000)   ?    in3:
              (sel[7:0] == 8'b00010000)   ?    in4:
              (sel[7:0] == 8'b00100000)   ?    in5:
              (sel[7:0] == 8'b01000000)   ?    in6:
              (sel[7:0] == 8'b10000000)   ?    in7:
              (sel[8:0] == 9'b000000000)  ?   1'b1:
                                              1'bx;
`endif
endmodule

module cl_dp1_mux8_6x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
muxtst,
out
);




   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              in7;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              sel7;
   input              muxtst;
   output             out;

   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6,sel7}
`endif   
 wire [8:0] sel = {muxtst,sel7,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[7:0] == 8'b00000001)   ?    in0:
              (sel[7:0] == 8'b00000010)   ?    in1:
              (sel[7:0] == 8'b00000100)   ?    in2:
              (sel[7:0] == 8'b00001000)   ?    in3:
              (sel[7:0] == 8'b00010000)   ?    in4:
              (sel[7:0] == 8'b00100000)   ?    in5:
              (sel[7:0] == 8'b01000000)   ?    in6:
              (sel[7:0] == 8'b10000000)   ?    in7:
              (sel[8:0] == 9'b000000000)  ?   1'b1:
                                              1'bx;
`endif
endmodule

module cl_dp1_mux8_8x(
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
muxtst,
out
);




   input              in0;
   input              in1;
   input              in2;
   input              in3;
   input              in4;
   input              in5;
   input              in6;
   input              in7;
   input              sel0;
   input              sel1;
   input              sel2;
   input              sel3;
   input              sel4;
   input              sel5;
   input              sel6;
   input              sel7;
   input              muxtst;
   output             out;

   `ifdef LIB
`ifdef MUXOHTEST
//0in one_hot -var {sel0,sel1,sel2,sel3,sel4,sel5,sel6,sel7}
`endif   
 wire [8:0] sel = {muxtst,sel7,sel6,sel5,sel4,sel3,sel2,sel1,sel0};

 assign out = (sel[7:0] == 8'b00000001)   ?    in0:
              (sel[7:0] == 8'b00000010)   ?    in1:
              (sel[7:0] == 8'b00000100)   ?    in2:
              (sel[7:0] == 8'b00001000)   ?    in3:
              (sel[7:0] == 8'b00010000)   ?    in4:
              (sel[7:0] == 8'b00100000)   ?    in5:
              (sel[7:0] == 8'b01000000)   ?    in6:
              (sel[7:0] == 8'b10000000)   ?    in7:
              (sel[8:0] == 9'b000000000)  ?   1'b1:
                                              1'bx;
`endif
endmodule


module cl_dp1_muxbuff2_16x (
in0,
in1,
out0,
out1
);
input	in0;
input	in1;
output	out0;
output	out1;

`ifdef LIB
//assign {out1,out0} = {in1,in0};
buf (out1, in1);
buf (out0, in0);

`endif

endmodule
module cl_dp1_muxbuff2_32x (
in0,
in1,
out0,
out1
);
input	in0;
input	in1;
output	out0;
output	out1;

`ifdef LIB
//assign {out1,out0} = {in1,in0};
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff2_48x (
in0,
in1,
out0,
out1
);
input	in0;
input	in1;
output	out0;
output	out1;

`ifdef LIB
//assign {out1,out0} = {in1,in0};
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff2_64x (
in0,
in1,
out0,
out1
);
input	in0;
input	in1;
output	out0;
output	out1;

`ifdef LIB
//assign {out1,out0} = {in1,in0};
buf (out1, in1);
buf (out0, in0);
`endif

endmodule

`ifdef FPGA
`else

module cl_dp1_muxbuff2_8x (
in0,
in1,
out0,
out1
);
input	in0;
input	in1;
output	out0;
output	out1;

`ifdef LIB
//assign {out1,out0} = {in1,in0};
buf (out1, in1);
buf (out0, in0);
`endif

endmodule

`endif // `ifdef FPGA
module cl_dp1_muxbuff3_16x (
in0,
in1,
in2,
out0,
out1,
out2
);
input	in0;
input	in1;
input	in2;
output	out0;
output	out1;
output	out2;

`ifdef LIB
//assign {out2,out1,out0} = {in2,in1,in0};
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff3_32x (
in0,
in1,
in2,
out0,
out1,
out2
);
input	in0;
input	in1;
input	in2;
output	out0;
output	out1;
output	out2;

`ifdef LIB
//assign {out2,out1,out0} = {in2,in1,in0};
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff3_48x (
in0,
in1,
in2,
out0,
out1,
out2
);
input	in0;
input	in1;
input	in2;
output	out0;
output	out1;
output	out2;

`ifdef LIB
//assign {out2,out1,out0} = {in2,in1,in0};
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff3_64x (
in0,
in1,
in2,
out0,
out1,
out2
);
input	in0;
input	in1;
input	in2;
output	out0;
output	out1;
output	out2;

`ifdef LIB
//assign {out2,out1,out0} = {in2,in1,in0};
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule

module cl_dp1_muxbuff3_8x (
in0,
in1,
in2,
out0,
out1,
out2
);
input	in0;
input	in1;
input	in2;
output	out0;
output	out1;
output	out2;

`ifdef LIB
//assign {out2,out1,out0} = {in2,in1,in0};
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff4_16x (
in0,
in1,
in2,
in3,
out0,
out1,
out2,
out3
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out0;
output	out1;
output	out2;
output	out3;

`ifdef LIB
//assign {out3,out2,out1,out0} = {in3,in2,in1,in0};
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff4_32x (
in0,
in1,
in2,
in3,
out0,
out1,
out2,
out3
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out0;
output	out1;
output	out2;
output	out3;

`ifdef LIB
//assign {out3,out2,out1,out0} = {in3,in2,in1,in0};
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff4_48x (
in0,
in1,
in2,
in3,
out0,
out1,
out2,
out3
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out0;
output	out1;
output	out2;
output	out3;

`ifdef LIB
//assign {out3,out2,out1,out0} = {in3,in2,in1,in0};
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff4_64x (
in0,
in1,
in2,
in3,
out0,
out1,
out2,
out3
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out0;
output	out1;
output	out2;
output	out3;

`ifdef LIB
//assign {out3,out2,out1,out0} = {in3,in2,in1,in0};
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule

module cl_dp1_muxbuff4_8x (
in0,
in1,
in2,
in3,
out0,
out1,
out2,
out3
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out0;
output	out1;
output	out2;
output	out3;

`ifdef LIB
//assign {out3,out2,out1,out0} = {in3,in2,in1,in0};
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff5_16x (
in0,
in1,
in2,
in3,
in4,
out0,
out1,
out2,
out3,
out4
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;

`ifdef LIB
//assign {out4,out3,out2,out1,out0} = {in4,in3,in2,in1,in0};
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff5_32x (
in0,
in1,
in2,
in3,
in4,
out0,
out1,
out2,
out3,
out4
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;

`ifdef LIB
//assign {out4,out3,out2,out1,out0} = {in4,in3,in2,in1,in0};
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff5_48x (
in0,
in1,
in2,
in3,
in4,
out0,
out1,
out2,
out3,
out4
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;

`ifdef LIB
//assign {out4,out3,out2,out1,out0} = {in4,in3,in2,in1,in0};
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff5_64x (
in0,
in1,
in2,
in3,
in4,
out0,
out1,
out2,
out3,
out4
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;

`ifdef LIB
//assign {out4,out3,out2,out1,out0} = {in4,in3,in2,in1,in0};
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule

module cl_dp1_muxbuff5_8x (
in0,
in1,
in2,
in3,
in4,
out0,
out1,
out2,
out3,
out4
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;

`ifdef LIB
//assign {out4,out3,out2,out1,out0} = {in4,in3,in2,in1,in0};
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff6_16x (
in0,
in1,
in2,
in3,
in4,
in5,
out0,
out1,
out2,
out3,
out4,
out5
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;

`ifdef LIB
//assign {out5,out4,out3,out2,out1,out0} = {in5,in4,in3,in2,in1,in0};
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff6_32x (
in0,
in1,
in2,
in3,
in4,
in5,
out0,
out1,
out2,
out3,
out4,
out5
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;

`ifdef LIB
//assign {out5,out4,out3,out2,out1,out0} = {in5,in4,in3,in2,in1,in0};
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff6_48x (
in0,
in1,
in2,
in3,
in4,
in5,
out0,
out1,
out2,
out3,
out4,
out5
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;

`ifdef LIB
//assign {out5,out4,out3,out2,out1,out0} = {in5,in4,in3,in2,in1,in0};
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff6_64x (
in0,
in1,
in2,
in3,
in4,
in5,
out0,
out1,
out2,
out3,
out4,
out5
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;

`ifdef LIB
//assign {out5,out4,out3,out2,out1,out0} = {in5,in4,in3,in2,in1,in0};
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule

module cl_dp1_muxbuff6_8x (
in0,
in1,
in2,
in3,
in4,
in5,
out0,
out1,
out2,
out3,
out4,
out5
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;

`ifdef LIB
//assign {out5,out4,out3,out2,out1,out0} = {in5,in4,in3,in2,in1,in0};
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff7_16x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
out0,
out1,
out2,
out3,
out4,
out5,
out6
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;

`ifdef LIB
//assign {out6,out5,out4,out3,out2,out1,out0} = {in6,in5,in4,in3,in2,in1,in0};
buf (out6, in6);
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff7_32x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
out0,
out1,
out2,
out3,
out4,
out5,
out6
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;

`ifdef LIB
//assign {out6,out5,out4,out3,out2,out1,out0} = {in6,in5,in4,in3,in2,in1,in0};
buf (out6, in6);
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff7_48x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
out0,
out1,
out2,
out3,
out4,
out5,
out6
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;

`ifdef LIB
//assign {out6,out5,out4,out3,out2,out1,out0} = {in6,in5,in4,in3,in2,in1,in0};
buf (out6, in6);
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff7_64x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
out0,
out1,
out2,
out3,
out4,
out5,
out6
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;

`ifdef LIB
//assign {out6,out5,out4,out3,out2,out1,out0} = {in6,in5,in4,in3,in2,in1,in0};
buf (out6, in6);
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule

module cl_dp1_muxbuff7_8x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
out0,
out1,
out2,
out3,
out4,
out5,
out6
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;

`ifdef LIB
//assign {out6,out5,out4,out3,out2,out1,out0} = {in6,in5,in4,in3,in2,in1,in0};
buf (out6, in6);
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff8_16x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
out0,
out1,
out2,
out3,
out4,
out5,
out6,
out7
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
input	in7;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;
output	out7;

`ifdef LIB
//assign {out7,out6,out5,out4,out3,out2,out1,out0} = {in7,in6,in5,in4,in3,in2,in1,in0};
buf (out7, in7);
buf (out6, in6);
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff8_32x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
out0,
out1,
out2,
out3,
out4,
out5,
out6,
out7
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
input	in7;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;
output	out7;

`ifdef LIB
//assign {out7,out6,out5,out4,out3,out2,out1,out0} = {in7,in6,in5,in4,in3,in2,in1,in0};
buf (out7, in7);
buf (out6, in6);
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff8_48x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
out0,
out1,
out2,
out3,
out4,
out5,
out6,
out7
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
input	in7;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;
output	out7;

`ifdef LIB
//assign {out7,out6,out5,out4,out3,out2,out1,out0} = {in7,in6,in5,in4,in3,in2,in1,in0};
buf (out7, in7);
buf (out6, in6);
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxbuff8_64x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
out0,
out1,
out2,
out3,
out4,
out5,
out6,
out7
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
input	in7;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;
output	out7;

`ifdef LIB
//assign {out7,out6,out5,out4,out3,out2,out1,out0} = {in7,in6,in5,in4,in3,in2,in1,in0};
buf (out7, in7);
buf (out6, in6);
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule

module cl_dp1_muxbuff8_8x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
out0,
out1,
out2,
out3,
out4,
out5,
out6,
out7
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
input	in7;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;
output	out7;

`ifdef LIB
//assign {out7,out6,out5,out4,out3,out2,out1,out0} = {in7,in6,in5,in4,in3,in2,in1,in0};
buf (out7, in7);
buf (out6, in6);
buf (out5, in5);
buf (out4, in4);
buf (out3, in3);
buf (out2, in2);
buf (out1, in1);
buf (out0, in0);
`endif

endmodule
module cl_dp1_muxinv2_16x (
in0,
in1,
out0,
out1
);
input	in0;
input	in1;
output	out0;
output	out1;

`ifdef LIB
//assign {out1,out0} = ~{in1,in0};
not (out0, in0);
not (out1, in1);
`endif

endmodule
module cl_dp1_muxinv2_32x (
in0,
in1,
out0,
out1
);
input	in0;
input	in1;
output	out0;
output	out1;

`ifdef LIB
//assign {out1,out0} = ~{in1,in0};
not (out0, in0);
not (out1, in1);
`endif

endmodule
module cl_dp1_muxinv2_48x (
in0,
in1,
out0,
out1
);
input	in0;
input	in1;
output	out0;
output	out1;

`ifdef LIB
//assign {out1,out0} = ~{in1,in0};
not (out0, in0);
not (out1, in1);
`endif

endmodule
module cl_dp1_muxinv2_64x (
in0,
in1,
out0,
out1
);
input	in0;
input	in1;
output	out0;
output	out1;

`ifdef LIB
//assign {out1,out0} = ~{in1,in0};
not (out0, in0);
not (out1, in1);
`endif

endmodule

module cl_dp1_muxinv2_8x (
in0,
in1,
out0,
out1
);
input	in0;
input	in1;
output	out0;
output	out1;

`ifdef LIB
//assign {out1,out0} = ~{in1,in0};
not (out0, in0);
not (out1, in1);
`endif

endmodule
module cl_dp1_muxinv3_16x (
in0,
in1,
in2,
out0,
out1,
out2
);
input	in0;
input	in1;
input	in2;
output	out0;
output	out1;
output	out2;

`ifdef LIB
//assign {out2,out1,out0} = ~{in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
`endif

endmodule
module cl_dp1_muxinv3_32x (
in0,
in1,
in2,
out0,
out1,
out2
);
input	in0;
input	in1;
input	in2;
output	out0;
output	out1;
output	out2;

`ifdef LIB
//assign {out2,out1,out0} = ~{in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
`endif

endmodule
module cl_dp1_muxinv3_48x (
in0,
in1,
in2,
out0,
out1,
out2
);
input	in0;
input	in1;
input	in2;
output	out0;
output	out1;
output	out2;

`ifdef LIB
//assign {out2,out1,out0} = ~{in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
`endif

endmodule
module cl_dp1_muxinv3_64x (
in0,
in1,
in2,
out0,
out1,
out2
);
input	in0;
input	in1;
input	in2;
output	out0;
output	out1;
output	out2;

`ifdef LIB
//assign {out2,out1,out0} = ~{in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
`endif

endmodule

module cl_dp1_muxinv3_8x (
in0,
in1,
in2,
out0,
out1,
out2
);
input	in0;
input	in1;
input	in2;
output	out0;
output	out1;
output	out2;

`ifdef LIB
//assign {out2,out1,out0} = ~{in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
`endif

endmodule
module cl_dp1_muxinv4_16x (
in0,
in1,
in2,
in3,
out0,
out1,
out2,
out3
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out0;
output	out1;
output	out2;
output	out3;

`ifdef LIB
//assign {out3,out2,out1,out0} = ~{in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
`endif

endmodule
module cl_dp1_muxinv4_32x (
in0,
in1,
in2,
in3,
out0,
out1,
out2,
out3
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out0;
output	out1;
output	out2;
output	out3;

`ifdef LIB
//assign {out3,out2,out1,out0} = ~{in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
`endif

endmodule
module cl_dp1_muxinv4_48x (
in0,
in1,
in2,
in3,
out0,
out1,
out2,
out3
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out0;
output	out1;
output	out2;
output	out3;

`ifdef LIB
//assign {out3,out2,out1,out0} = ~{in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
`endif

endmodule
module cl_dp1_muxinv4_64x (
in0,
in1,
in2,
in3,
out0,
out1,
out2,
out3
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out0;
output	out1;
output	out2;
output	out3;

`ifdef LIB
//assign {out3,out2,out1,out0} = ~{in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
`endif

endmodule

module cl_dp1_muxinv4_8x (
in0,
in1,
in2,
in3,
out0,
out1,
out2,
out3
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out0;
output	out1;
output	out2;
output	out3;

`ifdef LIB
//assign {out3,out2,out1,out0} = ~{in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
`endif

endmodule
module cl_dp1_muxinv5_16x (
in0,
in1,
in2,
in3,
in4,
out0,
out1,
out2,
out3,
out4
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;

`ifdef LIB
//assign {out4,out3,out2,out1,out0} = ~{in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
`endif

endmodule
module cl_dp1_muxinv5_32x (
in0,
in1,
in2,
in3,
in4,
out0,
out1,
out2,
out3,
out4
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;

`ifdef LIB
//assign {out4,out3,out2,out1,out0} = ~{in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
`endif

endmodule
module cl_dp1_muxinv5_48x (
in0,
in1,
in2,
in3,
in4,
out0,
out1,
out2,
out3,
out4
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;

`ifdef LIB
//assign {out4,out3,out2,out1,out0} = ~{in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
`endif

endmodule
module cl_dp1_muxinv5_64x (
in0,
in1,
in2,
in3,
in4,
out0,
out1,
out2,
out3,
out4
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;

`ifdef LIB
//assign {out4,out3,out2,out1,out0} = ~{in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
`endif

endmodule

module cl_dp1_muxinv5_8x (
in0,
in1,
in2,
in3,
in4,
out0,
out1,
out2,
out3,
out4
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;

`ifdef LIB
//assign {out4,out3,out2,out1,out0} = ~{in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
`endif

endmodule
module cl_dp1_muxinv6_16x (
in0,
in1,
in2,
in3,
in4,
in5,
out0,
out1,
out2,
out3,
out4,
out5
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;

`ifdef LIB
//assign {out5,out4,out3,out2,out1,out0} = ~{in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
`endif

endmodule
module cl_dp1_muxinv6_32x (
in0,
in1,
in2,
in3,
in4,
in5,
out0,
out1,
out2,
out3,
out4,
out5
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;

`ifdef LIB
//assign {out5,out4,out3,out2,out1,out0} = ~{in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
`endif

endmodule
module cl_dp1_muxinv6_48x (
in0,
in1,
in2,
in3,
in4,
in5,
out0,
out1,
out2,
out3,
out4,
out5
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;

`ifdef LIB
//assign {out5,out4,out3,out2,out1,out0} = ~{in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
`endif

endmodule
module cl_dp1_muxinv6_64x (
in0,
in1,
in2,
in3,
in4,
in5,
out0,
out1,
out2,
out3,
out4,
out5
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;

`ifdef LIB
//assign {out5,out4,out3,out2,out1,out0} = ~{in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
`endif

endmodule

module cl_dp1_muxinv6_8x (
in0,
in1,
in2,
in3,
in4,
in5,
out0,
out1,
out2,
out3,
out4,
out5
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;

`ifdef LIB
//assign {out5,out4,out3,out2,out1,out0} = ~{in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
`endif

endmodule
module cl_dp1_muxinv7_16x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
out0,
out1,
out2,
out3,
out4,
out5,
out6
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;

`ifdef LIB
//assign {out6,out5,out4,out3,out2,out1,out0} = ~{in6,in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
not (out6, in6);
`endif

endmodule
module cl_dp1_muxinv7_32x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
out0,
out1,
out2,
out3,
out4,
out5,
out6
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;

`ifdef LIB
//assign {out6,out5,out4,out3,out2,out1,out0} = ~{in6,in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
not (out6, in6);
`endif

endmodule
module cl_dp1_muxinv7_48x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
out0,
out1,
out2,
out3,
out4,
out5,
out6
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;

`ifdef LIB
//assign {out6,out5,out4,out3,out2,out1,out0} = ~{in6,in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
not (out6, in6);
`endif

endmodule
module cl_dp1_muxinv7_64x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
out0,
out1,
out2,
out3,
out4,
out5,
out6
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;

`ifdef LIB
//assign {out6,out5,out4,out3,out2,out1,out0} = ~{in6,in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
not (out6, in6);
`endif

endmodule

module cl_dp1_muxinv7_8x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
out0,
out1,
out2,
out3,
out4,
out5,
out6
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;

`ifdef LIB
//assign {out6,out5,out4,out3,out2,out1,out0} = ~{in6,in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
not (out6, in6);
`endif

endmodule
module cl_dp1_muxinv8_16x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
out0,
out1,
out2,
out3,
out4,
out5,
out6,
out7
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
input	in7;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;
output	out7;

`ifdef LIB
//assign {out7,out6,out5,out4,out3,out2,out1,out0} = ~{in7,in6,in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
not (out6, in6);
not (out7, in7);
`endif

endmodule
module cl_dp1_muxinv8_32x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
out0,
out1,
out2,
out3,
out4,
out5,
out6,
out7
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
input	in7;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;
output	out7;

`ifdef LIB
//assign {out7,out6,out5,out4,out3,out2,out1,out0} = ~{in7,in6,in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
not (out6, in6);
not (out7, in7);
`endif

endmodule
module cl_dp1_muxinv8_48x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
out0,
out1,
out2,
out3,
out4,
out5,
out6,
out7
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
input	in7;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;
output	out7;

`ifdef LIB
//assign {out7,out6,out5,out4,out3,out2,out1,out0} = ~{in7,in6,in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
not (out6, in6);
not (out7, in7);
`endif

endmodule
module cl_dp1_muxinv8_64x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
out0,
out1,
out2,
out3,
out4,
out5,
out6,
out7
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
input	in7;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;
output	out7;

`ifdef LIB
//assign {out7,out6,out5,out4,out3,out2,out1,out0} = ~{in7,in6,in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
not (out6, in6);
not (out7, in7);
`endif

endmodule

module cl_dp1_muxinv8_8x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
out0,
out1,
out2,
out3,
out4,
out5,
out6,
out7
);
input	in0;
input	in1;
input	in2;
input	in3;
input	in4;
input	in5;
input	in6;
input	in7;
output	out0;
output	out1;
output	out2;
output	out3;
output	out4;
output	out5;
output	out6;
output	out7;

`ifdef LIB
//assign {out7,out6,out5,out4,out3,out2,out1,out0} = ~{in7,in6,in5,in4,in3,in2,in1,in0};
not (out0, in0);
not (out1, in1);
not (out2, in2);
not (out3, in3);
not (out4, in4);
not (out5, in5);
not (out6, in6);
not (out7, in7);
`endif

endmodule
module cl_dp1_pdec4_16x (
sel0,
sel1,
test,
psel0,
psel1,
psel2,
psel3
);
input	sel0;
input	sel1;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;

`ifdef LIB
  assign psel0 = ~sel1 & ~sel0;
  assign psel1 = ~sel1 &  sel0;
  assign psel2 =  sel1 & ~sel0;
  assign psel3 =  sel1 &  sel0 & test;
`endif
endmodule
module cl_dp1_pdec4_32x (
sel0,
sel1,
test,
psel0,
psel1,
psel2,
psel3
);
input	sel0;
input	sel1;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;

`ifdef LIB
  assign psel0 = ~sel1 & ~sel0;
  assign psel1 = ~sel1 &  sel0;
  assign psel2 =  sel1 & ~sel0;
  assign psel3 =  sel1 &  sel0 & test;
`endif
endmodule
module cl_dp1_pdec4_48x (
sel0,
sel1,
test,
psel0,
psel1,
psel2,
psel3
);
input	sel0;
input	sel1;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;

`ifdef LIB
  assign psel0 = ~sel1 & ~sel0;
  assign psel1 = ~sel1 &  sel0;
  assign psel2 =  sel1 & ~sel0;
  assign psel3 =  sel1 &  sel0 & test;
`endif
endmodule
module cl_dp1_pdec4_64x (
sel0,
sel1,
test,
psel0,
psel1,
psel2,
psel3
);
input	sel0;
input	sel1;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;

`ifdef LIB
  assign psel0 = ~sel1 & ~sel0;
  assign psel1 = ~sel1 &  sel0;
  assign psel2 =  sel1 & ~sel0;
  assign psel3 =  sel1 &  sel0 & test;
`endif
endmodule

`ifdef FPGA
`else

module cl_dp1_pdec4_8x (
sel0,
sel1,
test,
psel0,
psel1,
psel2,
psel3
);
input	sel0;
input	sel1;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;

`ifdef LIB
  assign psel0 = ~sel1 & ~sel0;
  assign psel1 = ~sel1 &  sel0;
  assign psel2 =  sel1 & ~sel0;
  assign psel3 =  sel1 &  sel0 & test;
`endif
endmodule

`endif // `ifdef FPGA


module cl_dp1_pdec8_16x (
sel0,
sel1,
sel2,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6,
psel7
);
input	sel0;
input	sel1;
input	sel2;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;
output	psel7;

`ifdef LIB
assign psel0 = ~sel2 & ~sel1 & ~sel0 & test;
assign psel1 = ~sel2 & ~sel1 &  sel0;
assign psel2 = ~sel2 &  sel1 & ~sel0;
assign psel3 = ~sel2 &  sel1 &  sel0;
assign psel4 =  sel2 & ~sel1 & ~sel0;
assign psel5 =  sel2 & ~sel1 &  sel0;
assign psel6 =  sel2 &  sel1 & ~sel0;
assign psel7 =  sel2 &  sel1 &  sel0;
`endif

endmodule
module cl_dp1_pdec8_32x (
sel0,
sel1,
sel2,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6,
psel7
);
input	sel0;
input	sel1;
input	sel2;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;
output	psel7;

`ifdef LIB
assign psel0 = ~sel2 & ~sel1 & ~sel0 & test;
assign psel1 = ~sel2 & ~sel1 &  sel0;
assign psel2 = ~sel2 &  sel1 & ~sel0;
assign psel3 = ~sel2 &  sel1 &  sel0;
assign psel4 =  sel2 & ~sel1 & ~sel0;
assign psel5 =  sel2 & ~sel1 &  sel0;
assign psel6 =  sel2 &  sel1 & ~sel0;
assign psel7 =  sel2 &  sel1 &  sel0;
`endif

endmodule
module cl_dp1_pdec8_48x (
sel0,
sel1,
sel2,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6,
psel7
);
input	sel0;
input	sel1;
input	sel2;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;
output	psel7;

`ifdef LIB
assign psel0 = ~sel2 & ~sel1 & ~sel0 & test;
assign psel1 = ~sel2 & ~sel1 &  sel0;
assign psel2 = ~sel2 &  sel1 & ~sel0;
assign psel3 = ~sel2 &  sel1 &  sel0;
assign psel4 =  sel2 & ~sel1 & ~sel0;
assign psel5 =  sel2 & ~sel1 &  sel0;
assign psel6 =  sel2 &  sel1 & ~sel0;
assign psel7 =  sel2 &  sel1 &  sel0;
`endif

endmodule
module cl_dp1_pdec8_64x (
sel0,
sel1,
sel2,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6,
psel7
);
input	sel0;
input	sel1;
input	sel2;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;
output	psel7;

`ifdef LIB
assign psel0 = ~sel2 & ~sel1 & ~sel0 & test;
assign psel1 = ~sel2 & ~sel1 &  sel0;
assign psel2 = ~sel2 &  sel1 & ~sel0;
assign psel3 = ~sel2 &  sel1 &  sel0;
assign psel4 =  sel2 & ~sel1 & ~sel0;
assign psel5 =  sel2 & ~sel1 &  sel0;
assign psel6 =  sel2 &  sel1 & ~sel0;
assign psel7 =  sel2 &  sel1 &  sel0;
`endif

endmodule

`ifdef FPGA
`else

module cl_dp1_pdec8_8x (
sel0,
sel1,
sel2,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6,
psel7
);
input	sel0;
input	sel1;
input	sel2;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;
output	psel7;

`ifdef LIB
assign psel0 = ~sel2 & ~sel1 & ~sel0 & test;
assign psel1 = ~sel2 & ~sel1 &  sel0;
assign psel2 = ~sel2 &  sel1 & ~sel0;
assign psel3 = ~sel2 &  sel1 &  sel0;
assign psel4 =  sel2 & ~sel1 & ~sel0;
assign psel5 =  sel2 & ~sel1 &  sel0;
assign psel6 =  sel2 &  sel1 & ~sel0;
assign psel7 =  sel2 &  sel1 &  sel0;
`endif

endmodule

`endif // `ifdef FPGA

module cl_dp1_penc2_16x (
sel0,
psel0,
psel1
);
input	sel0;
output	psel0;
output	psel1;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0;
`endif

endmodule
module cl_dp1_penc2_32x (
sel0,
psel0,
psel1
);
input	sel0;
output	psel0;
output	psel1;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0;
`endif

endmodule
module cl_dp1_penc2_48x (
sel0,
psel0,
psel1
);
input	sel0;
output	psel0;
output	psel1;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0;
`endif

endmodule
module cl_dp1_penc2_64x (
sel0,
psel0,
psel1
);
input	sel0;
output	psel0;
output	psel1;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0;
`endif

endmodule

`ifdef FPGA
`else
module cl_dp1_penc2_8x (
sel0,
psel0,
psel1
);
input	sel0;
output	psel0;
output	psel1;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0;
`endif

endmodule

`endif // ifdef FPGA


module cl_dp1_penc3_16x (
sel0,
sel1,
test,
psel0,
psel1,
psel2
);
input	sel0;
input	sel1;
input   test;
output	psel0;
output	psel1;
output	psel2;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & test;
`endif

endmodule
module cl_dp1_penc3_32x (
sel0,
sel1,
test,
psel0,
psel1,
psel2
);
input	sel0;
input	sel1;
input   test;
output	psel0;
output	psel1;
output	psel2;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & test;
`endif

endmodule
module cl_dp1_penc3_48x (
sel0,
sel1,
test,
psel0,
psel1,
psel2
);
input	sel0;
input	sel1;
input   test;
output	psel0;
output	psel1;
output	psel2;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & test;
`endif

endmodule
module cl_dp1_penc3_64x (
sel0,
sel1,
test,
psel0,
psel1,
psel2
);
input	sel0;
input	sel1;
input   test;
output	psel0;
output	psel1;
output	psel2;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & test;
`endif

endmodule
module cl_dp1_penc3_8x (
sel0,
sel1,
test,
psel0,
psel1,
psel2
);
input	sel0;
input	sel1;
input   test;
output	psel0;
output	psel1;
output	psel2;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & test;
`endif

endmodule
module cl_dp1_penc4_16x (
sel0,
sel1,
sel2,
test,
psel0,
psel1,
psel2,
psel3
);
input	sel0;
input	sel1;
input	sel2;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2;
`endif

endmodule
module cl_dp1_penc4_32x (
sel0,
sel1,
sel2,
test,
psel0,
psel1,
psel2,
psel3
);
input	sel0;
input	sel1;
input	sel2;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2;
`endif

endmodule
module cl_dp1_penc4_48x (
sel0,
sel1,
sel2,
test,
psel0,
psel1,
psel2,
psel3
);
input	sel0;
input	sel1;
input	sel2;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2;
`endif

endmodule
module cl_dp1_penc4_64x (
sel0,
sel1,
sel2,
test,
psel0,
psel1,
psel2,
psel3
);
input	sel0;
input	sel1;
input	sel2;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2;
`endif

endmodule
module cl_dp1_penc4_8x (
sel0,
sel1,
sel2,
test,
psel0,
psel1,
psel2,
psel3
);
input	sel0;
input	sel1;
input	sel2;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2;
`endif

endmodule
module cl_dp1_penc5_16x (
sel0,
sel1,
sel2,
sel3,
test,
psel0,
psel1,
psel2,
psel3,
psel4
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;

`ifdef LIB
assign psel0 = sel0 & test;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3;
`endif

endmodule
module cl_dp1_penc5_32x (
sel0,
sel1,
sel2,
sel3,
test,
psel0,
psel1,
psel2,
psel3,
psel4
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;

`ifdef LIB
assign psel0 = sel0 & test;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3;
`endif

endmodule
module cl_dp1_penc5_48x (
sel0,
sel1,
sel2,
sel3,
test,
psel0,
psel1,
psel2,
psel3,
psel4
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;

`ifdef LIB
assign psel0 = sel0 & test;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3;
`endif

endmodule
module cl_dp1_penc5_64x (
sel0,
sel1,
sel2,
sel3,
test,
psel0,
psel1,
psel2,
psel3,
psel4
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;

`ifdef LIB
assign psel0 = sel0 & test;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3;
`endif

endmodule
module cl_dp1_penc5_8x (
sel0,
sel1,
sel2,
sel3,
test,
psel0,
psel1,
psel2,
psel3,
psel4
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;

`ifdef LIB
assign psel0 = sel0 & test;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3;
`endif

endmodule
module cl_dp1_penc6_16x (
sel0,
sel1,
sel2,
sel3,
sel4,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & sel2 & test;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4;
`endif

endmodule
module cl_dp1_penc6_32x (
sel0,
sel1,
sel2,
sel3,
sel4,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & sel2 & test;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4;
`endif

endmodule
module cl_dp1_penc6_48x (
sel0,
sel1,
sel2,
sel3,
sel4,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & sel2 & test;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4;
`endif

endmodule
module cl_dp1_penc6_64x (
sel0,
sel1,
sel2,
sel3,
sel4,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & sel2 & test;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4;
`endif

endmodule
module cl_dp1_penc6_8x (
sel0,
sel1,
sel2,
sel3,
sel4,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1;
assign psel2 = ~sel0 & ~sel1 & sel2 & test;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4;
`endif

endmodule
module cl_dp1_penc7_16x (
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input	sel5;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & sel5;
assign psel6 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5;
`endif

endmodule
module cl_dp1_penc7_32x (
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input	sel5;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & sel5;
assign psel6 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5;
`endif

endmodule
module cl_dp1_penc7_48x (
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input	sel5;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & sel5;
assign psel6 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5;
`endif

endmodule
module cl_dp1_penc7_64x (
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input	sel5;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & sel5;
assign psel6 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5;
`endif

endmodule
module cl_dp1_penc7_8x (
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input	sel5;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & sel5;
assign psel6 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5;
`endif

endmodule
module cl_dp1_penc8_16x (
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6,
psel7
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input	sel5;
input	sel6;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;
output	psel7;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & sel5;
assign psel6 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5 & sel6;
assign psel7 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5 & ~sel6;
`endif

endmodule
module cl_dp1_penc8_32x (
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6,
psel7
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input	sel5;
input	sel6;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;
output	psel7;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & sel5;
assign psel6 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5 & sel6;
assign psel7 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5 & ~sel6;
`endif

endmodule
module cl_dp1_penc8_48x (
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6,
psel7
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input	sel5;
input	sel6;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;
output	psel7;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & sel5;
assign psel6 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5 & sel6;
assign psel7 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5 & ~sel6;
`endif

endmodule
module cl_dp1_penc8_64x (
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6,
psel7
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input	sel5;
input	sel6;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;
output	psel7;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & sel5;
assign psel6 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5 & sel6;
assign psel7 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5 & ~sel6;
`endif

endmodule
module cl_dp1_penc8_8x (
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
test,
psel0,
psel1,
psel2,
psel3,
psel4,
psel5,
psel6,
psel7
);
input	sel0;
input	sel1;
input	sel2;
input	sel3;
input	sel4;
input	sel5;
input	sel6;
input   test;
output	psel0;
output	psel1;
output	psel2;
output	psel3;
output	psel4;
output	psel5;
output	psel6;
output	psel7;

`ifdef LIB
assign psel0 = sel0;
assign psel1 = ~sel0 & sel1 & test;
assign psel2 = ~sel0 & ~sel1 & sel2;
assign psel3 = ~sel0 & ~sel1 & ~sel2 & sel3;
assign psel4 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & sel4;
assign psel5 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & sel5;
assign psel6 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5 & sel6;
assign psel7 = ~sel0 & ~sel1 & ~sel2 & ~sel3 & ~sel4 & ~sel5 & ~sel6;
`endif

endmodule
module cl_dp1_prty16_8x (
in,
out
);
input	[15:0] in;
output	out;


`ifdef LIB
assign out = ^in[15:0];
`endif

endmodule
module cl_dp1_prty32_8x (
in,
out
);
input	[31:0] in;
output	out;

`ifdef LIB
assign out = ^in[31:0];
`endif

endmodule
module cl_dp1_prty4_8x (
in,
out
);
input	[3:0] in;
output	out;

`ifdef LIB
assign out = ^in[3:0];
`endif

endmodule
module cl_dp1_prty8_8x (
in,
out
);
input	[7:0] in;
output	out;

`ifdef LIB
assign out = ^in[7:0];
`endif

endmodule

module cl_dp1_zero12_12x (
in,
out
);

input [11:0] in;
output out;

`ifdef LIB

assign out = ( in[11:0] == 12'b0);

`endif


endmodule
module cl_dp1_zero16_12x (
in,
out
);

input [15:0] in;
output out;

`ifdef LIB

assign out = ( in[15:0] == 16'b0);

`endif


endmodule

module cl_dp1_zero32_12x (
in,
out
);

input [31:0] in;
output out;

`ifdef LIB

assign out = ( in[31:0] == 32'b0);

`endif


endmodule

module cl_dp1_zero4_12x (
in,
out
);

input [3:0] in;
output out;

`ifdef LIB

assign out = ( in[3:0] == 4'b0);

`endif


endmodule
module cl_dp1_zero64_12x (
in,
out
);

input [63:0] in;
output out;

`ifdef LIB

assign out = ( in[63:0] == 64'b0);

`endif


endmodule

module cl_dp1_zero8_12x (
in,
out
);

input [7:0] in;
output out;

`ifdef LIB

assign out = ( in[7:0] == 8'b0);

`endif


endmodule


module cl_dp1_zdt64_8x(
din0,
din1,
cin,
zdt_z64_,
zdt_z32_
);

  input  [63:0]  din0;
  input  [63:0]  din1;
  input          cin;

  output         zdt_z64_;
  output         zdt_z32_;
  
  wire [63:0] p;
  wire [62:0] k;
  wire [63:0] z;
  wire zero_detect32;
  wire zero_detect64;

`ifdef LIB



assign p[63:0]       =  din0[63:0] ^  din1[63:0];
assign k[62:0]       = ~din0[62:0] & ~din1[62:0];

assign z[63:1]       =  p[63:1] ^  k[62:0];
assign z[0]          =  p[0]    ^ ~cin;

assign zero_detect32 = & z[31:0];
assign zero_detect64 = & z[63:0];

assign zdt_z32_      = ~zero_detect32;
assign zdt_z64_      = ~zero_detect64;

`endif


endmodule
module cl_dp1_ccxhdr (
l2clk,
pce0,
pce1,
pce_ov,
stop,
siclk_in,
soclk_in,
siclk_out,
soclk_out,
l1clk0,
l1clk1,
se,
si,
so,    
l1clk,                     
grant_a,
grant_x,
qsel0,
qsel0_buf,
shift,
shift_buf                         
);

input l2clk;
input pce0;
input pce1;
input pce_ov;
input stop;
input siclk_in;
input soclk_in;

output siclk_out;
output soclk_out;
output  l1clk0;
output  l1clk1;

input   l1clk;
input	se;
input   si;
input   grant_a;
input   qsel0;
input   shift;
output  so;

output  grant_x;
output  qsel0_buf;
output  shift_buf;

wire    siclk_out_unused;
wire    soclk_out_unused;

cl_dp1_ccx_l1hdr_16x hdr0 (
.l2clk(l2clk),
.se(se),
.pce(pce0),
.aclk(siclk_in),
.bclk(soclk_in),
.siclk_out(siclk_out),
.soclk_out(soclk_out),
.l1clk(l1clk0),
.pce_ov(pce_ov),
.stop(stop)
);

cl_dp1_ccx_l1hdr_16x hdr1 (
.l2clk(l2clk),
.se(se),
.pce(pce1),
.aclk(siclk_in),
.bclk(soclk_in),
.siclk_out(siclk_out_unused),
.soclk_out(soclk_out_unused),
.l1clk(l1clk1),
.pce_ov(pce_ov),
.stop(stop)
);

cl_dp1_ccx_msff_16x msff1 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(grant_a),
.si(si),
.so(so),
.q(grant_x)
);

assign qsel0_buf = qsel0;
assign shift_buf = shift;

                
endmodule // cl_dp1_ccxhdr

module cl_dp1_ccx_mac_a (
l1clk0,
l1clk1,
siclk,
soclk,
grant_x,
data_a,
data_x_l,
qsel0_buf,
shift_buf,                         
si,                         
so
);

input l1clk0;
input l1clk1;
input siclk;
input soclk;
input grant_x;
input data_a;

input qsel0_buf;
input shift_buf;

output data_x_l;

input  si;
output so;

wire   so1;
wire   q1;
wire   q0;
wire   q0_in;

cl_dp1_ccx_msff_4x msff1 (
.l1clk(l1clk1),
.siclk(siclk),
.soclk(soclk),
.d(data_a),
.si(si),
.so(so1),
.q(q1)
);

cl_dp1_ccx_aomux2_4x mux1(
.in0(data_a),
.in1(q1),
.sel0(qsel0_buf),
.sel1(shift_buf),
.out(q0_in)
);

cl_dp1_ccx_msff_4x msff0 (
.l1clk(l1clk0),
.siclk(siclk),
.soclk(soclk),
.d(q0_in),
.si(so1),
.so(so),
.q(q0)
);

cl_dp1_ccx_nand2_4x nand0(
.in0(q0),
.in1(grant_x),
.out(data_x_l)
);

endmodule // cl_dp1_ccx_mac_a

module cl_dp1_ccx_mac_b (
l1clk0,
l1clk1,
siclk,
soclk,
grant_x,
data_a,
data_prev_x_l,                         
data_x_l,
qsel0_buf,
shift_buf,                         
si,                         
so
);

input l1clk0;
input l1clk1;
input siclk;
input soclk;
input grant_x;
input data_a;
input data_prev_x_l;

input qsel0_buf;
input shift_buf;

output data_x_l;

input  si;
output so;

wire   so1;
wire   q1;
wire   q0;
wire   q0_in;
wire   x4;
wire   x5;


cl_dp1_ccx_msff_4x msff1 (
.l1clk(l1clk1),
.siclk(siclk),
.soclk(soclk),
.d(data_a),
.si(si),
.so(so1),
.q(q1)
);

cl_dp1_ccx_aomux2_4x mux1(
.in0(data_a),
.in1(q1),
.sel0(qsel0_buf),
.sel1(shift_buf),
.out(q0_in)
);

cl_dp1_ccx_msff_4x msff0 (
.l1clk(l1clk0),
.siclk(siclk),
.soclk(soclk),
.d(q0_in),
.si(so1),
.so(so),
.q(q0)
);

cl_dp1_ccx_nand2_4x nand0(
.in0(q0),
.in1(grant_x),
.out(x4)
);

cl_dp1_ccx_nand2_12x nand1(
.in0(x4),
.in1(data_prev_x_l),
.out(x5)
);

cl_dp1_ccx_inv_32x inv0(
.in(x5),
.out(data_x_l)
);

endmodule // cl_dp1_ccx_mac_b

module cl_dp1_ccx_mac_c (
l1clk0,
l1clk1,
siclk,
soclk,
grant_x,
data_a,
data_crit_x_l,                         
data_ncrit_x_l,                         
data_x_l,
qsel0_buf,
shift_buf,                         
si,                         
so
);

input l1clk0;
input l1clk1;
input siclk;
input soclk;
input grant_x;
input data_a;
input data_crit_x_l;
input data_ncrit_x_l;

input qsel0_buf;
input shift_buf;

output data_x_l;

input  si;
output so;

wire   so1;
wire   q1;
wire   q0;
wire   q0_in;
wire   x4;
wire   x5;


cl_dp1_ccx_msff_4x msff1 (
.l1clk(l1clk1),
.siclk(siclk),
.soclk(soclk),
.d(data_a),
.si(si),
.so(so1),
.q(q1)
);

cl_dp1_ccx_aomux2_4x mux1(
.in0(data_a),
.in1(q1),
.sel0(qsel0_buf),
.sel1(shift_buf),
.out(q0_in)
);

cl_dp1_ccx_msff_4x msff0 (
.l1clk(l1clk0),
.siclk(siclk),
.soclk(soclk),
.d(q0_in),
.si(so1),
.so(so),
.q(q0)
);

cl_dp1_ccx_nand2_4x nand0(
.in0(q0),
.in1(grant_x),
.out(x4)
);

cl_dp1_ccx_nand3_12x nand1(
.in0(x4),
.in1(data_ncrit_x_l),
.in2(data_crit_x_l),
.out(x5)
);

cl_dp1_ccx_inva_32x inv0(
.in(x5),
.out(data_x_l)
);

endmodule // cl_dp1_ccx_mac_c

module cl_dp1_ccx_mac_b2 (
l1clk0,
l1clk1,
siclk,
soclk,
grant_x,
data_a,
data_prev_x_l,                         
data_x_l,
qsel0_buf,
shift_buf,                         
si,                         
so
);

input l1clk0;
input l1clk1;
input siclk;
input soclk;
input grant_x;
input data_a;
input data_prev_x_l;

input qsel0_buf;
input shift_buf;

output data_x_l;

input  si;
output so;

wire   so1;
wire   q1;
wire   q0;
wire   q0_in;
wire   x4;
wire   x5;


cl_dp1_ccx_msff_4x msff1 (
.l1clk(l1clk1),
.siclk(siclk),
.soclk(soclk),
.d(data_a),
.si(si),
.so(so1),
.q(q1)
);

cl_dp1_ccx_aomux2_4x mux1(
.in0(data_a),
.in1(q1),
.sel0(qsel0_buf),
.sel1(shift_buf),
.out(q0_in)
);

cl_dp1_ccx_msff_4x msff0 (
.l1clk(l1clk0),
.siclk(siclk),
.soclk(soclk),
.d(q0_in),
.si(so1),
.so(so),
.q(q0)
);

cl_dp1_ccx_nand2_4x nand0(
.in0(q0),
.in1(grant_x),
.out(x4)
);

cl_dp1_ccx_nand2_12x nand1(
.in0(x4),
.in1(data_prev_x_l),
.out(x5)
);

cl_dp1_ccx_inva_32x inv0(
.in(x5),
.out(data_x_l)
);

endmodule // cl_dp1_ccx_mac_b2

module cl_dp1_ccx_mac_c2 (
l1clk0,
l1clk1,
siclk,
soclk,
grant_x,
data_a,
data_crit_x_l,                         
data_ncrit_x_l,                         
data_x_l,
qsel0_buf,
shift_buf,                         
si,                         
so
);

input l1clk0;
input l1clk1;
input siclk;
input soclk;
input grant_x;
input data_a;
input data_crit_x_l;
input data_ncrit_x_l;

input qsel0_buf;
input shift_buf;

output data_x_l;

input  si;
output so;

wire   so1;
wire   q1;
wire   q0;
wire   q0_in;
wire   x4;
wire   x5;


cl_dp1_ccx_msff_4x msff1 (
.l1clk(l1clk1),
.siclk(siclk),
.soclk(soclk),
.d(data_a),
.si(si),
.so(so1),
.q(q1)
);

cl_dp1_ccx_aomux2_4x mux1(
.in0(data_a),
.in1(q1),
.sel0(qsel0_buf),
.sel1(shift_buf),
.out(q0_in)
);

cl_dp1_ccx_msff_4x msff0 (
.l1clk(l1clk0),
.siclk(siclk),
.soclk(soclk),
.d(q0_in),
.si(so1),
.so(so),
.q(q0)
);

cl_dp1_ccx_nand2_4x nand0(
.in0(q0),
.in1(grant_x),
.out(x4)
);

cl_dp1_ccx_nand3_12x nand1(
.in0(x4),
.in1(data_ncrit_x_l),
.in2(data_crit_x_l),
.out(x5)
);

cl_dp1_ccx_inva_32x inv0(
.in(x5),
.out(data_x_l)
);

endmodule // cl_dp1_ccx_mac_c2

module cl_dp1_ccx_aomux2_4x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule

module cl_dp1_ccx_buf_8x (
in,
out
);
input	in;
output	out;

`ifdef LIB
assign out = in;
`endif

endmodule
module cl_dp1_ccx_buf_1x (
in,
out
);
input	in;
output	out;

`ifdef LIB
assign out = in;
`endif

endmodule
module cl_dp1_ccx_bufmin_1x (
in,
out
);
input	in;
output	out;

`ifdef LIB
assign out = in;
`endif

endmodule
module cl_dp1_ccx_inv_12x (
in,
out
);
input	in;
output	out;

`ifdef LIB
assign out = ~in;
`endif

endmodule
module cl_dp1_ccx_inv_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
assign out = ~in;
`endif

endmodule
module cl_dp1_ccx_inva_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
assign out = ~in;
`endif

endmodule

module cl_dp1_ccx_msff_16x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_dp1_ccx_msffmin_4x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
	`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_dp1_ccx_msff_4x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff
module cl_dp1_ccx_msff_8x ( q, so, d, l1clk, si, siclk, soclk );
// RFM 05-14-2004
// Level sensitive in SCAN_MODE
// Edge triggered when not in SCAN_MODE


   parameter SIZE = 1;

   output     q;
   output       so;

   input         d;
   input     l1clk;
   input      si;
   input   siclk;
   input   soclk;

             reg       q;
             wire     so;
             wire      l1clk, siclk, soclk;

        `ifdef SCAN_MODE

             reg l1;
`ifdef FAST_FLUSH
         always @(posedge l1clk or posedge siclk ) begin
                  if (siclk) begin
                    q <=  1'b0;  //pseudo flush reset
                  end else begin
                    q <=  d;
                  end
                end     
	`else
             always @(l1clk or siclk or soclk or d or si)
              begin
                    if (!l1clk && !siclk)           l1 <= d;    // Load master with data
               else if ( l1clk &&  siclk)           l1 <= si;    // Load master with scan or flush
               else if (!l1clk &&  siclk)           l1 <= 1'bx;    // Conflict between data and scan

               else if ( l1clk && !siclk && !soclk)  q <= l1;    // Load slave with master data
                    if ( l1clk &&  siclk && !soclk)  q <= si;    // Flush
              end
	`endif
        `else
              wire  si_unused;
              wire siclk_unused;
              wire soclk_unused;
              assign si_unused = si;
              assign siclk_unused        = siclk;
              assign soclk_unused        = soclk;


          `ifdef INITLATZERO
                initial q = 1'b0;
          `endif

              always @(posedge l1clk)
               begin
                if (!siclk && !soclk) q <=  d;
                else                  q <= 1'bx;
               end
        `endif

         assign so = q;

endmodule // dff

module cl_dp1_ccx_nand2_1x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_dp1_ccx_nand2_12x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_dp1_ccx_nand2_4x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_dp1_ccx_nand3_12x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module  cl_dp1_ccx_l1hdr_16x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
wire            l1en = (~stop & ( pce | pce_ov ));
assign       l1clk = (l2clk & l1en) | se;
assign siclk_out = aclk;
assign soclk_out = bclk;
`else
 `ifdef LIB
reg             l1en;
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else

   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif
   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

 `endif //  `ifdef LIB
`endif // !`ifdef FORMAL_TOOL


endmodule

module  cl_dp1_ccx_l1hdr_8x (l1clk,
                 l2clk,
                 se,
                 pce,
                 pce_ov,
                 stop,
                 aclk,
                 bclk,
                 siclk_out,
                 soclk_out
                );
// RFM  05/21/2004


   output       l1clk;
   input        l2clk;          // level 2 clock, from clock grid
   input        se;             // Scan Enable
   input        pce;             // Clock enable for local power savings
   input        pce_ov;        // TCU sourced clock enable override for testing
   input        stop;           // TCU/CCU sourced clock stop for debug
   input        aclk;
   input        bclk;
   output       siclk_out;
   output       soclk_out;
`ifdef FORMAL_TOOL
wire            l1en = (~stop & ( pce | pce_ov ));
assign       l1clk = (l2clk & l1en) | se;
assign siclk_out = aclk;
assign soclk_out = bclk;
`else
 `ifdef LIB
reg             l1en;
`ifdef SCAN_MODE
   always @ (l2clk or stop or pce or pce_ov)
       begin
         if (~l2clk) l1en <= (~stop & (pce | pce_ov));
       end
`else

   always @ (negedge l2clk )
        begin
           l1en <= (~stop & ( pce | pce_ov ));
        end
`endif
   //assign       l1clk = (l2clk & l1en) || se;  // se is async and highest priority
   assign l1clk = l2clk;	//FPGA disable clock gating

assign siclk_out = aclk;
assign soclk_out = bclk;

 `endif //  `ifdef LIB
`endif // !`ifdef FORMAL_TOOL


endmodule
