module soc_fpga_intf_dma (
    
    input  [3:0] DMA_REQ,
    output [3:0] DMA_ACK,
    input        DMA_CLK,
    input        DMA_RST_N     

);

SOC_FPGA_INTF_DMA inst (
    .DMA_REQ(DMA_REQ),
    .DMA_ACK(DMA_ACK),
    .DMA_CLK(DMA_CLK),
    .DMA_RST_N(DMA_RST_N)
);

endmodule
