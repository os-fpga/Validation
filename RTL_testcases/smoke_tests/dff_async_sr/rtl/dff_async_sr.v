module dff_async_sr (
  input wire clk,
	input wire din,
  input wire async_set,
  input wire async_reset,
  output reg q
);

  always @(posedge clk or posedge async_set or posedge async_reset) begin
    if (async_reset)
      q <= 0;
    else if (async_set)
      q <= 1;
    else
      q <= din;
  end

endmodule 
