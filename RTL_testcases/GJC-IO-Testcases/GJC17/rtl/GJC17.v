//***********************************************************
// Functionality: Recieves 2-bit DDR format data on posedge  
//                and negedge of clock, store it in flops for
//                one cycle and then transmit it in SDR mode
//                on two output lanes
// Author:        Azfar  
//***********************************************************



module GJC17 (
    input   wire data_i,
    input   wire reset_n_buf,
    input   wire enable_buf,
    input   wire clk_i_buf,
    output  wire  [1:0] data_o_buf
);

    wire [1:0] data_reg;
    wire data_i_buf;
    wire const1;
    wire clk_buf_i;
    wire reset_n;
    wire enable;
    wire clk_i;
    reg [1:0] data_o;

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf0_ (reset_n_buf,const1,reset_n);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf1_ (enable_buf,const1,enable);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf1_ (clk_i_buf,const1,clk_i);
    O_BUF obuf0_ (data_o[0],data_o_buf[0]);
    O_BUF obuf1_ (data_o[1],data_o_buf[1]);

    assign const1 = 1;

    CLK_BUF clock_buffer (clk_i, clk_buf_i);

    I_BUF #(.WEAK_KEEPER("PULLDOWN")) data_buf (data_i,const1,data_i_buf);

    I_DDR data_i_ddr (data_i_buf, reset_n, enable, clk_buf_i, data_reg);

    always @(posedge clk_buf_i or negedge reset_n) begin
        if(!reset_n) data_o <= 0;
        else if(enable) begin
            data_o[0] <= data_reg[0];
            data_o[1] <= data_reg[1];
        end
    end

endmodule