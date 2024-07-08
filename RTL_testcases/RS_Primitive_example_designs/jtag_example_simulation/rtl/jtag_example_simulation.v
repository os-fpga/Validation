module jtag_example_simulation (
  input clock,
  output tdi,
  input tdo,
  output tms,
  output reset_n,
  input en
);

  wire enable;
  
  SOC_FPGA_INTF_JTAG inst (
    .BOOT_JTAG_TCK(clock),
    .BOOT_JTAG_TDI(tdi),
    .BOOT_JTAG_TDO(tdo),
    .BOOT_JTAG_TMS(tms),
    .BOOT_JTAG_TRSTN(reset_n),
    .BOOT_JTAG_EN(enable)
  );

  always @(posedge clock) begin
    if (!reset_n)
      enable <= 0;
    else
      enable <= en;
  end

endmodule
