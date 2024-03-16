
module dff (
    input wire clk,
    input wire reset,
    input wire d,
    output reg q
);
    always @(posedge clk or negedge reset) begin
      if (!reset)
        q <= 0;
      else
        q <= d;
    end
endmodule

module dffn (
    input wire clk,
    input wire reset,
    input wire d,
    output reg q
);
    always @(negedge clk or negedge reset) begin
      if (!reset)
        q <= 0;
      else
        q <= ~d;
    end
endmodule

module mux2_1 (
    input wire a,
    input wire b,
    input wire select,
    output reg out
);
    always @(*) begin
        if (select == 0)
            out = a;
        else
            out = b;
    end
endmodule

module clocks__16 (
    input wire clk_0,
    input wire clk_1,
    input wire clk_2,
    input wire clk_3,
    input wire clk_4,
    input wire clk_5,
    input wire clk_6,
    input wire clk_7,
    input wire clk_8,
    input wire clk_9,
    input wire clk_10,
    input wire clk_11,
    input wire clk_12,
    input wire clk_13,
    input wire clk_14,
    input wire clk_15,
    input wire [15:0] d,
    input wire select, reset,
    output reg [15:0] q,
    output reg [15:0] qn
);

    reg [15:0] dff_out;
    reg [15:0] dffn_out;

    dff dff_inst0 (.clk(clk_0),.reset(reset),.d(d[0]),.q(dff_out[0]));
    dff dff_inst1 (.clk(clk_1),.reset(reset),.d(d[1]),.q(dff_out[1]));
    dff dff_inst2 (.clk(clk_2),.reset(reset),.d(d[2]),.q(dff_out[2]));
    dff dff_inst3 (.clk(clk_3),.reset(reset),.d(d[3]),.q(dff_out[3]));
    dff dff_inst4 (.clk(clk_4),.reset(reset),.d(d[4]),.q(dff_out[4]));
    dff dff_inst5 (.clk(clk_5),.reset(reset),.d(d[5]),.q(dff_out[5]));
    dff dff_inst6 (.clk(clk_6),.reset(reset),.d(d[6]),.q(dff_out[6]));
    dff dff_inst7 (.clk(clk_7),.reset(reset),.d(d[7]),.q(dff_out[7]));
    dff dff_inst8 (.clk(clk_8),.reset(reset),.d(d[8]),.q(dff_out[8]));
    dff dff_inst9 (.clk(clk_9),.reset(reset),.d(d[9]),.q(dff_out[9]));
    dff dff_inst10 (.clk(clk_10),.reset(reset),.d(d[10]),.q(dff_out[10]));
    dff dff_inst11 (.clk(clk_11),.reset(reset),.d(d[11]),.q(dff_out[11]));
    dff dff_inst12 (.clk(clk_12),.reset(reset),.d(d[12]),.q(dff_out[12]));
    dff dff_inst13 (.clk(clk_13),.reset(reset),.d(d[13]),.q(dff_out[13]));
    dff dff_inst14 (.clk(clk_14),.reset(reset),.d(d[14]),.q(dff_out[14]));
    dff dff_inst15 (.clk(clk_15),.reset(reset),.d(d[15]),.q(dff_out[15]));

    dffn dffn_inst0 (.clk(clk_0),.reset(reset),.d(d[0]),.q(dffn_out[0]));
    dffn dffn_inst1 (.clk(clk_1),.reset(reset),.d(d[1]),.q(dffn_out[1]));
    dffn dffn_inst2 (.clk(clk_2),.reset(reset),.d(d[2]),.q(dffn_out[2]));
    dffn dffn_inst3 (.clk(clk_3),.reset(reset),.d(d[3]),.q(dffn_out[3]));
    dffn dffn_inst4 (.clk(clk_4),.reset(reset),.d(d[4]),.q(dffn_out[4]));
    dffn dffn_inst5 (.clk(clk_5),.reset(reset),.d(d[5]),.q(dffn_out[5]));
    dffn dffn_inst6 (.clk(clk_6),.reset(reset),.d(d[6]),.q(dffn_out[6]));
    dffn dffn_inst7 (.clk(clk_7),.reset(reset),.d(d[7]),.q(dffn_out[7]));
    dffn dffn_inst8 (.clk(clk_8),.reset(reset),.d(d[8]),.q(dffn_out[8]));
    dffn dffn_inst9 (.clk(clk_9),.reset(reset),.d(d[9]),.q(dffn_out[9]));
    dffn dffn_inst10 (.clk(clk_10),.reset(reset),.d(d[10]),.q(dffn_out[10]));
    dffn dffn_inst11 (.clk(clk_11),.reset(reset),.d(d[11]),.q(dffn_out[11]));
    dffn dffn_inst12 (.clk(clk_12),.reset(reset),.d(d[12]),.q(dffn_out[12]));
    dffn dffn_inst13 (.clk(clk_13),.reset(reset),.d(d[13]),.q(dffn_out[13]));
    dffn dffn_inst14 (.clk(clk_14),.reset(reset),.d(d[14]),.q(dffn_out[14]));
    dffn dffn_inst15 (.clk(clk_15),.reset(reset),.d(d[15]),.q(dffn_out[15]));

    generate
        genvar k;
        for (k = 0; k < 16; k = k + 1) begin : mux_inst
            mux2_1 mux_inst (.a(dff_out[k]),.b(dffn_out[k]),.select(select),.out(q[k]));
        end
    endgenerate

    assign qn = ~q;

endmodule
