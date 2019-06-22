module InterruptionController(timerInt, context, changeContext, signalOut, region, instructionRegion,readpId, clock);

	input timerInt, changeContext, clock;
	input [2:0] context;
	input [31:0] readpId;
	output reg[2:0] signalOut;
	output reg[3:0] instructionRegion;
	output reg region;
	wire [3:0] selectRegion;
	
	assign selectRegion = instructionRegion != 0 ? 0 : readpId ;
	
	initial begin
		region <= 0;
		instructionRegion <= 0;
	end
	
	always @( posedge clock )
	begin
		if( timerInt || changeContext )
		begin
			region <= !region;
			instructionRegion <= selectRegion;
		end
	end
	
	always @( posedge clock )
	begin
		if( changeContext )
			signalOut <= context;
		else if( timerInt )
			signalOut <= 3'b000;
	end

endmodule 