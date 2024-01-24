module mult_pipe2_tb
  #(parameter SIZE  = 16);

	parameter CYCLES = 15;
	integer index = 0;
	initial begin
		$dumpfile("wave.vcd");
		$dumpvars;
	end	

   reg clk = 1'b1;

   always  #2 clk <= ~clk;

	reg [SIZE-1:0] a;
	reg [SIZE-1:0] b;
	reg enable = 1'b0;
	wire [2*SIZE-1:0] pdt;

//    mult_pipe2 #(.SIZE (SIZE), .LVL (2))
	mult_pipe2
	dut (  .clk  (clk), .a(a),  .b(b),  .pdt(pdt), .enable(enable));

   initial begin
	 	while (index < CYCLES) 
		begin
			enable = 1'b1;
			@(negedge clk);
			begin
				a <= $random();
				b <= $random();
			end
			index = index + 1;
		end
      $finish;
   end

endmodule
