module DFF_X1 #(parameter WIDTH=32)(C, D, Q);
input C;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;

always @(posedge C)
	Q <= D;

endmodule
