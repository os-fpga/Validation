module ram_dual_top_opensta (in1, in2, clk1, clk2, clk3, clk4, clk5, read_add, write_add, out);
  input in1, in2, clk1, clk2, clk3, clk4, clk5;
  input [5:0] read_add, write_add;
  output [7:0] out;
  wire w1, w2, w3, w4;
  wire [7:0] w5;

  DFF_X1 r1 (.D(in1), .C(clk1), .Q(w1));
  DFF_X1 r2 (.D(in2), .C(clk2), .Q(w2));
  BUF_X1 u1 (.A(w2), .Y(w3));
  AND_X1 u2 (.A(w1), .B(w3), .Y(w4));
  DFF_X1 r3 (.D(w4), .C(clk3), .Q(w5));
  ram_dual ra1 (.data(w5), .read_addr(read_add),.write_addr(write_add),.we(w2),.read_clock(clk4),.write_clock(clk5),.q(out));
endmodule 
