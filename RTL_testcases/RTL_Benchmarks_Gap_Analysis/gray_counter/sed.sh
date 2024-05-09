
sed -i "s|// 	wire \[0:0\] out\[1\]_gfpga;|    reg \[4:0\] counter=5'b00000;|" $(find . -type f -name "fabric_gray_counter_formal_random_top_tb.v")
sed -i "s|// 	wire \[0:0\] out\[2\]_gfpga;|    reg \[4:0\] counter_model=5'b00000;|" $(find . -type f -name "fabric_gray_counter_formal_random_top_tb.v")
sed -i "s|dumpvars(1|dumpvars(0|" $(find . -type f -name "fabric_gray_counter_formal_random_top_tb.v")
sed -i "s|clk_fm\[15\] = 1'b0|clk_fm\[15\] = clock0|" $(find . -type f -name "fabric_gray_counter_top_formal_verification.v")
sed -i "s|global_resetn_fm\[0\] = 1'b0|global_resetn_fm\[0\] = 1'b1|" $(find . -type f -name "fabric_gray_counter_top_formal_verification.v")
