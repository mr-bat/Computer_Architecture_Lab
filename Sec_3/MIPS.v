// build a module for assembling
module MIPS
	(
		clk,
		rst,
		Instruction
	);
	
	// input and outputs
	input			clk;
	input			rst;
	output	[5:0]	Instruction;
	
	// wires
	wire 			WB_En21;
	wire			WB_En22;
	wire			MEM_R_En21;
	wire			MEM_R_En22;
	wire			MEM_W_En21;
	wire			MEM_W_En22;
	wire	[1:0]	BR_Type21;
	wire	[1:0]	BR_Type22;
	wire	[3:0]	EXE_Cmd21;
	wire	[3:0]	EXE_Cmd22;
	wire	[4:0]	dest21;
	wire	[4:0]	dest22;
	wire	[31:0]	Instruction11;
	wire	[31:0]	Instruction12;
	wire	[31:0]	Instruction21;
	wire	[31:0]	Instruction22;
	wire	[31:0]	Instruction31;
	wire	[31:0]	Instruction32;
	wire	[31:0]	Instruction41;
	wire	[31:0]	Instruction42;
	wire	[31:0]	Instruction51;
	wire	[31:0]	readdata121;
	wire	[31:0]	readdata122;
	wire	[31:0]	readdata221;
	wire	[31:0]	readdata222;
	wire	[31:0]	Immediate21;
	wire	[31:0]	Immediate22;
	wire	[31:0]	data221;
	wire	[31:0]	data222;
	
	// assemble modules
	
	// output
	assign Instruction = Instruction51[31:26];
	
	// instruction fetch
	IF_Stage IFS
		(
			.clk(clk),
			.rst(rst),
			.Instruction(Instruction11)
		);
		
	// instruction fetch register
	IF_Stage_reg IFR
		(
		.clk(clk),
		.rst(rst),
		.Instruction_in(Instruction11),
		.Instruction(Instruction12)
	);
		
	// instruction decode
	ID_Stage IDS
		(
			.clk(clk),
			.rst(rst),
			.writedata(32'b0),
			.write(1'b0),
			.Instruction_in(Instruction12),
			.WB_En(WB_En21),
			.MEM_R_En(MEM_R_En21),
			.MEM_W_En(MEM_W_En21),
			.BR_Type(BR_Type21),
			.EXE_Cmd(EXE_Cmd21),
			.readdata1(readdata121),
			.readdata2(readdata221),
			.Immediate(Immediate21),
			.data2(data221),
			.dest(dest21),
			.Instruction(Instruction21)
		);
	// instruction decode register
	ID_Stage_reg IDR
		(
			.clk(clk),
			.rst(rst),
			.readdata1_in(readdata121),
			.readdata2_in(readdata221),
			.Immediate_in(Immediate21),
			.data2_in(data221),
			.dest_in(dest21),
			.WB_En_in(WB_En21),
			.MEM_R_En_in(MEM_R_En21),
			.MEM_W_En_in(MEM_W_En21),
			.BR_Type_in(BR_Type21),
			.EXE_Cmd_in(EXE_Cmd21),
			.Instruction_in(Instruction21),
			.readdata1(readdata122),
			.readdata2(readdata222),
			.Immediate(Immediate22),
			.data2(data222),
			.dest(dest22),
			.WB_En(WB_En22),
			.MEM_R_En(MEM_R_En22),
			.MEM_W_En(MEM_W_En22),
			.BR_Type(BR_Type22),
			.EXE_Cmd(EXE_Cmd22),
			.Instruction(Instruction22)
		);
	// execution
	EXE_Stage EXES
		(
			.clk(clk),
			.rst(rst),
			.Instruction_in(Instruction22),
			.Instruction(Instruction31)
		);
	// execution register
	EXE_Stage_reg EXER
		(
			.clk(clk),
			.rst(rst),
			.Instruction_in(Instruction31),
			.Instruction(Instruction32)
		);
	// memory
	MEM_Stage MEMS
		(
			.clk(clk),
			.rst(rst),
			.Instruction_in(Instruction32),
			.Instruction(Instruction41)
		);
	// memory register
	MEM_Stage_reg MEMR
		(
			.clk(clk),
			.rst(rst),
			.Instruction_in(Instruction41),
			.Instruction(Instruction42)
		);
	// writeback
	WB_Stage WBS
		(
			.clk(clk),
			.rst(rst),
			.Instruction_in(Instruction42),
			.Instruction(Instruction51)
		);
	
endmodule
