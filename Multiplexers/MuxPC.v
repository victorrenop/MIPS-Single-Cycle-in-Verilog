module MuxPC (PCInc, JumpBranch, PCSrc, Zero, MuxOut);

	input [31:0] PCInc, JumpBranch;
	input PCSrc, Zero;
	output reg [31:0] MuxOut;
	
	always @ (*)
		begin
			if (PCSrc & Zero)
				MuxOut <= JumpBranch;
			else
				MuxOut <= PCInc;
		end
		
endmodule 