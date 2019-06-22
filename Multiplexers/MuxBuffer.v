module MuxBuffer (Reg, HDData, BSrc, MuxOut);

	input [31:0] Reg, HDData;
	output reg [31:0] MuxOut;
	input [1:0] BSrc;
	
	always @ (*)
		begin
			if ( BSrc == 2'b01 )
				MuxOut <= HDData;
			else if ( BSrc == 2'b00 )
				MuxOut <= Reg;
			else
				MuxOut <= 0;
		end
	
endmodule 