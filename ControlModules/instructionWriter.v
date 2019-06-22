module instructionWriter( clock, writeInstr, instrIn ,cAdd );

	input writeInstr, clock;
	input [31:0] instrIn;
	output reg [31:0] cAdd;
	
	initial begin
		cAdd <= 0;
	end
	
	always@ ( negedge clock )
	begin
		case( instrIn[31:26] )
			6'b000000:
			begin
					cAdd <= 0;
			end
			default:
			begin
				if( writeInstr )
					cAdd <= cAdd + 1;
			end
			endcase
	end

endmodule 