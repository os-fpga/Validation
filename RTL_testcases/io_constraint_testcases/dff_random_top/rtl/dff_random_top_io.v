 
module dff_random_top_io #(parameter WIDTH=32) (in1, clk1, clk2, clk3, clk4, out, reset);
  input [WIDTH-1:0] in1;
  input clk1, clk2, clk3, clk4; 
  input reset;
  output [WIDTH-1:0] out;

  wire [WIDTH-1:0] w1, w2, w3;

  DFF_X1 #(.WIDTH(WIDTH)) r1 (.D(in1), .C(clk1), .Q(w1));
  design108_10_15_top #(.WIDTH(WIDTH)) ra1 (.clk(clk2),.rst(reset),.in(w1),.out(w2));
  DFF_X1 #(.WIDTH(WIDTH)) r2 (.D(w2), .C(clk3), .Q(w3));
  DFF_X1 #(.WIDTH(WIDTH))r3 (.D(w3), .C(clk4), .Q(out));
endmodule 