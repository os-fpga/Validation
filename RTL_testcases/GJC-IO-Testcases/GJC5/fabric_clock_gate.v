`timescale 1ns/1ps
//  This is an example gate-level code to instantiate an internal fabric clock or the post-syntehsis netlist result from fabric_clock_rtl 
//  This file can be read into synthesis to have direct implementation without inferrence or is considered an optimal output netlist from
//     fabric_clock_rtl.v showing primitve mapping and more optimal naming conventions for wires and instances.
//  This example include metdata to fabric_clock_rtl to allow future cross-probing to source.

module fabric_clock_gate (
  (* src = "fabric_clock_rtl.v:5" *)
  input D_full_speed,
  (* src = "fabric_clock_rtl.v:6" *)
  input D_half_speed,
  (* src = "fabric_clock_rtl.v:7" *)
  input CLK,
  (* src = "fabric_clock_rtl.v:8" *)
  output Q_full_speed,
  (* src = "fabric_clock_rtl.v:9" *)
  output Q_half_speed
);

  (* src = "fabric_clock_rtl.v:5" *)
  wire D_full_speed_i_buf;
  (* src = "fabric_clock_rtl.v:6" *)
  wire D_half_speed_i_buf;
  (* src = "fabric_clock_rtl.v:7" *)
  wire CLK_i_buf;
  (* src = "fabric_clock_rtl.v:7" *)
  wire CLK_clk_buf;
  (* src = "fabric_clock_rtl.v:21" *)
  wire Q_full_speed_dff;
  (* src = "fabric_clock_rtl.v:26" *)
  wire Q_half_speed_dff;
  (* src = "fabric_clock_rtl.v:12" *)
  wire half_clk;
  (* src = "fabric_clock_rtl.v:17" *)
  wire half_clk_lut;
  (* src = "fabric_clock_rtl.v:12" *)
  wire half_clk_clk_buf;
  (* src = "fabric_clock_rtl.v:13" *)
  wire q_full_speed_int;
  (* src = "fabric_clock_rtl.v:14" *)
  wire q_half_speed_int;

  (* src = "fabric_clock_rtl.v:5" *)
  I_BUF #(
    .WEAK_KEEPER("NONE")
  ) D_full_speed_i_buf_inst (
    .I(D_full_speed),
    .EN(1'b1),
    .O(D_full_speed_i_buf));

  (* src = "fabric_clock_rtl.v:6" *)
  I_BUF #(
    .WEAK_KEEPER("NONE")
  ) D_half_speed_i_buf_inst (
    .I(D_half_speed),
    .EN(1'b1),
    .O(D_half_speed_i_buf));

  (* src = "fabric_clock_rtl.v:7" *)
  I_BUF #(
    .WEAK_KEEPER("NONE")
  ) CLK_i_buf_inst (
    .I(CLK),
    .EN(1'b1),
    .O(CLK_i_buf));
	
  (* src = "fabric_clock_rtl.v:7" *)
  CLK_BUF CLK_clk_buf_inst (
  .I(CLK_i_buf),
	.O(CLK_clk_buf));

  (* src = "fabric_clock_rtl.v:12" *)
  CLK_BUF half_clk_clk_buf_inst (
  .I(half_clk),
	.O(half_clk_clk_buf));

  (* src = "fabric_clock_rtl.v:17" *)
  LUT1 #(
    .INIT_VALUE(2'b01)
  ) half_clk_lut1_inst (
    .A(half_clk),
    .Y(half_clk_lut));

  (* src = "fabric_clock_rtl.v:17" *)
  DFFRE half_clk_dffre_inst (
  .D(half_clk_lut),
	.R(1'b1),
	.E(1'b1),
	.C(CLK_clk_buf),
	.Q(half_clk));

  (* src = "fabric_clock_rtl.v:20" *)
  DFFRE q_full_speed_int_dffre_inst (
  .D(D_full_speed_i_buf),
	.R(1'b1),
	.E(1'b1),
	.C(CLK_clk_buf),
	.Q(q_full_speed_int));

  (* src = "fabric_clock_rtl.v:21" *)
  DFFRE Q_full_speed_dffre_inst (
  .D(q_full_speed_int),
	.R(1'b1),
	.E(1'b1),
	.C(CLK_clk_buf),
	.Q(Q_full_speed_dff));

  (* src = "fabric_clock_rtl.v:25" *)
  DFFRE q_half_speed_int_dffre_inst (
  .D(D_half_speed_i_buf),
	.R(1'b1),
	.E(1'b1),
	.C(half_clk_clk_buf),
	.Q(q_half_speed_int));

  (* src = "fabric_clock_rtl.v:26" *)
  DFFRE Q_half_speed_dffre_inst (
    .D(q_half_speed_int),
    .R(1'b1),
    .E(1'b1),
    .C(half_clk_clk_buf),
    .Q(Q_half_speed_dff));

  (* src = "fabric_clock_rtl.v:8" *)
  O_BUF Q_full_speed_o_buf_inst (
    .I(Q_full_speed_dff),
    .O(Q_full_speed));

  (* src = "fabric_clock_rtl.v:9" *)
  O_BUF Q_half_speed_o_buf_inst (
    .I(Q_half_speed_dff),
    .O(Q_half_speed));

endmodule
