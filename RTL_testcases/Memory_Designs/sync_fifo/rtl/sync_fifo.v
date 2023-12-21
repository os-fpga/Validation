module sync_fifo (
  input wire clk,
  input wire reset,
  input wire push,
  input wire pop,
  input wire [31:0] data_in,
  output reg [31:0] data_out,
  output wire empty,
  output wire full
);

  // Parameters
  parameter DEPTH = 256;
  parameter WIDTH = 32;

  // Internal signals
  reg [WIDTH-1:0] fifo [0:DEPTH-1];
  reg [WIDTH-1:0] read_ptr;
  reg [WIDTH-1:0] write_ptr;
  reg full_internal;
  reg empty_internal;

  // Logic for empty and full signals
  assign empty = empty_internal;
  assign full = full_internal;

  // Write pointer logic
  always @(posedge clk or posedge reset) begin
    if (reset)
      write_ptr <= 0;
    else if (push && !full_internal)
      write_ptr <= write_ptr + 1;
  end

  // Read pointer logic
  always @(posedge clk or posedge reset) begin
    if (reset)
      read_ptr <= 0;
    else if (pop && !empty_internal)
      read_ptr <= read_ptr + 1;
  end

  // FIFO memory write logic
  always @(posedge clk or posedge reset) begin
    if (reset)
      fifo[write_ptr] <= 0;
    else if (push && !full_internal)
      fifo[write_ptr] <= data_in;
  end

  // FIFO memory read logic
  always @(posedge clk or posedge reset) begin
    if (reset)
      data_out <= 0;
    else if (pop && !empty_internal)
      data_out <= fifo[read_ptr];
  end

  // Empty and full internal signal logic
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      empty_internal <= 1;
      full_internal <= 0;
    end else begin
      empty_internal <= write_ptr == read_ptr;
      full_internal <= write_ptr == (read_ptr + DEPTH - 1);
    end
  end

endmodule
 
