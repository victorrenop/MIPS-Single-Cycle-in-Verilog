module InterruptionController(timerInt, ioInt, signalOut);

	input timerInt, ioInt, signalOut;
	output reg[2:0] signalOut;
	
	always @(*)
	begin
		if( timerInt )
		begin
		end
		else if( ioInt )
		begin
		end
	end

endmodule 