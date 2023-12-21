module tb_fsm_encoding_binary_sequence_detector;
reg in;
reg clk;
reg rst;
wire out;

fsm_encoding_binary_sequence_detector DUT(.in(in), .clk(clk), .rst(rst), .out(out));


always #5 clk = ~clk;

initial 
begin
in = 0;
clk = 0;
rst = 0;
#10;

rst = 1;
#10;

rst = 0;
#10;
//////////////////////////////
in = 0;
#10;

in = 0;
#10;

in = 1;
#10;

in = 1;
#10;

in = 0;
#10;

in = 0;
#10;

in = 1;
#10;

in = 1;
#10;

in = 1;
#10;

in = 0;
#10;

in = 0;
#10;

in = 1;
#10;

in = 1;
#10;

in = 1;
#10;

in = 0;
#10;

in = 1;
#10;

in = 1;
#10;

in = 0;
#10;

in = 0;
#10;

in = 1;
#10;

in = 1;
#10;

in = 1;
#10;

#500 $finish;
end

endmodule