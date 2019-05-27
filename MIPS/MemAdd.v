// build a module for correcting memory address
module MemAdd
	(
		address_in,
		address
	);

	// input and output port
	input	[15:0]	address_in;
	output	[15:0] 	address;

	//bild module
	assign address = address_in[15:2] - 14'h0100;

endmodule
