module In_Module (Switches, DataOut, In_Signal, clock); // 18 switches de uso geral

	input [15:0] Switches;
	input In_Signal, clock; // Sinal de interrupcao
	output reg [15:0] DataOut;
	reg 
	
	always @(posedge clock)
		begin
			if (In_Signal)
				DataOut = Switches;
		end
		
endmodule
				