module DataMemory (clock, WriteData, MemWrite, DataMemoryOut, adress);

	input [31:0] WriteData, adress;
	input clock, MemWrite;
	output [31:0] DataMemoryOut;
	
	reg[31:0] memory [31:0];
	
	always @(posedge clock)
		begin
			if (MemWrite)
				memory[adress] = WriteData;
		end
	
	assign DataMemoryOut= memory [adress];

endmodule
	