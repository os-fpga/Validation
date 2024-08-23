module GJC48 (
  input wire clk,
  input wire reset_n,
  input wire [3:0] dma_req_in,
  output reg [3:0] dma_ack_out
);

  reg [3:0] dma_req_reg;
  reg [3:0] dma_ack_reg;

  // Instantiate the DMA module
  SOC_FPGA_INTF_DMA dma_inst (
    .DMA_REQ (dma_req_reg),
    .DMA_ACK (dma_ack_reg),
    .DMA_CLK (clk),
    .DMA_RST_N (reset_n)
  );

  // Input registers
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      dma_req_reg <= 4'b0;
    end else begin
      dma_req_reg <= dma_req_in;
    end
  end

  // Connect output register to top-level output
  // Input registers
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      dma_ack_out <= 4'b0;
    end else begin
      dma_ack_out <= dma_ack_reg;
    end
  end

endmodule
