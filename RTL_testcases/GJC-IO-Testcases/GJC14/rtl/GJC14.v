//***********************************************************
// Functionality: Tri state buffer with inverted input data and
//                control signals
// Author:        Azfar  
//***********************************************************



module GJC14(
    input wire data_i,
    input wire ctrl_T,
    output wire data_o
);
        
    wire data_i_buf, ctrl_T_buf;
    wire data_i_buft, ctrl_T_buft;

    I_BUF data_buf (data_i,1'b1,data_i_buf);
    I_BUF ctrl_buf (ctrl_T,1'b1,ctrl_T_buf);
    O_BUFT buft_o (.I(data_i_buft), .T(ctrl_T_buft), .O(data_o));

    assign data_i_buft = ~data_i_buf;
    assign ctrl_T_buft = ~ctrl_T_buf;

endmodule