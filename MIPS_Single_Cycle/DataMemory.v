module DataMemory #(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=1024)(clock, WriteData, MemWrite, DataMemoryOut, adress, autoclock);

	input signed [31:0] WriteData, adress;
	input clock, MemWrite, autoclock;
	output signed [31:0] DataMemoryOut;
	
	reg[(DATA_WIDTH-1):0] memory [ADDR_WIDTH-1:0];
	reg[(DATA_WIDTH-1):0] stack  [ADDR_WIDTH-1:0];
	reg [(DATA_WIDTH-1):0] add1;
	reg [(DATA_WIDTH-1):0] add2;
	/*reg[31:0] memory [120:0];
	reg[31:0] stack  [120:0];
	reg [31:0] add;*/
	
	always @(posedge clock)
		begin
			if (MemWrite)
            begin
                if (adress < 0)
						  stack[1024 + adress] <= WriteData;
                else
                    memory[adress] <= WriteData;
            end
		end
		
		always@( posedge autoclock )
		begin
			add1 <= stack[1024+adress];
			add2 <= memory[adress];
		end
		
		assign DataMemoryOut = adress < 0 ? add1 : add2;

endmodule
	
