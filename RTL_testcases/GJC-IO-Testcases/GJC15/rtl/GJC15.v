//***********************************************************
// Functionality: Tri state differential output buffer with 
//                inverted input data and control signals
// Author:        Azfar  
//***********************************************************



module GJC15(
    input wire data_i,
    input wire ctrl_T,
    output wire data_o_P,
    output wire data_o_N
);

    wire data_i_buf, data_i_buft;
    wire ctrl_T_buf, ctrl_T_buft;
    I_BUF data_i_buf_ (data_i,1'b1,data_i_buf);
    I_BUF ctrl_T_buf_ (ctrl_T,1'b1,ctrl_T_buf);

    O_BUFT_DS data_o_buff (data_i_buft,ctrl_T_buft,data_o_P,data_o_N);
    
    assign data_i_buft = ~data_i_buf;
    assign ctrl_T_buft = ~ctrl_T_buf;

endmodule