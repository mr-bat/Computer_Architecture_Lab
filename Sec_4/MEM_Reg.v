// build a module for memory
module MEM_Stage_reg
	(
			clk,
			rst,
			PC_in,
			PC,
			WB_En_in,
			MEM_R_En_in,
			ALU_result_in,
			Mem_Data_in,
			WB_En,
			MEM_R_En,
			ALU_result,
			Mem_Data
	);
	
	// input and output ports
	input			clk;
	input			rst;
	input			WB_En_in;
	input			MEM_R_En_in;
	input	[31:0]	PC_in;
	input	[31:0]	ALU_result_in;
	input	[31:0]	Mem_Data_in;
	output			WB_En;
	output			MEM_R_En;
	output	[31:0]	PC;
	output	[31:0]	ALU_result;
	output	[31:0]	Mem_Data;
	
	// registers
	reg				WB_En;
	reg				MEM_R_En;
	reg		[31:0]	PC;
	reg		[31:0]	ALU_result;
	reg		[31:0]	Mem_Data;
	
	// build module
	always @(posedge clk)
	begin
		if(rst)
		begin
			PC <= 32'b0;
			WB_En <= 1'b0;
			MEM_R_En <= 1'b0;
			ALU_result <= 32'b0;
			Mem_Data <= 32'b0;
		end
		else
		begin
			PC <= PC_in;
			WB_En <= WB_En_in;
			MEM_R_En <= MEM_R_En_in;
			ALU_result <= ALU_result_in;
			Mem_Data <= Mem_Data_in;
		end
	end
	
endmodule
