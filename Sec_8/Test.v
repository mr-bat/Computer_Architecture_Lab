`timescale 1ns/1ns
module test;

	// registers and wires
	reg				clk;
	reg				rst;
	reg				Sel;
	wire	[5:0]	Instruction;
	
	// module under test
	MIPS UUT
	(
		clk,
		rst,
		Sel,
		Instruction
	);
	
	// write a test
	
	initial repeat (900) #(10) clk = ~clk;
	
	initial
	begin
				clk = 0; 	rst = 0;	Sel = 0;
		#( 35 ) rst = 1;
		#( 40 ) rst = 0;
		#( 3300 )	Sel = 1;
		#( 35 ) rst = 1;
		#( 40 ) rst = 0;
	end
	
endmodule
