module Timer( clock, reset, timerReset, interval, timerWrite, timerBlock, ReadpId, halt, interrupt);

	input clock, reset, timerWrite, timerReset, timerBlock, halt;
	input[31:0] interval, ReadpId;
	output reg interrupt;
	reg[31:0] counter;
	reg[31:0] savedInterval;
	wire block;
	
	initial begin
		savedInterval <= 30;
		counter <= 1;
	end
	
	assign block = (ReadpId == 0 || halt || timerBlock ) ? 1 : 0;
	
	always @(posedge clock )
	begin
		if( reset || timerReset )
		begin
			counter <= 1;
			interrupt <= 1'b0;
		end
		else if( timerWrite )
		begin
			savedInterval <= interval;
			counter <= 1;
			interrupt <= 1'b0;
		end
		/*else if( timerBlock )
		begin
			interrupt <= 1'b0;
			if( counter == savedInterval)
				counter <= counter - 1;
		end*/
		else if( counter == savedInterval )
		begin
			counter <= 1;
			interrupt <= 1'b1;
		end
		else
		begin
			if( !block )
				counter <= counter + 1;
			interrupt <= 1'b0;
		end 
	end

endmodule 