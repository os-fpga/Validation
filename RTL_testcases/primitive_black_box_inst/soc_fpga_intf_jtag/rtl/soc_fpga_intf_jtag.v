module soc_fpga_intf_jtag (
    
    input  BOOT_JTAG_TCK,
    output BOOT_JTAG_TDI,
    input  BOOT_JTAG_TDO,
    output BOOT_JTAG_TMS,
    output BOOT_JTAG_TRSTN,
    input  BOOT_JTAG_EN,
    input  reset,
    input  clk               
);

wire boot_jtag_en_w;

SOC_FPGA_INTF_JTAG inst (
    .BOOT_JTAG_TCK(BOOT_JTAG_TCK),
    .BOOT_JTAG_TDI(BOOT_JTAG_TDI),
    .BOOT_JTAG_TDO(BOOT_JTAG_TDO),
    .BOOT_JTAG_TMS(BOOT_JTAG_TMS),
    .BOOT_JTAG_TRSTN(BOOT_JTAG_TRSTN),
    .BOOT_JTAG_EN(boot_jtag_en_w)
);

always @(posedge clk) begin
    if (reset)
    boot_jtag_en_w <= 0;
    else
        boot_jtag_en_w <= BOOT_JTAG_EN;
end

endmodule