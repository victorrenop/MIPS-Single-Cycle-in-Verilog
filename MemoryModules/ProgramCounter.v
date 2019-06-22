module ProgramCounter #(parameter DATA_WIDTH=32, parameter NPROCESS=2)
(clock, reset, halt, adressIn, adressOut, PCSrc, zero, Jmp, Jr, Jal, mJr, changeSource, ReadpId, changePC, add, processPC, itrr);

	input clock, reset, halt, PCSrc, zero, Jmp, Jr, Jal, changeSource, changePC, itrr;
	input [(DATA_WIDTH-1):0] adressIn, mJr, ReadpId;
	output[(DATA_WIDTH-1):0] adressOut, processPC;
	reg [(DATA_WIDTH-1):0] PCVector[(NPROCESS-1):0];
	wire [(DATA_WIDTH-1):0] pcInc, pcIncB; // pcIncB eh o endereco de branch
	input add;
	
	//assign pcInc = PCVector[add] + 1;
	//assign pcIncB = mJr;
	
	always @(posedge clock)
		begin
		
			if( changePC )
				PCVector[1] <= adressIn;
		
			if (changeSource || reset )
				begin
					PCVector[add] <= 0;
				end
			else if (halt)
				begin
				end
			else if ((PCSrc && zero) || Jmp || Jr || Jal)
				begin
					PCVector[add] <= mJr;
				end
			/*else if( itrr )
				PCVector[add] <= mJr;*/
			else
				PCVector[add] <= mJr + 1;
				
		end
		
	assign adressOut = PCVector[add];
	assign processPC = PCVector[1];
		
	
endmodule 