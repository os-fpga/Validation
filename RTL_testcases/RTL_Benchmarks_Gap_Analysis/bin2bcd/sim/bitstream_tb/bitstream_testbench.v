
    for (integer i = 0; i <= 550; i = i + 1) begin
        bin = i;
        #10;
        
        display_and_check_result(bin, bcd_gfpga, calculate_expected_bcd(bin));
    end