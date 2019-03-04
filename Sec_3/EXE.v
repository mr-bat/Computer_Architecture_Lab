// build a module for execution
module EXE_Stage
	(
		clk,
		rst,
		Instruction_in,
		Instruction
	);
	
	// input and output ports
	input			clk;
	input			rst;
	input	[31:0]	Instruction_in;
	output	[31:0]	Instruction;
	
	// wires and registers
	wire	[4:0]		Function;
	wire	[31:0]	dataa;
	wire	[31:0]	datab;
	wire	[31:0]	result;
	
	// build module
	
	// pass instruction
	assign Instruction = Instruction_in;
	
	// arithmetic logic unit module
	ALU ALU_
	(
		.dataa(dataa),
		.datab(datab),
		.Function(Function),
		.result(result)
	);
	
endmodule
