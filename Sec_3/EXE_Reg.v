// build a module for execution
module EXE_Stage_reg
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
	
	// registers
	reg		[31:0]	Instruction;
	
	// build module
	always @(posedge clk)
	begin
		if(rst)
			Instruction <= 32'b0;
		else
			Instruction = Instruction_in;
	end
	
endmodule
