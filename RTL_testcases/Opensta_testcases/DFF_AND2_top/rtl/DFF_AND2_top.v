 
module DFF_AND2_top (in1, in2, clk1, clk2, clk3, out);
  input in1, in2, clk1, clk2, clk3;
  output out;
  wire w1, w2, w3, w4;

  DFF_X1 r1 (.D(in1), .C(clk1), .Q(w1));
  DFF_X1 r2 (.D(in2), .C(clk2), .Q(w2));
  BUF_X1 u1 (.A(w2), .Y(w3));
  AND_X1 u2 (.A(w1), .B(w3), .Y(w4));
  DFF_X1 r3 (.D(w4), .C(clk3), .Q(out));
endmodule 