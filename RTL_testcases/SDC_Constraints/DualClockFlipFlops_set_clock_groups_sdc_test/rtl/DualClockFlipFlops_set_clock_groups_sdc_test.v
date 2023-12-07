module DualClockFlipFlops_set_clock_groups_sdc_test (
input wire clk1,
input wire clk2,
input wire reset,
output wire q1,
output wire q2
);

reg ff1, ff2;

always @(posedge clk1 or posedge reset) begin
if (reset)
    ff1 <= 1'b0;
else
    ff1 <= ~ff1;
end

always @(posedge clk2 or posedge reset) begin
if (reset)
    ff2 <= 1'b0;
else
    ff2 <= ~ff2;
end

assign q1 = ff1;
assign q2 = ff2;

endmodule