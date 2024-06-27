module soc_fpga_intf_irq (
    
    input  [15:0] IRQ_SRC,
    output [15:0] IRQ_SET,
    input         IRQ_CLK,
    input         IRQ_RST_N,
    input         clk,
    input         reset
);

wire irq_rst_w;

SOC_FPGA_INTF_IRQ inst (
    .IRQ_SRC(IRQ_SRC),
    .IRQ_SET(IRQ_SET),
    .IRQ_CLK(IRQ_CLK),
    .IRQ_RST_N(irq_rst_w)
);

always @(posedge clk) begin
    if (reset)
        irq_rst_w <= 0;
    else
        irq_rst_w <= IRQ_RST_N;
end

endmodule
