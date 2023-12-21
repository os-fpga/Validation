module tb_fsm_encoding_binary;
reg clk;
reg reset_n;
wire q;

fsm_encoding_binary DUT(.clk(clk), .reset_n(reset_n), .q(q));


always #5 clk = ~clk;

initial 
begin
clk = 0;
reset_n = 1;
#10;

reset_n = 0;
#10;

reset_n = 1;
#10;
//////////////////////////////
#100;

reset_n = 0;
#10;

reset_n = 1;
#10;
#500; 
$finish;
end

endmodule