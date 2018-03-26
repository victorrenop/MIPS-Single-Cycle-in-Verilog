module ProgramCounter (clock, reset, halt, adressIn, adressOut, PCSrc, zero, Jmp, Jr, Jal, mJr);

	input clock, reset, halt, PCSrc, zero, Jmp, Jr, Jal;
	input [31:0] adressIn, mJr;
	reg [31:0] adressOut;
	wire [31:0] pcInc, pcIncB; // pcIncB eh o endereco de branch
	output [31:0] adressOut;
	
	assign pcInc = adressOut + 1;
	assign pcIncB = mJr;
	
	always @(posedge clock)
		begin 
			if (reset)
				adressOut <= 0;
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
