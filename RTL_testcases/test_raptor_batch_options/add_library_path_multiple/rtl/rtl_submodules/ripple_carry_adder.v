module ripple_carry_adder(A, B, Cin, Y, Carry);
	// Defining the inputs/outputs
    input A;
    input B;
    input Cin;
    output Y;
    output Carry;
	 
	 assign Y = A^B^Cin; 						//SUM Operation
	 assign Carry = (A&B)|(B&Cin)|(Cin&A); //CARRY Operation

endmodule