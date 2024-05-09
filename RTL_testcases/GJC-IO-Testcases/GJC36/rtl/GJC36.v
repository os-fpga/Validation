//***********************************************************
// Functionality: Flip FLop design with boot clk as pll source
// Author:        Azfar 
//***********************************************************


module GJC36 (
    input   wire [7:0] data_i,
    input   wire [7:0] enable,
    output  wire [7:0] data_o
);
    wire const1;
    wire clk_design0, clk_design1, clk_design2, clk_design3;
    wire clk_design4, clk_design5, clk_design6, clk_design7;
    wire clk_pll_in;
    wire [7:0] data_design;
    wire [7:0] enable_design;
    reg  [7:0] data_o_design;

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

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) data_i_buffer4 (.I(data_i[4]), .EN(const1), .O(data_design[4]));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) enable_buffer4 (.I(enable[4]), .EN(const1), .O(enable_design[4]));
    O_BUF data_o_buffer4 (.I(data_o_design[4]), .O(data_o[4]));

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) data_i_buffer5 (.I(data_i[5]), .EN(const1), .O(data_design[5]));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) enable_buffer5 (.I(enable[5]), .EN(const1), .O(enable_design[5]));
    O_BUF data_o_buffer5 (.I(data_o_design[5]), .O(data_o[5]));

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) data_i_buffer6 (.I(data_i[6]), .EN(const1), .O(data_design[6]));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) enable_buffer6 (.I(enable[6]), .EN(const1), .O(enable_design[6]));
    O_BUF data_o_buffer6 (.I(data_o_design[6]), .O(data_o[6]));

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) data_i_buffer7 (.I(data_i[7]), .EN(const1), .O(data_design[7]));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) enable_buffer7 (.I(enable[7]), .EN(const1), .O(enable_design[7]));
    O_BUF data_o_buffer7 (.I(data_o_design[7]), .O(data_o[7]));


    BOOT_CLOCK internal_osc (clk_pll_in);

    PLL #(.PLL_MULT(40), .PLL_DIV(1), .PLL_POST_DIV(2)) clk_pll_gen0 (
        .PLL_EN(const1), // PLL Enable
        .CLK_IN(clk_pll_in), // Clock input
        .CLK_OUT(clk_design0),
        .CLK_OUT_DIV2(clk_design1),
        .CLK_OUT_DIV3(clk_design2),
        .CLK_OUT_DIV4(clk_design3)
        );

    PLL #(.PLL_MULT(46), .PLL_DIV(1), .PLL_POST_DIV(2)) clk_pll_gen1 (
        .PLL_EN(const1), // PLL Enable
        .CLK_IN(clk_pll_in), // Clock input
        .CLK_OUT(clk_design4),
        .CLK_OUT_DIV2(clk_design5),
        .CLK_OUT_DIV3(clk_design6),
        .CLK_OUT_DIV4(clk_design7)
        );


    always @(negedge clk_design0) begin
        if(enable_design[0])data_o_design[0] <= data_design[0];
    end

    always @(negedge clk_design1) begin
        if(enable_design[1])data_o_design[1] <= data_design[1];
    end

    always @(negedge clk_design2) begin
        if(enable_design[2])data_o_design[2] <= data_design[2];
    end

    always @(negedge clk_design3) begin
        if(enable_design[3])data_o_design[3] <= data_design[3];
    end

    always @(negedge clk_design4) begin
        if(enable_design[4])data_o_design[4] <= data_design[4];
    end

    always @(negedge clk_design5) begin
        if(enable_design[5])data_o_design[5] <= data_design[5];
    end

    always @(negedge clk_design6) begin
        if(enable_design[6])data_o_design[6] <= data_design[6];
    end

    always @(negedge clk_design7) begin
        if(enable_design[7])data_o_design[7] <= data_design[7];
    end

endmodule