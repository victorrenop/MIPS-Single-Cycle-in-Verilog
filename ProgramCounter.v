module ProgramCounter (clock, reset, halt, adressIn, adressOut, PCSrc, zero, Jmp, Jr, Jal, mJr, changeSource);

	input clock, reset, halt, PCSrc, zero, Jmp, Jr, Jal, changeSource;
	input [31:0] adressIn, mJr;
	output reg [31:0] adressOut;
	wire [31:0] pcInc, pcIncB; // pcIncB eh o endereco de branch
	
	assign pcInc = adressOut + 1;
	assign pcIncB = mJr;
	
	always @(posedge clock)
		begin 
			if (reset || changeSource)
				begin
					adressOut <= 0;
				end
			else if (halt)
				begin
				end
			else if ((PCSrc && zero) || Jmp || Jr || Jal)
				begin
					adressOut <= pcIncB;
				end
			else
				adressOut <= pcInc;
		end
		
	
endmodule 
