sed -i "s|//----- Default net type -----|\`timescale 1ns / 1ps|" $(find . -type f -name "fabric_comparator1BitVerilog_formal_random_top_tb.v")
sed -i "s|// ----- Shared inputs -------|    integer mismatch=0;|" $(find . -type f -name "fabric_comparator1BitVerilog_formal_random_top_tb.v")
sed -i "s|// ----- FPGA fabric instanciation -------|    wire eq;|" $(find . -type f -name "fabric_comparator1BitVerilog_formal_random_top_tb.v")
