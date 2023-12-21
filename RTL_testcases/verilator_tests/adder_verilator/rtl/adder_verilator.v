module adder_verilator (
  input clock,
  input reset,
  input [3:0] a,
  input [3:0] b,
  output reg [4:0] sum
);

always@(posedge clock) begin
  if(reset) begin
    sum <= 0;
  end else begin
    sum <= a + b;
  end
end

endmodule
