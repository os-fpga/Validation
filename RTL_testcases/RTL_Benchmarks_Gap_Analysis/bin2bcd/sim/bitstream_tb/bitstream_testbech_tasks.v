    function [11:0] calculate_expected_bcd;
    input [7:0] binary_value;
    reg [11:0] result;
    reg [3:0] digit;
    integer i;
    begin

        result = 12'd0;
    
        for (i = 7; i >= 0; i = i - 1) begin
            result = {result[10:0], bin[i]};

            if (result[3:0] >= 5)
                result[3:0] = result[3:0] + 3;
            if (result[7:4] >= 5)
                result[7:4] = result[7:4] + 3;
            if (result[11:8] >= 5)
                result[11:8] = result[11:8] + 3;
        end
        calculate_expected_bcd = result;
    end
    endfunction

    task display_and_check_result;
    input [7:0] bin_value;
    input [11:0] bcd_value;
    input [11:0] expected_bcd_value;
    begin
        if (bcd_value == expected_bcd_value) begin
            $display("Status: Test Passed - Binary: %d, BCD: %b, Expected BCD: %b", bin_value, bcd_value, expected_bcd_value);
        end else begin
            $display("Status: Test Failed - Binary: %d, BCD: %b, Expected BCD: %b", bin_value, bcd_value, expected_bcd_value);
            mismatch = mismatch + 1;
        end
    end
    endtask