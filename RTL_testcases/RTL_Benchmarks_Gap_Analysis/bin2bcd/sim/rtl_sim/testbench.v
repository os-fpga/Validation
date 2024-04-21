`timescale 1ns / 1ps
`include "../../rtl/bin2bcd.v"

module tb_bin2bcd;

    reg [7:0] bin;

    wire [11:0] bcd;

	integer mismatch=0;

    bin2bcd uut (
        .bin(bin),
        .bcd(bcd)
    );

    function [11:0] calculate_expected_bcd;
        input [7:0] binary_value;
        reg [11:0] result;
        reg [3:0] digit;
        integer i;
        begin
            result = 0;
            for (i = 0; i < 8; i = i+1)
            begin
                result = {result[10:0],bin[7-i]};
                    
                //if a hex digit of 'result' is more than 4, add 3 to it.  
                if(i < 7 && result[3:0] > 4) 
                    result[3:0] = result[3:0] + 3;
                if(i < 7 && result[7:4] > 4)
                    result[7:4] = result[7:4] + 3;
                if(i < 7 && result[11:8] > 4)
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

    initial begin
        integer i;

        for (i = 0; i <= 550; i = i + 1) begin
            bin = i;
            #10;
            
            display_and_check_result(bin, bcd, calculate_expected_bcd(bin));
        end

        #10;
        $finish;
    end

    initial begin
		$dumpfile("bin2bcd.vcd");
		$dumpvars(0, tb_bin2bcd);
	end

endmodule
