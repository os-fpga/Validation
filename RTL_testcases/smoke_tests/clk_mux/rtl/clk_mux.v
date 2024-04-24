// ***********************************************
// Created by: Zaheer Ahmad
// Organization: RapidSilicon
// ***********************************************

module clk_mux #(parameter WIDTH=32) (
    input clk,
    input clk_sel,
    input rst,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out);

    wire ck;

    assign ck = clk_sel ? clk : ~clk;

    always@(posedge ck)
    begin 
        if(rst)
            data_out<=0;
        else
            data_out<=data_in;
    end

endmodule


