module Timer( clock, reset, interval, timerWrite, interrupt );

	input clock, reset, timerWrite;
	input[31:0] interval;
	output reg interrupt;
	reg[24:0] counter;
	reg[31:0] savedInterval;
	
	always @(posedge clock )
	begin
		if( reset )
		begin
			counter <= 0;
			interrupt = 1'b0;
		end
		else if( timerWrite )
		begin
			savedInterval <= interval;
			counter <= 0;
			interrupt = 1'b0;
		end
		else if( counter == interval )
		begin
			counter <= 0;
			interrupt = 1'b1;
		end
		else
		begin
			counter <= counter + 1;
			interrupt = 1'b0;
		end 
	end

endmodule 