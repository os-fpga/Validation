 
module clocks_16 (in1, in2, clk1, clk2, clk3, clk4, clk5, clk6, clk7, clk8, clk9, clk10, clk11, clk12, clk13, clk14, clk15, clk16, out);
  input in1, in2;
  input clk1, clk2, clk3, clk4, clk5, clk6, clk7, clk8, clk9, clk10, clk11, clk12, clk13, clk14, clk15, clk16;
  output out;
  wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20;

  DFF_X1 r1 (.D(in1), .C(clk1), .Q(w1));

  DFF_X1 r2 (.D(in2), .C(clk2), .Q(w2));

  AND_X1 u1 (.A(w1), .B(w2), .Y(w3));

  DFF_X1 r3 (.D(w3), .C(clk3), .Q(w4));

  DFF_X1 r4 (.D(w4), .C(clk4), .Q(w5));

  DFF_X1 r5 (.D(w5), .C(clk5), .Q(w6));

  BUF_X1 u2 (.A(w6), .Y(w7));

  DFF_X1 r6 (.D(w7), .C(clk6), .Q(w8));

  DFF_X1 r7 (.D(w8), .C(clk7), .Q(w9));

  DFF_X1 r8 (.D(w9), .C(clk8), .Q(w10));

  BUF_X1 u3 (.A(w10), .Y(w11));

  DFF_X1 r9 (.D(w11), .C(clk9), .Q(w12));

  DFF_X1 r10 (.D(w12), .C(clk10), .Q(w13));

  DFF_X1 r11 (.D(w13), .C(clk11), .Q(w14));

  BUF_X1 u4 (.A(w14), .Y(w15));

  DFF_X1 r12 (.D(w15), .C(clk12), .Q(w16));

  DFF_X1 r13 (.D(w16), .C(clk13), .Q(w17));

  DFF_X1 r14 (.D(w17), .C(clk14), .Q(w18));

  BUF_X1 u5 (.A(w18), .Y(w19));

  DFF_X1 r15 (.D(w19), .C(clk15), .Q(w20));

  DFF_X1 r16 (.D(w20), .C(clk16), .Q(out));

endmodule 