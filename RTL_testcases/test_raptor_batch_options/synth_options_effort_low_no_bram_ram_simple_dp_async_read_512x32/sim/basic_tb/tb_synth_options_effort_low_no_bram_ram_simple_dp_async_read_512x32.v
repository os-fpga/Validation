
module tb_synth_options_effort_low_no_bram_ram_simple_dp_async_read_512x32;
    reg clk, we;
    reg [8:0] read_addr, write_addr;
    reg [31:0] din;
    wire [31:0] dout;

    integer mismatch=0;
    reg [6:0]cycle;

    synth_options_effort_low_no_bram_ram_simple_dp_async_read_512x32 golden(.*);

    //clock//
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
    {we, read_addr,write_addr, din, cycle} = 0;

    for (integer i = 0; i<512; i= i+1) golden.ram[i] = 'b0;

    repeat (1)@(posedge clk);
    
    //writes and reads from same addr
    we = 1'b1;
    write_addr = 10'd1;
    read_addr = 10'd1;
    din = 32'd25;

    //writes new value 
    repeat (1) @(posedge clk);
    we = 1'b1;
    write_addr = 10'd1;
    read_addr = 10'd2;
    din = 32'd26;

    //not writing, and reads same time at given addr
    repeat (1) @(posedge clk);
    we = 1'b0;
    write_addr = 10'd1;
    read_addr = 10'd2;
    din = 32'd27;

    //writes, and reads at same time at given addr
    repeat (1) @(posedge clk);
    we = 1'b1;
    write_addr = 10'd2;
    read_addr = 10'd1;
    din = 32'd28;

    repeat (5) @(posedge clk);
    $finish;
    end


    initial begin
        //$dumpfile("tb.vcd");
        //$dumpvars;
    end
endmodule