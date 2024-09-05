#!/bin/bash
design_name=$1

files=$(find . -type f -name "co_sim_${design_name}.v")

sed -i "s/'d0;/'d1;/" $files
sed -i "s/rst <= 1;/rst <= 1;\n\trepeat (2) @(negedge clk);/" $files
sed -i "s/rst <= 0;/rst <= 1;/" $files
