module DFF_X1(C, D, Q);
input C;
input [7:0] D;
output reg [7:0] Q;

always @(posedge C)
	Q <= D;

endmodule 
