module DFF_X1(CK, D, Q);
input CK;
input [31:0] D;
output reg [31:0] Q;

always @(posedge CK)
	Q <= D;

endmodule 
