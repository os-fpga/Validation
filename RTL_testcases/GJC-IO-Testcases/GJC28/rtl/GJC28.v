//***********************************************************
// Functionality: Alternating 10 generated is delayed and sent out,
//                also a non delayed version of same data is sent
//                out for reference. Using inverted control signals,
//                delay can be adjusted accordingly
// Author:        Azfar  
//***********************************************************



module GJC28 (
    input wire clk_i_buf,
    input wire dly_incdec_buf,
    input wire dly_ld_buf,
    input wire dly_adj_buf,
    output wire data_o_delayed_p,
    output wire data_o_delayed_n,
    output wire data_o_ref_buf,
    output wire [5:0] dly_tap_val_inv_buf
);

    reg test_data;
    wire dly_adj_inv, dly_incdec_inv, dly_ld_inv;
    wire data_o_delayed_buf;
    wire [5:0] dly_tap_val;
    wire clk_buf_i;
    wire clk_i;
    wire dly_incdec;
    wire dly_ld;
    wire dly_adj;
    wire const1;
    wire data_o_ref;
    wire [5:0] dly_tap_val_inv;

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf0_ (clk_i_buf,const1,clk_i);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf1_ (dly_incdec_buf,const1,dly_incdec);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf2_ (dly_ld_buf,const1,dly_ld);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_ (dly_adj_buf,const1,dly_adj);
    O_BUF obuf00_ (data_o_ref,data_o_ref_buf);
    O_BUF obuf0_ (dly_tap_val_inv[0], dly_tap_val_inv_buf[0]);
    O_BUF obuf1_ (dly_tap_val_inv[1], dly_tap_val_inv_buf[1]);
    O_BUF obuf2_ (dly_tap_val_inv[2], dly_tap_val_inv_buf[2]);
    O_BUF obuf3_ (dly_tap_val_inv[3], dly_tap_val_inv_buf[3]);
    O_BUF obuf4_ (dly_tap_val_inv[4], dly_tap_val_inv_buf[4]);
    O_BUF obuf4_ (dly_tap_val_inv[5], dly_tap_val_inv_buf[5]);

    assign const1 = 1;

    CLK_BUF clock_buffer (clk_i,clk_buf_i);

    always @(clk_buf_i) begin
        if(clk_buf_i)test_data <= 1;
        else test_data <= 0;
    end
    assign data_o_ref       = test_data;
    assign dly_adj_inv      = ~dly_adj;
    assign dly_incdec_inv   = ~dly_incdec;
    assign dly_ld_inv       = ~dly_ld;
    assign dly_tap_val_inv  = ~dly_tap_val;

    O_BUF_DS data_buf (.I(data_o_delayed_buf),.O_P(data_o_delayed_p),.O_N(data_o_delayed_n));
    O_DELAY data_o_delay (  .I(test_data), 
                            .DLY_LOAD(dly_ld_inv), 
                            .DLY_ADJ(dly_adj_inv), 
                            .DLY_INCDEC(dly_incdec_inv), 
                            .CLK_IN(clk_buf_i), 
                            .DLY_TAP_VALUE(dly_tap_val),
                            .O(data_o_delayed_buf));
endmodule