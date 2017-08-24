module MuxJump (MPC, JumpAdress, Jmp, MuxOut);

	input [31:0] MPC, JumpAdress;
	input Jmp;
	output reg [31:0] MuxOut;
	
	always@(*)
		begin 
			if (Jmp)
				MuxOut = JumpAdress;
			else
				MuxOut = MPC;
		end
	
endmodule 