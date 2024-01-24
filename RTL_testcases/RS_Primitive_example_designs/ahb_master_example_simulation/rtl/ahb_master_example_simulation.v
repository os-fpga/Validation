module ahb_master_example_simulation ();
    parameter DEPTH = 10;
    parameter WIDTH = 32;
    
    input                 resetn;
    input [DEPTH-1:0]     addr;
    input [2:0]           hburst;
    input [3:0]           hprot;
    input [2:0]           hsize;
    input [2:0]           htrans;
    input [WIDTH-1:0]     hwdata;
    input                 hwwrite;
    output [WIDTH-1:0]    read_data;
    output                hresp;
    output                hready;
    input                 clk;
    input                 we;

    wire [WIDTH-1:0] hrdata_w;
    wire hready_w;

    SOC_FPGA_INTF_AHB_M inst (
        .HRESETN_I(resetn),
        .HADDR(addr),
        .HBURST(hburst),
        .HPROT(hprot),
        .HSIZE(hsize),
        .HTRANS(htrans),
        .HWDATA(hwdata),
        .HWWRITE(hwwrite),
        .HRDATA(hrdata_w),
        .HREADY(hready),
        .HRESP(hresp),
        .HCLK(clk)
    );

    ram ram_inst (
        .clk(clk),
        .we(we),
        .addr(addr),
        .di(hrdata_w),
        .dout(read_data)
    );

endmodule  

module ram();
    parameter WIDTH=32;
    parameter DEPTH=10;

    input clk;
    input we;
    input [WIDTH-1:0] addr;
    input [WIDTH-1:0] di;
    output [WIDTH-1:0] dout;

    reg [WIDTH-1:0] RAM [2**DEPTH-1:0];
    reg [WIDTH-1:0] dout;

    always @(posedge clk)
        begin
            if (we)
            begin
                RAM[addr] <= di;
                dout <= di;
            end
            else
                dout <= RAM[addr];
        end
endmodule
