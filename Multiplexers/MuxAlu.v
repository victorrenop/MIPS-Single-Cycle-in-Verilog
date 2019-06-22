module MuxAlu (Imediate, Reg, processPC,MuxOut, ALUSrc);

	input [31:0] Imediate, Reg, processPC;
	output reg [31:0] MuxOut;
	input [1:0] ALUSrc;
	
	always @ (*)
		begin
			if ( ALUSrc == 2'b10 )
				MuxOut <= processPC;
			else if ( ALUSrc == 2'b01 )
				MuxOut <= Imediate;
			else if ( ALUSrc == 2'b00 )
				MuxOut <= Reg;
			else
				MuxOut <= 0;
		end
	
endmodule 