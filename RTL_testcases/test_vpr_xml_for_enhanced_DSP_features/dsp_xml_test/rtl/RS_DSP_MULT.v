module RS_DSP_MULT(a,b,feedback,unsigned_a,unsigned_b,z);
input [19:0] a;
input [17:0] b;
input [2:0] feedback;
input unsigned_a;
input unsigned_b;
output [37:0] z;

assign z = a * b;
endmodule 
