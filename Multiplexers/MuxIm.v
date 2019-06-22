module MuxIm (Imediate, Switches, UART_data, MuxOut, MO);
	
	input [15:0] Imediate, Switches, UART_data;
	input [1:0] MO;
	output reg [15:0] MuxOut;
	
	always @ (*)
		begin
			if (MO == 2'b01)
				MuxOut <= Switches;
			else if (MO == 2'b00)
				MuxOut <= Imediate;
			else if (MO == 2'b10)
				MuxOut <= UART_data;
			else
				MuxOut <= 0;
		end
		
endmodule 