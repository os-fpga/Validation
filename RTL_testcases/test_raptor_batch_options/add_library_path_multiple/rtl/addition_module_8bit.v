module addition_module_8bit(A, B, Cin, Sum, Carry, Overflow);
	// Defining the inputs/outputs
    input signed [07:0] A;
    input signed [07:0] B;
    input Cin;
    output signed [07:0] Sum;
    output Carry;
    output Overflow;
	 
	 // Temporary Variables
	 wire [7:0] X;
	 reg [7:0] Y;
	 wire carry1, carry2, carry3, carry4, carry5, carry6, carry7;
	 
	// Ripple_Carry_Adder - Module implementation
	ripple_carry_adder rca0 (A[0], B[0], Cin, X[0], carry1);
	ripple_carry_adder rca1 (A[1], B[1], carry1, X[1], carry2);
	ripple_carry_adder rca2 (A[2], B[2], carry2, X[2], carry3);
	ripple_carry_adder rca3 (A[3], B[3], carry3, X[3], carry4);
	ripple_carry_adder rca4 (A[4], B[4], carry4, X[4], carry5);
	ripple_carry_adder rca5 (A[5], B[5], carry5, X[5], carry6);
	ripple_carry_adder rca6 (A[6], B[6], carry6, X[6], carry7);
	ripple_carry_adder rca7 (A[7], B[7], carry7, X[7], Carry);
	
	assign Overflow = Carry^carry7; //Overflow Condition
	
	// Checking if 'Overflow' exists
	always @ ( * ) begin
		if (Overflow == 1)
			Y = 8'b0;
		else
			Y = X;
	end
	
	assign Sum = Y;
	 
endmodule