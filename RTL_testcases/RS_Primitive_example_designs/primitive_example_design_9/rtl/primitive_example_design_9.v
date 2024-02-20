module primitive_example_design_9 (
  input src,
  output [15:0] set,
  input clock,
  input reset,
  input ibuf1_en,ibuf2_en
);

  wire clock_buf,reset_w;
  wire src_w1,src_w2,set_o;
  reg [15:0] irq_src_w;
  wire [15:0] set_w;
  
  SOC_FPGA_INTF_IRQ inst (
  .IRQ_SRC(irq_src_w),
  .IRQ_SET(set_w),
  .IRQ_CLK(clock_buf),
  .IRQ_RST_N(reset_w)
  );
  
  CLK_BUF clk_buf_inst (.I(clock),.O(clock_buf));
  
  I_BUF ibuf_inst1 (.I(reset),.EN(ibuf1_en),.O(reset_w));
  I_BUF ibuf_inst2 (.I(src),.EN(ibuf2_en),.O(src_w1));

  O_BUF obuf_inst1 (.I(set_o),.O(set));

  latchn #(1) latch_inst1 (.d(src_w1),.en(reset),.q(src_w2));
  latch #(16) latch_inst2 (.d(set_w),.en(reset),.q(set_o));

  always @ (posedge clock or negedge reset) begin
    if (reset)
      irq_src_w <= 16'b0;
    else
      irq_src_w <= {irq_src_w[14:0],src_w2};
  end
endmodule

module latchn #(parameter WIDTH=1) (d,en,q);
input en;
input [WIDTH-1:0] d;
output [WIDTH-1:0] q;

always @(*) begin
    if (!en) q = d;
end
endmodule

module latch #(parameter WIDTH=1) (d,en,q);
    input en;
    input [WIDTH-1:0] d;
    output [WIDTH-1:0] q;

    always @(*) begin
        if (en) q = d;
    end
endmodule
