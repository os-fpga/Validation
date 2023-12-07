//parameter WIDTH=32;

module invertion_4
(
input [3:0] data_in,
output [3:0] data_out);

assign data_out = ~data_in;


endmodule

