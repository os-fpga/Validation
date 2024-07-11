//***********************************************************
// Functionality: Flip FLop design with boot clk as pll source
// Author:        Azfar 
//***********************************************************


module GJC34 (
    input   wire [3:0] data_i,
    input   wire [3:0] enable,
    output  wire [3:0] data_o
);
    wire const1;
    wire clk_design0, clk_design1, clk_design2, clk_design3;
    wire clk_pll_in;
    wire [3:0] data_design;
    wire [3:0] enable_design;
    reg  [3:0] data_o_design=0;

    assign const1 = 1;

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) data_i_buffer0 (.I(data_i[0]), .EN(const1), .O(data_design[0]));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) enable_buffer0 (.I(enable[0]), .EN(const1), .O(enable_design[0]));
    O_BUF data_o_buffer0 (.I(data_o_design[0]), .O(data_o[0]));

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) data_i_buffer1 (.I(data_i[1]), .EN(const1), .O(data_design[1]));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) enable_buffer1 (.I(enable[1]), .EN(const1), .O(enable_design[1]));
    O_BUF data_o_buffer1 (.I(data_o_design[1]), .O(data_o[1]));

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) data_i_buffer2 (.I(data_i[2]), .EN(const1), .O(data_design[2]));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) enable_buffer2 (.I(enable[2]), .EN(const1), .O(enable_design[2]));
    O_BUF data_o_buffer2 (.I(data_o_design[2]), .O(data_o[2]));

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) data_i_buffer3 (.I(data_i[3]), .EN(const1), .O(data_design[3]));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) enable_buffer3 (.I(enable[3]), .EN(const1), .O(enable_design[3]));
    O_BUF data_o_buffer3 (.I(data_o_design[3]), .O(data_o[3]));


    BOOT_CLOCK internal_osc (clk_pll_in);

    PLL #(.PLL_MULT(40), .PLL_DIV(1), .PLL_POST_DIV(17)) clk_pll_gen (
        .PLL_EN(const1), // PLL Enable
        .CLK_IN(clk_pll_in), // Clock input
        .CLK_OUT(clk_design0),
        .CLK_OUT_DIV2(clk_design1),
        .CLK_OUT_DIV3(clk_design2),
        .CLK_OUT_DIV4(clk_design3)
        );


    always @(posedge clk_design0) begin
        if(enable_design[0])data_o_design[0] <= data_design[0];
    end

    always @(posedge clk_design1) begin
        if(enable_design[1])data_o_design[1] <= data_design[1];
    end

    always @(posedge clk_design2) begin
        if(enable_design[2])data_o_design[2] <= data_design[2];
    end

    always @(posedge clk_design3) begin
        if(enable_design[3])data_o_design[3] <= data_design[3];
    end

endmodule