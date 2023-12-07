
module tb_rams_sp_wf_1024x7;

    reg clk;
    reg we;
    reg [9:0] addr;
    reg [15:0] di;
    wire [15:0] dout;


    integer mismatch=0;
    reg [6:0]cycle;

    rams_sp_wf_1024x7 golden(.*);

    //clock//
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
    {we, addr, di, cycle} = 0;

    for (integer i = 0; i<1024; i= i+1) golden.RAM[i] = 'b0;

    repeat (1)@(posedge clk);
    
    //writes, and reads whats being written
    we = 1'b1;
    addr = 10'd1;
    di = 16'd26;

    //writes new value 
    repeat (1) @(posedge clk);
    we = 1'b1;
    addr = 10'd2;
    di = 16'd11;

    //not writing, and reads addr 1
    repeat (1) @(posedge clk);
    we = 1'b0;
    addr = 10'd1;

    repeat (5) @(posedge clk);
    $finish;
    end


    initial begin
        //$dumpfile("tb.vcd");
        //$dumpvars;
    end
endmodule
