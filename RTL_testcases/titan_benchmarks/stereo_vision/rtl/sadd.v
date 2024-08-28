module sadd(clk, ain, bin, res);

parameter IN_WIDTH = 8;
parameter PIPE_DEPTH=1;

input clk;
input [IN_WIDTH-1:0] ain;
input [IN_WIDTH-1:0] bin;

output [IN_WIDTH:0] res;

wire clk;
wire [IN_WIDTH-1:0] ain;
wire [IN_WIDTH-1:0] bin;

reg [IN_WIDTH:0] res;

always @(posedge clk)
  res <= {ain[IN_WIDTH-1], ain} + {bin[IN_WIDTH-1], bin};

endmodule
