`timescale 1ns/1ps

// `include "../../rtl/fifo.v"
// `include "../../rtl/pll.v"
// `include "../../rtl/puz_bank3.v"
// `include "../../rtl/sudoku.v"
// `include "../../rtl/sudoku_ans.v"
// `include "../../rtl/sudoku_bin2hex.v"
// `include "../../rtl/sudoku_check.v"
// `include "../../rtl/sudoku_core.v"
// `include "../../rtl/sudoku_hex2bin.v"
// `include "../../rtl/sudoku_mask.v"
// `include "../../rtl/sudoku_mask_stg2.v"
// `include "../../rtl/sudoku_partials.v"
// `include "../../rtl/sudoku_solution.v"

module sudoku_check_tb;

  reg  clk;
  reg  rst;
  wire [9:0] num_correct;
  wire [9:0] num_wrong;
  wire [31:0] cycles;

  sudoku_check sudoku_check_inst (
    .clk(clk),
    .rst(rst),
    .num_correct(num_correct),
    .num_wrong(num_wrong),
    .cycles(cycles)
  );

always #5  clk = ! clk ;

initial begin
    clk = 0;
    rst = 1;
    
    #20;
    rst = 0;

    #5000;
    $finish;
end

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,sudoku_check_tb);
end

endmodule 
