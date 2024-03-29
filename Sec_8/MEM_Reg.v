// build a module for memory
module MEM_Stage_reg
	(
			clk,
			rst,
			superStall,
			PC_in,
			PC,
			WB_En_in,
			MEM_R_En_in,
			dest_in,
			Is_Imm_in,
			ALU_result_in,
			Mem_Data_in,
			WB_En,
			MEM_R_En,
			dest,
			Is_Imm,
			ALU_result,
			Mem_Data
	);

	// input and output ports
	input			clk;
	input			rst;
	input 		superStall;
	input			WB_En_in;
	input			MEM_R_En_in;
	input           Is_Imm_in;
	input	[4:0]	dest_in;
	input	[31:0]	PC_in;
	input	[31:0]	ALU_result_in;
	input	[31:0]	Mem_Data_in;
	output			WB_En;
	output			MEM_R_En;
	output          Is_Imm;
	output	[4:0]	dest;
	output	[31:0]	PC;
	output	[31:0]	ALU_result;
	output	[31:0]	Mem_Data;

	// registers
	reg				WB_En;
	reg				MEM_R_En;
	reg             Is_Imm;
	reg		[4:0]	dest;
	reg		[31:0]	PC;
	reg		[31:0]	ALU_result;
	reg		[31:0]	Mem_Data;

	// build module
	always @(posedge clk)
	begin
		if(rst)
		begin
			WB_En <= 1'b0;
			MEM_R_En <= 1'b0;
			Is_Imm <= 1'b0;
			dest <= 5'b0;
			PC <= 32'b0;
			ALU_result <= 32'b0;
			Mem_Data <= 32'b0;
		end
		else
		begin
			if (~superStall) begin
				WB_En <= WB_En_in;
				MEM_R_En <= MEM_R_En_in;
				Is_Imm <= Is_Imm_in;
				dest <= dest_in;
				PC <= PC_in;
				ALU_result <= ALU_result_in;
				Mem_Data <= Mem_Data_in;
			end
		end
	end

endmodule
