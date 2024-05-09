//***********************************************************
// Functionality: Inverter with differential input and differential
//                output
// Author:        Azfar 
//***********************************************************


module GJC12 (
    input   wire in_P,
    input   wire in_N,
    output  wire out_P,
    output  wire out_N
);
    wire interconnect_in,interconnect_out;

    assign interconnect_out = ~interconnect_in;

    I_BUF_DS DATA_INPUT_BUFFER (.I_P(in_P), .I_N(in_N), .EN(1'b1), .O(interconnect_in));

    O_BUF_DS DATA_OUT_BUFFER (.I(interconnect_out), .O_P(out_P), .O_N(out_N));
    
endmodule