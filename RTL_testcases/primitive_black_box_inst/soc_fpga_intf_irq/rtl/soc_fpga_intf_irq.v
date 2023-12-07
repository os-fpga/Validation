module soc_fpga_intf_irq (
    
    input  [15:0] IRQ_SRC,
    output [15:0] IRQ_SET,
    input         IRQ_CLK,
    input         IRQ_RST_N

);

SOC_FPGA_INTF_IRQ inst (
    .IRQ_SRC(IRQ_SRC),
    .IRQ_SET(IRQ_SET),
    .IRQ_CLK(IRQ_CLK),
    .IRQ_RST_N(IRQ_RST_N)
);

endmodule
