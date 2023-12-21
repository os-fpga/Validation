module set_disable_timing_sdc_test (
    input wire clk,
    input wire reset,
    output wire q
);

reg [7:0] counter = 8'b0;

always @(posedge clk or posedge reset) begin
    if (reset)
        counter <= 8'b0;
    else
        counter <= counter + 1;
end

assign q = counter[7];

endmodule  