module primitive_example_design_8 (
    input clk,
    input reset,
    input data_in,
    input resp,
    input ready,
    input ibuf1_en,ibuf2_en,ibuf3_en,
    input [1:0] mux_select,
    input obuft_ds1_oe,obuft_ds2_oe,obuft_ds3_oe,obuft_ds4_oe,
    output reset_o,
    output obuft_ds_out_n,obuft_ds_out_p,
    output size_out,
    output [2:0] burst_ff,
    output [3:0] prot_ff,
    output [1:0] trans_ff,
    output wdata,
    output [3:0] wbe_p,wbe_n,
    output [4:0] addr
);

    reg mux_output;
    reg [31:0] shift_reg;
    wire [31:0] shift_reg_out,wdata_w,addr_w;
    wire resp_w,ready_w,data_in_w;
    wire [2:0] size_w,burst_w;
    wire masterlock,sel,write;
    wire mux_out,burst_ff_w,wdata_ww;
    wire [3:0] prot_w,wbe_w;
    wire [1:0] trans_w;
    

SOC_FPGA_INTF_AHB_S inst (
    .HRESETN_I(reset_o),
    .HADDR(addr_w),
    .HBURST(burst_w),
    .HMASTLOCK(masterlock),
    .HREADY(ready_w),
    .HPROT(prot_w),
    .HRDATA(shift_reg_out),
    .HRESP(resp_w),
    .HSEL(sel),
    .HSIZE(size_w),
    .HTRANS(trans_w),
    .HWBE(wbe_w),
    .HWDATA(wdata_w),
    .HWRITE(write),
    .HCLK(clk)
);

    assign size_out = size_w[0] * size_w[1] * size_w[2];

    I_BUF ibuf_inst1 (.I(data_in),.EN(ibuf1_en),.O(data_in_w));
    I_BUF ibuf_inst2 (.I(ready),.EN(ibuf2_en),.O(ready_w));
    I_BUF ibuf_inst3 (.I(resp),.EN(ibuf3_en),.O(resp_w));


    //shift register
    always @(posedge clk or posedge reset) begin
      if (reset) begin
        shift_reg <= 32'b0;
      end else begin
        shift_reg <= {shift_reg[30:0], data_in_w};
      end
    end

    assign shift_reg_out = shift_reg;

    // 3:1 mux
    always @* begin
      case (mux_select)
        2'b00: mux_output = masterlock;
        2'b01: mux_output = sel;
        2'b10: mux_output = write;
        default: mux_output = sel;
      endcase
    end
  
    assign mux_out = mux_output;

    O_BUFT_DS obuft_ds_inst1 (.I(mux_out),.T(obuft_ds1_oe),.O_N(obuft_ds_out_n),.O_P(obuft_ds_out_p));
    O_BUFT_DS obuft_ds_inst2 (.I(wbe_w[0]),.T(obuft_ds2_oe),.O_N(wbe_n[0]),.O_P(wbe_p[0]));
    O_BUFT_DS obuft_ds_inst3 (.I(wbe_w[1]),.T(obuft_ds3_oe),.O_N(wbe_n[1]),.O_P(wbe_p[1]));
    O_BUFT_DS obuft_ds_inst4 (.I(wbe_w[2]),.T(obuft_ds4_oe),.O_N(wbe_n[2]),.O_P(wbe_p[2]));

    register register_inst1 (.clk(clk),.d(burst_w),.rst(reset),.q(burst_ff_w));
    register register_inst2 (.clk(clk),.d(prot_w),.rst(reset),.q(prot_ff));
    register register_inst3 (.clk(clk),.d(trans_w),.rst(reset),.q(trans_ff));

    // bitwise oring
    assign wdata_ww = |wdata_w;

    // count ones in addr
    assign addr = $countones(addr_w);

    O_BUF o_buff_inst1 (.I(burst_ff_w),.O(burst_ff));
    O_BUF o_buff_inst2 (.I(wdata_ww),.O(wdata));

endmodule

module register #(parameter WIDTH=32) (clk,d,rst,q);
    input clk,rst;
    input [WIDTH-1:0] d;
    output [WIDTH-1:0] q;

    always @(posedge clk) begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end
endmodule
