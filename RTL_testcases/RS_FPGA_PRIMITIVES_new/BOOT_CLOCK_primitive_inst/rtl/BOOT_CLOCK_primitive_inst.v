module BOOT_CLOCK_primitive_inst (
  output reg O_BOOT_CLOCK // Clock output
);

  BOOT_CLOCK #(
    .PERIOD(30.0) // Set the clock period to 30.0 ns
  ) BOOT_CLOCK_primitive (
    .O(O_BOOT_CLOCK)   // Connect to your clock output signal
  );

endmodule
