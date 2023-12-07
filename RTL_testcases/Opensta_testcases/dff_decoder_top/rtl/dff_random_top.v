module dff_random_top (in1, clk1, clk2, clk3, clk4, reset, out);
  input [31:0] in1;
  input clk1, clk2, clk3, clk4, reset;
  output [31:0] out;
  wire [31:0] w1, w2, w3;

  DFF_X1 r1 (.D(in1), .CK(clk1), .Q(w1));
  DFF_X1 r2 (.D(w1), .CK(clk2), .Q(w2));
  decoder_top u1 (.data_in(w2), .data_out(w3),.rst(reset),.clk(clk3));
  DFF_X1 r3 (.D(w3), .CK(clk4), .Q(out));
endmodule
