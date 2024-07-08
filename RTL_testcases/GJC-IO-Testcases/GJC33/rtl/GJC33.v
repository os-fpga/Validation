//***********************************************************
// Functionality: Flip FLop design with boot clk as pll source
// Author:        Azfar 
//***********************************************************


module GJC33 (
    input   wire data_i,
    input   wire enable,
    output  wire data_o
);
    wire const1;
    wire clk_design;
    wire clk_pll_in;
    wire data_design;
    wire enable_design;
    reg  data_o_design=0;

    assign const1 = 1;

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) data_i_buffer (.I(data_i), .EN(const1), .O(data_design));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) enable_buffer (.I(enable), .EN(const1), .O(enable_design));
    O_BUF data_o_buffer (.I(data_o_design), .O(data_o));


    BOOT_CLOCK internal_osc (clk_pll_in);

    PLL #(.PLL_MULT(40), .PLL_DIV(1), .PLL_POST_DIV(50)) clk_pll_gen (
        .PLL_EN(const1), // PLL Enable
        .CLK_IN(clk_pll_in), // Clock input
        .CLK_OUT_DIV4(clk_design)
        );


    always @(posedge clk_design) begin
        if(enable_design)data_o_design <= data_design;
    end

endmodule