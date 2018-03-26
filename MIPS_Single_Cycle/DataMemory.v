module DataMemory (clock, WriteData, MemWrite, DataMemoryOut, adress);

	input [31:0] WriteData, adress;
	input clock, MemWrite;
	output [31:0] DataMemoryOut;
	
	reg[31:0] memory [31:0];
    reg[31:0] stack  [31:0];
	
	always @(posedge clock)
		begin
			if (MemWrite)
            begin
                if (adress < 0)
				    stack[33 - adress] = WriteData;
                else
                    memory[adress] = WriteData;
            end
		end
	
	assign DataMemoryOut= memory [adress];

endmodule
	
