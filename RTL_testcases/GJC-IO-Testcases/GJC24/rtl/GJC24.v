//***********************************************************
// Functionality: Recieves 2-bit parallel SDR data on posedge  
//                of clock, store it in flops for one cycle and
//                then transmit it in DDR mode
// Author:        Azfar  
//***********************************************************



module GJC24 (
    input   wire [1:0] data_i,
    input   wire reset_n,
    input   wire enable,
    input   wire clk_i,
    output  wire data_o_p,
    output  wire data_o_n
);

    reg [1:0] data_reg;
    wire data_o_buf;
    wire clk_buf_i;
    wire const1;
    wire [1:0] data_i_buf;
    wire reset_n_buf;
    wire enable_buf;
    wire clk_i_buf;

    assign const1 = 1;

    I_BUF buf0_ (data_i[0], const1 ,data_i_buf[0]);
    I_BUF buf1_ (data_i[1], const1 ,data_i_buf[1]);
    I_BUF buf2_ (reset_n, const1 ,reset_n_buf);
    I_BUF buf3_ (enable, const1 ,enable_buf);
    I_BUF buf4_ (clk_i, const1 ,clk_i_buf);

    CLK_BUF clock_buffer (clk_i_buf, clk_buf_i);

    O_BUF_DS ddr_buf (.I(data_o_buf), .O_P(data_o_p), .O_N(data_o_n));
    
    O_DDR data_o_ddr (data_reg,reset_n_buf,enable_buf,clk_buf_i,data_o_buf);

    always @(posedge clk_buf_i or negedge reset_n_buf) begin
        if(!reset_n_buf) data_reg <= 0;
        else if(enable_buf) begin
            data_reg[0] <= data_i_buf[0];
            data_reg[1] <= data_i_buf[1];
        end
    end
endmodule