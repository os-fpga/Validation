module mac_tl (clk, data_in, data_out );

parameter DATA_WIDTH = 15;

input  clk;
input  [DATA_WIDTH-1:0] data_in;
output [DATA_WIDTH-1:0] data_out;

assign data_out = data_in;

endmodule
