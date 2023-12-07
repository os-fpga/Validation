module DFF_X1(C, D, Q);
input C, D;
output reg Q;

always @(posedge C)
	Q <= D;
endmodule
 
 module DFF_top (in1, clk1, clk2, out); 
  input in1, clk1, clk2;
  output out;
  wire w1;

  DFF_X1 r1 (.D(in1), .C(clk1), .Q(w1));
  DFF_X1 r2 (.D(w1), .C(clk2), .Q(out));

endmodule
