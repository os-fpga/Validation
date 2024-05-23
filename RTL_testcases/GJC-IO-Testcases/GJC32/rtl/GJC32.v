//***********************************************************
// Functionality: Recieves 2-bit parallel SDR data on posedge  
//                of clock, store it in flops for one cycle and
//                then transmit it in DDR mode
// Author:        Azfar  
//***********************************************************



module GJC32 (
    input   wire [1:0] data_i_buf,
    input   wire reset_n_buf,
    input   wire enable_buf,
    input   wire clk_i_buf,
    input   wire dly_inc_pulse_inv_buf,
    output  wire data_o
);

    reg [1:0] data_reg=0;
    wire data_o_buf, data_o_delayed;
    reg dly_ld=0;
    wire dly_adj, dly_incdec;
    wire reset_n;
    wire enable;
    wire clk_i,clk_buf_i,clk_pll;
    wire dly_inc_pulse_inv;
    wire  [1:0] data_i;
    wire const1;

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf0_ (reset_n_buf,const1,reset_n);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf1_ (enable_buf,const1,enable);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf2_ (clk_i_buf,const1,clk_buf_i);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_ (dly_inc_pulse_inv_buf,const1,dly_inc_pulse_inv);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf4_ (data_i_buf[0],const1,data_i[0]);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf5_ (data_i_buf[1],const1,data_i[1]);

    assign const1 = 1;

    CLK_BUF clock_buffer (clk_buf_i,clk_pll);

    PLL #(.PLL_MULT(40), .PLL_DIV(1), .PLL_POST_DIV(2)) clk_pll_gen (
        .PLL_EN(const1), // PLL Enable
        .CLK_IN(clk_pll), // Clock input
        .CLK_OUT_DIV4(clk_i)
        );

    assign dly_adj    = ~dly_inc_pulse_inv;
    assign dly_incdec = ~dly_inc_pulse_inv;

    O_BUF ddr_buf (data_o_buf,data_o);
    O_DELAY data_o_delay (  .I(data_o_delayed), 
                            .DLY_LOAD(dly_ld), 
                            .DLY_ADJ(dly_adj), 
                            .DLY_INCDEC(dly_incdec), 
                            .CLK_IN(clk_i), 
                            .O(data_o_buf));
    O_DDR data_o_ddr (data_reg,reset_n,enable,clk_i,data_o_delayed);

    always @(posedge clk_i) begin
        if(!reset_n) begin
            data_reg <= 0;
            dly_ld   <= 1;
        end else if(enable) begin
            data_reg[0] <= data_i[0];
            data_reg[1] <= data_i[1];
            dly_ld      <= 0;
        end
    end
endmodule
