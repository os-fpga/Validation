
sed -i "s|//----- Default net type -----|\`timescale 1ns / 1ps|" $(find . -type f -name "fabric_and2_or2_formal_random_top_tb.v")
sed -i "s|// ----- Default clock port is added here since benchmark does not contain one -------|    integer i=0;|" $(find . -type f -name "fabric_and2_or2_formal_random_top_tb.v")
sed -i "s|// ----- Shared inputs -------|    integer mismatch=0;|" $(find . -type f -name "fabric_and2_or2_formal_random_top_tb.v")
sed -i "s|// ----- FPGA fabric instanciation -------|    wire c;|" $(find . -type f -name "fabric_and2_or2_formal_random_top_tb.v")
sed -i "s|// ----- FPGA fabric outputs -------|    wire d;|" $(find . -type f -name "fabric_and2_or2_formal_random_top_tb.v")
