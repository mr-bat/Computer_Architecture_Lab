// build a module for instruction decode
module ID_Stage
	(
		clk,
		rst,
		writedata,
		write,
		Instruction_in,
		WB_En,
		MEM_R_En,
		MEM_W_En,
		BR_Type,
		EXE_Cmd,
		readdata1,
		readdata2,
		Immediate,
		data2,
		dest,
		Instruction,
		PC_in
	);
	
	// input and output ports
	input			clk;
	input			rst;
	input			write;
	input	[31:0]	writedata;
	input	[31:0]	Instruction_in;
	output 			WB_En;
	output 			MEM_R_En;
	output 			MEM_W_En;
	output 	[1:0]	BR_Type;
	output 	[3:0] 	EXE_Cmd;
	output 	[4:0]	dest;
	output	[31:0]	readdata1;
	output	[31:0]	readdata2;
	output 	[31:0]	Immediate;
	output 	[31:0]	data2;
	output	[31:0]	Instruction;
	input	[31:0]	PC_in;
	
	// wires and register
	wire 			Is_Imm;
	
	// build module
	
	// pass instruction
	assign Instruction = PC_in;
	
	// control unit
	Controller CU
	(
		.Opcode(Instruction_in[31:26]),
		.Is_Imm(Is_Imm),
		.WB_En(WB_En),
		.MEM_R_En(MEM_R_En),
		.MEM_W_En(MEM_W_En),
		.EXE_Cmd(EXE_Cmd),
		.BR_Type(BR_Type)
	);
	
	// register file
	Register_File RF
	(
		.clk(clk),
		.rst(rst),
		.readaddress1(Instruction_in[25:21]),
		.readaddress2(Instruction_in[20:16]),
		.writeaddress(Instruction_in[15:11]),
		.writedata(writedata),
		.write(write),
		.readdata1(readdata1),
		.readdata2(readdata2)
	);
	
	// sign extend
	assign Immediate = {{16{Instruction_in[15]}}, Instruction_in[15:0]};
	
	// data 2 mux
	assign data2 = (Is_Imm) ? Immediate : readdata2;
	
	// destination
	assign dest = (Is_Imm) ? Instruction_in[20:16] : Instruction_in[15:11];
	
endmodule
