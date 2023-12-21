module DFF_X1(C, D, Q);
input C, D;
output reg Q;

always @(posedge C)
	Q <= D;

endmodule 
