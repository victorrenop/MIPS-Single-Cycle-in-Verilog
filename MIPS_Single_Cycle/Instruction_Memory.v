module Instruction_Memory (adress, clock, instructionOut);

	input clock;
	integer flag = 0;
	input [9:0] adress;
	output [31:0] instructionOut;
	
	reg [31:0] iRAM [39:0];
	
	always @ (posedge clock )
		begin
			if (flag == 0)
				iRAM[0] = 32'b00000000000000000000000000000000; //nop; programar as instrucoes assim
				flag <= 1;
			end
		end
		
		assign instructionOut = iRAM[adress];
		
endmodule 