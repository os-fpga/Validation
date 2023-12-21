//----- Default net type -----
`default_nettype none

module adder_iverilog_top_formal_verification_random_tb;
// ----- Default clock port is added here since benchmark does not contain one -------
	reg clock;

// ----- Shared inputs -------
	reg reset;
	reg [3:0] a;
	reg [3:0] b;

// ----- FPGA fabric outputs -------
	wire [4:0] sum;
	reg [4:0] sum_value;
	
// ----- Local wires for FPGA fabric -----
	wire [0:15] clk;
	wire [0:14975] gfpga_pad_QL_PREIO_A2F;
	wire [0:14975] gfpga_pad_QL_PREIO_F2A;
	wire [0:14975] gfpga_pad_QL_PREIO_F2A_CLK;
	wire [0:3150] bl_config_region_0;
	wire [0:2206] wl_config_region_0;
	bit [0:0] global_resetn;
	wire [0:0] scan_en;
	wire [0:0] scan_mode;

// ----- FPGA top-level module to be capsulated -----
	fpga_top U0_formal_verification (
		clk[0:15],
		global_resetn,
		scan_en,
		scan_mode,
		gfpga_pad_QL_PREIO_A2F[0:14975],
		gfpga_pad_QL_PREIO_F2A[0:14975],
		gfpga_pad_QL_PREIO_F2A_CLK[0:14975],
		bl_config_region_0[0:3150],
		wl_config_region_0[0:2206]);

// ----- Begin Connect Global ports of FPGA top module -----
	// assign global_resetn = 1'b0;
	assign scan_en = 1'b0;
	assign scan_mode = 1'b0;
	assign clk[0] = 1'b0;
	assign clk[1] = 1'b0;
	assign clk[2] = 1'b0;
	assign clk[3] = 1'b0;
	assign clk[4] = 1'b0;
	assign clk[5] = 1'b0;
	assign clk[6] = 1'b0;
	assign clk[7] = 1'b0;
	assign clk[8] = 1'b0;
	assign clk[9] = 1'b0;
	assign clk[10] = 1'b0;
	assign clk[11] = 1'b0;
	assign clk[12] = 1'b0;
	assign clk[13] = 1'b0;
	assign clk[14] = 1'b0;
	assign clk[15] = clock;
// ----- End FPGA Fabric Instanication -------

// ----- Clock 'clock' Initialization -------
	// initial begin
		
	// 	while(1) begin
	always	#1 clock <= !clock;
	// 	end
	// end

// ----- Begin reset signal generation -----
// ----- End reset signal generation -----

// ----- Input Initialization -------
	`include "../adder_iverilog/PinMapping.v"

	initial begin
		`include "../../bitstream_text.txt"
		global_resetn <= 0;
		clock <= 1'b0;
		reset <= 1'b1;
		a <= 4'b0;
		b <= 4'b0;
		#20;
		global_resetn <= 1;
		reset <= 1'b0;

		#10;
		if (sum === 5'b0)
		  $display("Status: Test Passed");
		else  
		  $display("Status: Test Failed");
		
		a <= 4'b0001;
		b <= 4'b0001;
		#5;
		if (sum === 5'b00010)
			$display("Status: Test Passed");
		else  
			$display("Status: Test Failed");
		
		a <= 4'b0010;
		b <= 4'b0001;
		#5;
		if (sum === 5'b00011)
			$display("Status: Test Passed");
		else  
			$display("Status: Test Failed");
		
		a <= 4'b0111;
		b <= 4'b0001;
		#5;
		if (sum === 5'b01000)
			$display("Status: Test Passed");
		else  
			$display("Status: Test Failed");
		
		a <= 4'b1111;
		b <= 4'b0001;
		#5;
		if (sum === 5'b10000)
			$display("Status: Test Passed");
		else  
			$display("Status: Test Failed");
		
		a <= 4'b1111;
		b <= 4'b0010;
		#5;
		if (sum === 5'b10001)
		  $display("Status: Test Passed");
		else  
		  $display("Status: Test Failed");
		
		a <= 4'b1001;
		b <= 4'b0110;
		#5;
		if (sum === 5'b01111)
			$display("Status: Test Passed");
		else  
			$display("Status: Test Failed");
		
		a <= 4'b1110;
		b <= 4'b0010;
		#5;
		if (sum === 5'b10000)
			$display("Status: Test Passed");
		else  
			$display("Status: Test Failed");
		
		a <= 4'b0001;
		b <= 4'b1011;
		#5;
		if (sum === 5'b01100)
			$display("Status: Test Passed");
		else  
			$display("Status: Test Failed");
		
		a <= 4'b1111;
		b <= 4'b1111;
		#5;
		if (sum === 5'b11110)
			$display("Status: Test Passed");
		else  
			$display("Status: Test Failed");

		repeat (100) begin
			a = $urandom();
			b = $urandom();
			sum_value = a+b;
			#3;
			if (sum == sum_value)
				$display ("Status: Test Passed");
			else
				$display ("Status: Test Failed");
			#2;
		end

		#10
		$finish;

	end

// ----- Input Stimulus -------
	// always@(negedge clock) begin
	// 	reset <= $random;
	// 	a[0] <= $random;
	// 	a[1] <= $random;
	// 	a[2] <= $random;
	// 	a[3] <= $random;
	// 	b[0] <= $random;
	// 	b[1] <= $random;
	// 	b[2] <= $random;
	// 	b[3] <= $random;
	// end

// ----- Begin output waveform to VCD file-------
	initial begin
		$dumpfile("adder.vcd");
		$dumpvars(1, adder_iverilog_top_formal_verification_random_tb);
	end
// ----- END output waveform to VCD file -------

// initial begin
// 	$timeformat(-9, 2, "ns", 20);
// 	$display("Simulation start");
// // ----- Can be changed by the user for his/her need -------
// 	#20
// 	$display("Simulation Succeed");
// 	$finish;
// end

endmodule
// ----- END Verilog module for adder_iverilog_top_formal_verification_random_tb -----

