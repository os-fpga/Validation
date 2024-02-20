module primitive_example_design_7(haddr,burst,prot,size,trans,clk,reset,read_write,clear,addr,data_out,hresp,ready,a,b,hw,ibuf2_en,ibuf3_en,ibuf4_en,ibuf5_en,ibuf6_en,ibuf7_en,ibuf8_en,ibuf9_en,ibuf10_en,ibuf11_en,ibuf12_en,ibuf13_en,ibuf14_en);
    parameter DEPTH = 10;
    parameter WIDTH = 32;

    input [31:0] haddr;
    input [2:0] burst;
    input [3:0] prot;
    input [2:0] size;
    input [2:0] trans;
    
    input clk, reset, read_write, clear;
    input [DEPTH-1:0] addr;
    output reg [WIDTH-1:0] data_out;
    output hresp;
    output ready;

    input [WIDTH-1:0] a,b;
    input hw,ibuf2_en,ibuf3_en,ibuf4_en,ibuf5_en,ibuf6_en,ibuf7_en,ibuf8_en,ibuf9_en,ibuf10_en,ibuf11_en,ibuf12_en,ibuf13_en,ibuf14_en;

    wire [WIDTH-1:0] c;
    wire ready_o;
    wire hresp;
    reg hw_reg_out;
    reg [WIDTH-1:0] ram_data_in;
    wire [2:0] size_ibuf,burst_ibuf,trans_ibuf;
    wire [3:0] prot_ibuf;
    wire hresp_w,ready_w;

    reg [WIDTH-1:0] reg_array [2**DEPTH-1:0];

    SOC_FPGA_INTF_AHB_M inst (
        .HRESETN_I(reset),
        .HADDR(haddr),
        .HBURST(burst_ibuf),
        .HPROT(prot_ibuf),
        .HSIZE(size_ibuf),
        .HTRANS(trans_ibuf),
        .HWDATA(c),
        .HWWRITE(hw_reg_out),
        .HRDATA(ram_data_in),
        .HREADY(ready_o),
        .HRESP(hresp),
        .HCLK(clk)
    );

    assign c = a + b;

    register #(1) register_inst1 (.clk(clk),.d(hw),.rst(reset),.q(hw_reg_out));

    I_BUF ibuf_inst1 (.I(size[0]),.EN(ibuf2_en),.O(size_ibuf[0]));
    I_BUF ibuf_inst2 (.I(size[1]),.EN(ibuf3_en),.O(size_ibuf[1]));
    I_BUF ibuf_inst3 (.I(size[2]),.EN(ibuf4_en),.O(size_ibuf[2]));
    I_BUF ibuf_inst4 (.I(burst[0]),.EN(ibuf5_en),.O(burst_ibuf[0]));
    I_BUF ibuf_inst5 (.I(burst[1]),.EN(ibuf6_en),.O(burst_ibuf[1]));
    I_BUF ibuf_inst6 (.I(burst[2]),.EN(ibuf7_en),.O(burst_ibuf[2]));
    I_BUF ibuf_inst7 (.I(prot[0]),.EN(ibuf8_en),.O(prot_ibuf[0]));
    I_BUF ibuf_inst8 (.I(prot[1]),.EN(ibuf9_en),.O(prot_ibuf[1]));
    I_BUF ibuf_inst9 (.I(prot[2]),.EN(ibuf10_en),.O(prot_ibuf[2]));
    I_BUF ibuf_inst10 (.I(prot[3]),.EN(ibuf11_en),.O(prot_ibuf[3]));
    I_BUF ibuf_inst11 (.I(trans[0]),.EN(ibuf12_en),.O(trans_ibuf[0]));
    I_BUF ibuf_inst12 (.I(trans[1]),.EN(ibuf13_en),.O(trans_ibuf[1]));
    I_BUF ibuf_inst13 (.I(trans[2]),.EN(ibuf14_en),.O(trans_ibuf[2]));

    register #(1) register_inst2 (.clk(clk),.d(hresp),.rst(reset),.q(hresp_w));
    register #(1) register_inst3 (.clk(clk),.d(ready_o),.rst(reset),.q(ready_w));

    O_BUF o_buf_inst1 (.I(hresp_w),.O(hresp));
    O_BUF o_buf_inst2 (.I(ready_w),.O(ready));

    integer i;
    initial begin
        for( i = 0; i < 2**DEPTH; i = i + 1 ) begin
            reg_array[i] <= 0;
        end
    end

    always @(negedge(clk)) begin
        if( read_write == 1 )
            reg_array[addr] <= ram_data_in;
        // if( clear == 1 ) begin
        //     for( i = 0; i < 2**DEPTH; i = i + 1 ) begin
        //         reg_array[i] <= 0;
        //     end
        // end
        data_out = reg_array[addr];
    end
endmodule  

module register #(parameter WIDTH=32) (clk,d,rst,q);
    input clk,rst;
    input [WIDTH-1:0] d;
    output [WIDTH-1:0] q;

    always @(posedge clk) begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end
endmodule

