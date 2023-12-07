module DualClockFlipFlops_set_min_max_delay_sdc_test(
    input wire clk1,
    input wire clk2,
    input wire reset,
    input wire data_input,
    output q_output
);

    reg q1, q2;
    always @(posedge clk1 or posedge reset) begin
        if (reset)
            q1 <= 1'b0;
        else
            q1 <= data_input;
    end

    always @(posedge clk2 or posedge reset) begin
        if (reset)
            q2 <= 1'b0;
        else
            q2 <= q1;
    end

    assign q_output = q2;
     
endmodule     