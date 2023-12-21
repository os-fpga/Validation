module register_file_8bit(Data, Write_Enable, Address);
    inout [07:0] Data;
    input Write_Enable;
    input [01:0] Address;

	// RegisterFile storage
	reg [07:0] registers [01:0];
	reg [07:0] out_value;

	// Read from/Write to RegisterFile
	always @ ( * ) begin
		if ( Write_Enable )
			registers[Address] <= Data;
		else
			out_value <= registers[Address];
	end

	assign data = Write_Enable ? 8'bz : out_value;

endmodule