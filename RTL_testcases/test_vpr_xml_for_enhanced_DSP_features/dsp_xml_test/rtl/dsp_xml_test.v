module const0(const0);
output const0;
endmodule

module const1(const1);
output const1;
endmodule

module dsp_xml_test (
input [19:0] a,
input [17:0] b,
input reset,
output [37:0] z
);

wire const0_0, const0_1;
const0 foo0 (.const0(const0_0));
const0 foo1 (.const0(const0_1));

RS_DSP_MULT u0 (
    .a(a),
    .b(b),
    .z(z),
    .feedback(3'b0),
    .unsigned_a(const0_0),
    .unsigned_b(const0_1));
endmodule
