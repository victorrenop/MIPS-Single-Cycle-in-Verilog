
module DataMemory #(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=1024, parameter NPROCESS=11)
						(clock, WriteData, MemWrite, DataMemoryOut, adress, autoclock, ReadpId, WritepId);

	input signed [31:0] WriteData, adress;
	input [31:0] ReadpId, WritepId;
	input clock, MemWrite, autoclock;
	output signed [31:0] DataMemoryOut;
	
	// Certo
	reg[(DATA_WIDTH-1):0] memory [((NPROCESS*ADDR_WIDTH)-1):0];
	reg[(DATA_WIDTH-1):0] stack  [((NPROCESS*ADDR_WIDTH)-1):0];
	
	//Errado
	/*reg[(DATA_WIDTH-1):0] memory [((NPROCESS*(2**ADDR_WIDTH))-1):0];
	reg[(DATA_WIDTH-1):0] stack  [((NPROCESS*(2**ADDR_WIDTH))-1):0];*/
	reg [(DATA_WIDTH-1):0] add1;
	reg [(DATA_WIDTH-1):0] add2;
	
	always @(posedge clock)
		begin
			if (MemWrite)
            begin
                if (adress < 0)
						  stack[(WritepId*ADDR_WIDTH) + (ADDR_WIDTH+ adress)] <= WriteData;
                else
                    memory[WritepId*ADDR_WIDTH+adress] <= WriteData;
            end
		end
		
		always@( posedge autoclock )
		begin
			add1 <= stack[(ReadpId*ADDR_WIDTH) + (ADDR_WIDTH+ adress)];
			add2 <= memory[ReadpId*ADDR_WIDTH+adress];
		end
		
		assign DataMemoryOut = adress < 0 ? add1 : add2;

endmodule



	

	
	