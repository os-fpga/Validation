module primitive_example_design_11 (
  input clk,
  input rst,
  input tdo,
  input en,
  input ibuf1_en,ibuf2_en,ibuf3_en,
  input [1:0] mux_select,
  output out
);

  wire clock,reset;
  wire en_w,tdo_w,tdi_w,reset_n_w,tms_w,out_w;
  wire tdi_wm,tms_wm,reset_nm;
  
  SOC_FPGA_INTF_JTAG inst (
    .BOOT_JTAG_TCK(clock),
    .BOOT_JTAG_TDI(tdi_w),
    .BOOT_JTAG_TDO(tdo_w),
    .BOOT_JTAG_TMS(tms_w),
    .BOOT_JTAG_TRSTN(reset_n_w),
    .BOOT_JTAG_EN(en_w)
  );
  
  I_BUF ibuf_inst1 (.I(clk),.EN(ibuf1_en),.O(clock));
  I_BUF ibuf_inst2 (.I(en),.EN(ibuf2_en),.O(en_w));
  I_BUF ibuf_inst3 (.I(rst),.EN(ibuf3_en),.O(reset));

  register reg_inst1 (.d(tdo),.clk(clock),.rst(reset),.q(tdo_w));
  register reg_inst2 (.d(tdi_w),.clk(clock),.rst(reset),.q(tdi_wm));
  register reg_inst3 (.d(reset_n_w),.clk(clock),.rst(reset),.q(reset_nm));
  register reg_inst4 (.d(tms_w),.clk(clock),.rst(reset),.q(tms_wm));

  assign out_w = (mux_select == 2'b00) ? tdi_wm : (mux_select == 2'b01) ? tms_wm : (mux_select == 2'b10) ? reset_nm : 1'bz; // Output is undefined for mux_select = 2'b11

  O_BUF obuf_inst1 (.I(out_w),.O(out));

endmodule

module register #(parameter WIDTH=1) (d,clk,rst,q);
    input clk;
    input rst;
    input [WIDTH-1:0] d;
    output [WIDTH-1:0] q;

    always @(posedge clk) begin
        if (rst)
          q = 0;
        else 
          q = d;
    end
endmodule
