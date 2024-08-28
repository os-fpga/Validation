module tdl_da_lc (clk, clk_en, data_in, data_out );

parameter WIDTH = 8;

input clk, clk_en;
input  [WIDTH-1:0] data_in;
output [WIDTH-1:0] data_out;

reg  [WIDTH-1:0] data_out;

always @(posedge clk)
begin
  if (clk_en == 1'b1)   data_out <= data_in;
end

endmodule
