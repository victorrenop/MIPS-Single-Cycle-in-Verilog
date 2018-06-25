module MuxJump (MPC, JumpAdress, Jmp, Jal, MuxOut);

	input [31:0] MPC, JumpAdress;
	input Jmp, Jal;
	output reg [31:0] MuxOut;
	
	always@(*)
		begin 
			if (Jmp || Jal)
				MuxOut = JumpAdress;
			else
				MuxOut = MPC;
		end
	
endmodule 