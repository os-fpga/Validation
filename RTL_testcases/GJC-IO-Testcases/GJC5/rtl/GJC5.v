`timescale 1ns/1ps
//  This is an example RTL code to infer an internal fabric clock (divide by 2)

module GJC5 (
  input D_full_speed,
  input D_half_speed,
  input CLK,
  output reg Q_full_speed = 1'b0,
  output reg Q_half_speed = 1'b0
);

  reg half_clk = 1'b0;
  reg q_full_speed_int = 1'b0;
  reg q_half_speed_int = 1'b0;

  always @(posedge CLK)
    half_clk <= ~half_clk;

  always @(posedge CLK) begin
    q_full_speed_int <= D_full_speed;
    Q_full_speed <= q_full_speed_int;
  end

  always @(posedge half_clk) begin
    q_half_speed_int <= D_half_speed;
    Q_half_speed <= q_half_speed_int;
  end

endmodule