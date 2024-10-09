`timescale 1ps/1ps

module GJC47_tb;

  // Parameters
  localparam  DELAY             = 4;
  localparam  NUM_GB_SITES      = 20;
  localparam  DLY_LOC           = 20'b01010000000010000010;
  localparam  ADDR_WIDTH        = 5;
  localparam  DLY_TAP_WIDTH     = 6;
  localparam  NUM_DLY           = 4;
  localparam  DLY_SEL_WIDTH     = $clog2(NUM_DLY);

  //Ports
  reg  clk_i_buf;
  reg  reset;
  reg [DLY_SEL_WIDTH-1:0] sel_dly;
  reg [(NUM_DLY/2)-1:0] din_idly;
  reg [(NUM_DLY/2)-1:0] din_odly;
  reg [DLY_TAP_WIDTH:0] g2f_trx_dly_tap;
  reg  dly_incdec_buf;
  reg  dly_ld_buf;
  reg  dly_adj_buf;
  reg  [NUM_DLY-1:0] usr_rd_dly_value;
  wire [NUM_DLY-1:0] data_delayed_buf;
  wire [DLY_TAP_WIDTH-1:0] dly_tap_val_inv_buf;

  GJC47 # (
    .DELAY(DELAY),
    .NUM_GB_SITES(NUM_GB_SITES),
    .DLY_LOC(DLY_LOC),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DLY_TAP_WIDTH(DLY_TAP_WIDTH),
    .NUM_DLY(NUM_DLY),
    .DLY_SEL_WIDTH(DLY_SEL_WIDTH)
  )
  GJC47_inst (
    .clk_i_buf(clk_i_buf),
    .reset(reset),
    .sel_dly(sel_dly),
    .din_idly(din_idly),
    .din_odly(din_odly),
    .g2f_trx_dly_tap(g2f_trx_dly_tap),
    .dly_incdec_buf(dly_incdec_buf),
    .dly_ld_buf(dly_ld_buf),
    .dly_adj_buf(dly_adj_buf),
    .usr_rd_dly_value(usr_rd_dly_value),
    .data_delayed_buf(data_delayed_buf),
    .dly_tap_val_inv_buf(dly_tap_val_inv_buf)
  );
// GJC47_post_synth post_snth();
always #5 clk_i_buf = !clk_i_buf;

integer i;

initial begin
    {din_idly, din_odly, g2f_trx_dly_tap, dly_adj_buf, dly_incdec_buf, dly_ld_buf, usr_rd_dly_value} = 'd0;
    reset = 1'd1;
    clk_i_buf = 1'b0;
    // for (i = 0; i < 10; i = i + 1) begin
    //     din_idly = $random;
    //     din_odly = $random;
    //     @(posedge clk_i_buf);
    // end
    repeat(10)@(posedge clk_i_buf);
    reset = 1'd0;
    sel_dly       = 6'd3;
    repeat(2)@(posedge clk_i_buf);
    sel_dly       = 6'd0;
    // for (i = 0; i < 10; i = i + 1) begin
    din_idly = 3;
    dly_ld_buf      = 1'b1;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;
    din_odly = 3;
        // @(posedge clk_i_buf);
    // end

    repeat(2)@(posedge clk_i_buf);
    din_idly = 0;
    din_odly = 0;
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b1;
    dly_incdec_buf  = 1'b1;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;

    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b1;
    dly_incdec_buf  = 1'b0;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;
        sel_dly       = 6'd1;
    // for (i = 0; i < 10; i = i + 1) begin
    din_idly = 3;
    dly_ld_buf      = 1'b1;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;
    din_odly = 3;
        // @(posedge clk_i_buf);
    // end

    repeat(2)@(posedge clk_i_buf);
    din_idly = 0;
    din_odly = 0;
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b1;
    dly_incdec_buf  = 1'b1;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;

    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b1;
    dly_incdec_buf  = 1'b0;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;


        sel_dly       = 6'd2;
    // for (i = 0; i < 10; i = i + 1) begin
    din_idly = 3;
    dly_ld_buf      = 1'b1;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;
    din_odly = 3;
        // @(posedge clk_i_buf);
    // end

    repeat(2)@(posedge clk_i_buf);
    din_idly = 0;
    din_odly = 0;
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b1;
    dly_incdec_buf  = 1'b1;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;

    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b1;
    dly_incdec_buf  = 1'b0;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;


        sel_dly       = 6'd3;
    // for (i = 0; i < 10; i = i + 1) begin
    din_idly = 3;
    dly_ld_buf      = 1'b1;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;
    din_odly = 3;
        // @(posedge clk_i_buf);
    // end

    repeat(2)@(posedge clk_i_buf);
    din_idly = 0;
    din_odly = 0;
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b1;
    dly_incdec_buf  = 1'b1;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;

    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b1;
    dly_incdec_buf  = 1'b0;
    repeat(2)@(posedge clk_i_buf);
    dly_ld_buf      = 1'b0;
    dly_adj_buf     = 1'b0;
    dly_incdec_buf  = 1'b0;
    // repeat(10)@(posedge clk_i_buf);
    sel_dly = 6'd0;

    #1000;
    $finish;
end

initial begin
    $dumpfile("GJC47RTL.vcd");
    $dumpvars();
end

endmodule
