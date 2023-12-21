module xor_module_8bit(A, B, Y);
	// Defining the inputs/outputs
    input signed [07:0] A;
    input signed [07:0] B;
    output signed [07:0] Y;
		 
	 assign Y = A^B; //XOR Operation


endmodule