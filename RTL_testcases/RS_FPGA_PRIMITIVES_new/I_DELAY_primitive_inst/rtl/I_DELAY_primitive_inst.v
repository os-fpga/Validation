module I_DELAY_primitive_inst #(
  parameter DELAY = 0 // TAP delay value (0-63)
) (
  input reset,
  input in, // Data Input (Connect to input port or buffer)
  input DLY_LOAD, // Delay load input
  input DLY_ADJ, // Delay adjust input
  input DLY_INCDEC, // Delay increment / decrement input
  output [5:0] DLY_TAP_VALUE, // Delay tap value output
  input CLK_IN, // Clock input
  output O // Data output
);

reg dff;

I_DELAY #(
  .DELAY(0)
) inst (
  .I(dff), // Data Input (Connect to input port or buffer)
  .DLY_LOAD(DLY_LOAD), // Delay load input
  .DLY_ADJ(DLY_ADJ), // Delay adjust input
  .DLY_INCDEC(DLY_INCDEC), // Delay increment / decrement input
  .DLY_TAP_VALUE(DLY_TAP_VALUE), // Delay tap value output
  .CLK_IN(CLK_IN), // Clock input
  .O(O) 
);

always @(posedge CLK_IN) begin
  if (reset) 
      dff <= 0;
  else 
      dff <= in;
end

endmodule
