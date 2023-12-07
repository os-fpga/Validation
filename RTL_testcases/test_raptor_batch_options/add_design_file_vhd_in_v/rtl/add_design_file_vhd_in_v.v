// add_design_file_vhd_in_v.v
module add_design_file_vhd_in_v(
    input wire[1:0] a, b,
    output wire eq
);

wire s0, s1;

// instantiate 1 bit comparator
vhdl_comparator eq_bit0 (.x(a[0]), .y(b[0]), .eq(s0));
vhdl_comparator eq_bit1 (.x(a[1]), .y(b[1]), .eq(s1));

assign eq = s0 & s1;
endmodule