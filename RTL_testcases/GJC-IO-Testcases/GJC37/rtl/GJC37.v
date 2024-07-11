//***********************************************************
// Functionality: counter sending its count value out through o_serdes
//                using a pll clock dividers 
// Author:        Azfar 
//***********************************************************


module GJC37 (
    input  wire  reset, // asynchronous active high
    input  wire  enable_n, // active low enable
    output wire  data_o
);
    parameter WIDTH = 3;

   reg [WIDTH - 1:0] counter;
   wire clk_pll_in;
   wire const1;
   wire pll_clk;
   wire pll_clk_div3;
   wire pll_lock;
   wire reset_buf, reset_buf_n;
   wire enable_buf_n,enable_buf;
   wire buf_output_enable;
   wire delay_in;
   wire delay_out;

   assign const1 = 1;
   assign reset_buf_n = ~reset_buf;
   assign enable_buf  = ~enable_buf_n;




   I_BUF #(.WEAK_KEEPER("PULLDOWN")) reset_buffer0 (.I(reset),   .EN(const1), .O(reset_buf));
   I_BUF #(.WEAK_KEEPER("PULLUP")) enable_buffer0 (.I(enable_n), .EN(const1), .O(enable_buf_n));

   BOOT_CLOCK internal_osc (clk_pll_in);
   
   PLL #(.PLL_MULT(40), .PLL_DIV(1), .PLL_POST_DIV(17)) clk_pll_gen0 (
        .PLL_EN(const1), // PLL Enable
        .CLK_IN(clk_pll_in), // Clock input
        .CLK_OUT(pll_clk),
        .CLK_OUT_DIV3(pll_clk_div3),
        .LOCK(pll_lock)
    );

    O_SERDES #(
        .DATA_RATE("SDR"), // Single or double data rate (SDR/DDR)
        .WIDTH(WIDTH) // Width of input data to serializer (3-10)
    ) counter_o_serdes (
        .D(counter), // D input bus
        .RST(reset_buf_n), // Active-low, asynchronous reset
        .DATA_VALID(enable_buf), // Load word input
        .CLK_IN(pll_clk_div3), // Fabric clock input
        .OE_IN(enable_buf), // Output tri-state enable input
        .OE_OUT(buf_output_enable), // Output tri-state enable output (conttect to O_BUFT or inferred tri-state signal)
        .Q(delay_in), // Data output (Connect to output port, buffer or O_DELAY)
        .PLL_LOCK(pll_lock), // PLL lock input
        .PLL_CLK(pll_clk) // PLL clock input
    );

    O_DELAY #(
        .DELAY(0) // TAP delay value (0-63)
    ) counter_o_delay (
        .I(delay_in), // Data input
        .DLY_LOAD(~const1), // Delay load input
        .DLY_ADJ(~const1), // Delay adjust input
        .DLY_INCDEC(~const1), // Delay increment / decrement input
        .CLK_IN(pll_clk), // Clock input
        .O(delay_out) // Data output
    );

    O_BUFT counter_o_buft (
        .I(delay_out), // Data input
        .T(buf_output_enable), // Tri-state output
        .O(data_o) // Data output (connect to top-level port)
    );


    always @(posedge pll_clk_div3 or negedge reset_buf_n) begin
        if(!reset_buf_n)counter <= 0;
        else if(enable_buf) counter <= counter + 1;
    end


endmodule