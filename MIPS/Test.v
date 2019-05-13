module test;

	// registers and wires
	reg				clk;
	reg				rst;
	reg 			sel;
	wire	[5:0]	Instruction;

	// module under test
	MIPS UUT
	(
		clk,
		rst,
		sel,
		Instruction
	);

	// write a test

	initial repeat (600) #(10) clk = ~clk;

	initial
	begin
		sel = 1;
		clk = 0; rst = 0;
		#(35) rst = 1;
		#(40) rst = 0;
	end

endmodule
