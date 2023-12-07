// add_design_file_vhd_in_sv.sv
module add_design_file_vhd_in_sv(
    input logic clk, reset,
    input logic [1:0] a, b,
    output logic eq_w
);

logic s0, s1, eq;

// instantiate 1 bit comparator
vhdl_comparator eq_bit0 (.x(a[0]), .y(b[0]), .eq(s0));
vhdl_comparator eq_bit1 (.x(a[1]), .y(b[1]), .eq(s1));

always_ff @(posedge clk, posedge reset) begin
    if (reset)
        eq <= 0;
    else
        eq <= s0 & s1;
end

assign eq_w = eq;
endmodule