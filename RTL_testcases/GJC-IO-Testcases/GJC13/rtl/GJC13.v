//***********************************************************
// Functionality: Flip FLop design with clk pin constrained 
//                to CCRIO pad 
// Author:        Azfar 
//***********************************************************


module GJC13(
    input   wire data_i,
    input   wire clk,
    input   wire enable,
    output  wire data_o
);
    wire const1;
    wire clk_buf;
    wire clk_design;
    wire data_design;
    wire enable_design;
    reg  data_o_design;

    assign const1 = 1;

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) clock_input_buffer (.I(clk), .EN(const1), .O(clk_buf));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) data_i_buffer (.I(data_i), .EN(const1), .O(data_design));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) enable_buffer (.I(enable), .EN(const1), .O(enable_design));
    O_BUF data_o_buffer (.I(data_o_design), .O(data_o));
    CLK_BUF clock_buffer (.I(clk_buf), .O(clk_design));
    
    always @(posedge clk_design) begin
        if(enable_design)data_o_design <= data_design;
    end

endmodule