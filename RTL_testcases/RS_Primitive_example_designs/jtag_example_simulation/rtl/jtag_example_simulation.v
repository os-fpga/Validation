module jtag_example_simulation (
  input clock,
  output tdi,
  input tdo,
  output tms,
  output reset_n,
  input en
);
  
  SOC_FPGA_INTF_JTAG inst (
    .BOOT_JTAG_TCK(clock),
    .BOOT_JTAG_TDI(tdi),
    .BOOT_JTAG_TDO(tdo),
    .BOOT_JTAG_TMS(tms),
    .BOOT_JTAG_TRSTN(reset_n),
    .BOOT_JTAG_EN(en)
  );

endmodule
