`include "../../rtl/signed_multiply_accumulate.v"

`timescale 1ns / 1ps

module signed_multiply_accumulate_tb;

  // Parameters
  localparam  WIDTH = 8;

  //Ports
  reg  clk;
  reg  clear;
  reg  clken;
  reg  sload;
  reg signed [WIDTH-1:0] dataa;
  reg signed [WIDTH-1:0] datab;
  wire [2*WIDTH-1:0] adder_out;

  signed_multiply_accumulate # (
    .WIDTH(WIDTH)
  )
  signed_multiply_accumulate_inst (
    .clk(clk),
    .clear(clear),
    .clken(clken),
    .sload(sload),
    .dataa(dataa),
    .datab(datab),
    .adder_out(adder_out)
  );

  always #5  clk = ! clk ;

  initial begin
    clk <= 0;
    clear <= 1;
    clken <= 0;
    sload <= 1;
    dataa <= 0;
    datab <= 0;

    repeat(10)@(negedge clk);
    clear <= 0;
    repeat(5)@(negedge clk);
    sload <= 0;
    repeat(5)@(negedge clk);
    clken <= 1;


    repeat(100)@(negedge clk) begin
        dataa <= $random();
        datab <= $random();
    end

    #10;
    $finish;

  end

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, signed_multiply_accumulate_tb);
end

endmodule