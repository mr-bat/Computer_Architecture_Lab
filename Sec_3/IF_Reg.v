// build a module for register after instruction fetch stage
module IF_Stage_reg
	(
		clk,
		rst,
		Instruction_in,
		Instruction,
		PC_in,
		PC
	);
	
	// input and outputs
	input			clk;
	input			rst;
	input	[31:0]	Instruction_in;
	input	[31:0]	PC_in;
	output	[31:0]	Instruction;
	output	[31:0]	PC;

	
	// registers
	reg		[31:0]	Instruction;
	reg		[31:0]	PC;
	
	// build module
	
	// transition	between
	always @(posedge clk)
	begin
		if(rst)
		begin
			Instruction <= 32'b0;
			PC <= 32'b0;
		end
		else
		begin
			Instruction <= Instruction_in;
			PC <= PC_in;
		end
	end
	
endmodule
