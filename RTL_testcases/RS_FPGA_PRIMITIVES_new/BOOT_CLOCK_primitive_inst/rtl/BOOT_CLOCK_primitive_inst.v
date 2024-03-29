module BOOT_CLOCK_primitive_inst (
  input wire clk1,       // Source clock domain clock
  input wire async_signal, // Asynchronous signal to be synchronized
  output reg sync_signal, // Synchronized signal
  output reg O_BOOT_CLOCK // Clock output
);

  reg [1:0] sync_reg; // Two-stage synchronizer flip-flops

  BOOT_CLOCK #(
    .PERIOD(30.0) // Set the clock period to 30.0 ns
  ) BOOT_CLOCK_primitive (
    .O(O_BOOT_CLOCK)   // Connect to your clock output signal
  );

  always @(posedge clk1) begin    // Capture input on source clock domain
    sync_reg[0] <= async_signal;
  end

  always @(posedge O_BOOT_CLOCK) begin    // Release synchronized signal on destination clock domain
    sync_signal <= sync_reg[1];
    sync_reg[1] <= sync_reg[0];
  end

endmodule
