module ahb_master_example_simulation_tb;

  // Parameters
  parameter WIDTH = 32;
  parameter DEPTH = 10;

  //Ports
  reg               resetn;
  reg [DEPTH-1:0]   addr;
  reg [2:0]         hburst;
  reg [3:0]         hprot;
  reg [2:0]         hsize;
  reg [2:0]         htrans;
  reg [WIDTH-1:0]   hwdata;
  reg               hwwrite;
  wire [WIDTH-1:0]  read_data;
  wire              hresp;
  wire              hready;
  reg               clk;
  reg               we;

  ahb_master_example_simulation  ahb_master_example_simulation_inst (
    .resetn(resetn),
    .addr(addr),
    .hburst(hburst),
    .hprot(hprot),
    .hsize(hsize),
    .htrans(htrans),
    .hwdata(hwdata),
    .hwwrite(hwwrite),
    .read_data(read_data),
    .hresp(hresp),
    .hready(hready),
    .clk(clk),
    .we(we)
  );

always #1  clk = ! clk;

initial begin
  clk = 0;
  resetn = 1;
  trans = 3'b11;
  addr = 32'd0;
  hwdata = 32'd0;
  hsize = 3'b0;
  hburst = 3'b0;
  we = 1'b0;
  #10 resetn = 0;
  #10 resetn = 1;

  write(1'b1,32'd1,32'd5);
  read(1'b0,32'd1);

  #50;
  $finish;
end

task write(input write, input [31:0] address, input [31:0] write_data);
  begin
    @(posedge clk)
    addr = address;
    hwwrite = write;
    @(posedge clk)
    we = 1'b1;
    hwdata = write_data;
    @(posedge clk)
    @(posedge clk)
    we = 1'b0;
  end
endtask

task read(input write, input [31:0] address);
  begin
    @(posedge clk)
    addr = address;
    @(posedge clk)
    hwwrite = write;
    // 3 beats for read
    @(posedge clk)
    hwwrite = write;
    @(posedge clk)
    hwwrite = write;
    @(posedge clk)
    hwwrite = write;
    @(posedge clk)
    hwwrite = write;
  end
endtask


endmodule