module magnitude_dff_top (in1, in2, clk1, clk2, out, reset);
  input [7:0] in1, in2;
  input clk1, clk2;
  input reset;
  output [7:0] out;
  
  wire [7:0] w1;

  magnitude mag (.x(in1), .y(in2), .r(w1),.reset(reset),.clk(clk1));
  DFF_X1 r2 (.D(w1), .C(clk2), .Q(out));
endmodule  
