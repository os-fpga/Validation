//***********************************************************
// Functionality: Recieves 2-bit DDR format data on posedge  
//                and negedge of clock, store it in flops for
//                one cycle and then transmit it in SDR mode
//                on two output lanes
// Author:        Azfar  
//***********************************************************



module GJC31 (
    input   wire data_i,
    input   wire reset_n_buf,
    input   wire enable_buf,
    input   wire clk_i_buf,
    input   wire dly_inc_pulse_inv_buf,
    output  wire [1:0] data_o_buf
);

    wire [1:0] data_reg;
    wire data_i_buf, data_i_buf_delayed;
    reg dly_ld=0;
    wire dly_adj, dly_incdec;
    wire reset_n;
    wire enable;
    wire clk_i,clk_buf_i,clk_pll;
    wire dly_inc_pulse_inv;
    reg  [1:0] data_o=0;
    wire const1;

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf0_ (reset_n_buf,const1,reset_n);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf1_ (enable_buf,const1,enable);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf2_ (clk_i_buf,const1,clk_buf_i);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_ (dly_inc_pulse_inv_buf,const1,dly_inc_pulse_inv);
    O_BUF obuf0_ (data_o[0], data_o_buf[0]);
    O_BUF obuf1_ (data_o[1], data_o_buf[1]);

    assign const1 = 1;

    CLK_BUF clock_buffer (clk_buf_i,clk_pll);

    PLL #(.PLL_MULT(100), .PLL_DIV(32), .PLL_POST_DIV(17)) clk_pll_gen (
        .PLL_EN(const1), // PLL Enable
        .CLK_IN(clk_pll), // Clock input
        .CLK_OUT_DIV4(clk_i)
        );

    assign dly_adj    = ~dly_inc_pulse_inv;
    assign dly_incdec = ~dly_inc_pulse_inv;

    I_BUF data_buf (data_i,enable,data_i_buf);
    I_DELAY data_i_delay (  .I(data_i_buf),
                            .DLY_LOAD(dly_ld),
                            .DLY_ADJ(dly_adj),
                            .DLY_INCDEC(dly_incdec),
                            .CLK_IN(clk_i),
                            .O(data_i_buf_delayed));
    I_DDR data_i_ddr (data_i_buf_delayed, reset_n, enable, clk_i, data_reg);

    always @(posedge clk_i) begin
        if(!reset_n) begin
            data_o <= 0;
            dly_ld <= 1;
        end else if(enable) begin
            data_o[0] <= data_reg[0];
            data_o[1] <= data_reg[1];
            dly_ld    <= 0;
        end
    end

endmodule