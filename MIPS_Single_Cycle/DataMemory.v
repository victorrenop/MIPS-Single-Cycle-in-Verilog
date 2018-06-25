module DataMemory (clock, WriteData, MemWrite, DataMemoryOut, adress, autoclock);

	input signed [31:0] WriteData, adress;
	input clock, MemWrite, autoclock;
	output reg signed [31:0] DataMemoryOut;
	
	reg[31:0] memory [40:0];
	reg[31:0] stack  [40:0];
	
	always @(posedge clock)
		begin
			if (MemWrite)
            begin
                if (adress < 0)
						  stack[40 + adress] = WriteData;
                else
                    memory[adress] = WriteData;
            end
		end
		
		always@( posedge autoclock )
		begin
			DataMemoryOut = adress < 0 ? stack[40+adress] : memory[adress];
		end

endmodule
	
