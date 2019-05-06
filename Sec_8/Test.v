`timescale 1ns/1ns
module test;

	// registers and wires
	reg				clk;
	reg				rst;
	reg				Sel;
	wire  			SRAMWEn;
	wire 				SRAMOE;
	wire 	[17:0]	SRAMaddress;
	wire 	[5:0]	Instruction;
	wire 	[15:0]	SRAMdata;

	assign SRAMdata = (~SRAMOE) ? 16'h0400 : {16{1'bz}};
	// module under test
	MIPS UUT
	(
		clk,
		rst,
		Sel,
		SRAMaddress, 	//	SRAM Address bus 18 Bits
		SRAMWEn, 		//	SRAM Write Enable
		SRAMOE, 		// 	SRAM Output Enable
		SRAMdata, 		//	SRAM Data bus 16 Bits
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
