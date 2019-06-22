module BufferBank #(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=32)
(WriteData, clock, readpId, writepId, rpId, rwritepId, setProcess, TransfBuffer, bufferData, bw); 

	input signed [(DATA_WIDTH-1):0] WriteData, bufferData;
	input clock, bw;
	input [1:0] setProcess;
	output [(DATA_WIDTH-1):0] readpId, writepId, rpId, rwritepId;
	
	reg [(DATA_WIDTH-1):0] ReadProcessId;
	reg [(DATA_WIDTH-1):0] WriteProcessId;
	output reg [(DATA_WIDTH-1):0] TransfBuffer;
	
	initial
	begin: INIT
		ReadProcessId <= 0; 
		WriteProcessId <= 0;
		TransfBuffer <= 0;
	end
	
	always @(posedge clock)
	begin
		if( bw )
			TransfBuffer <= bufferData;
		else if( setProcess == 2'b01 )
			ReadProcessId <= WriteData;
		else if( setProcess == 2'b10 )
			WriteProcessId <= WriteData;
		else
		begin
		end
	end
		
	assign readpId = ReadProcessId;
	assign writepId = WriteProcessId;
	assign rpId = ReadProcessId > 0 ? 1 : 0;
	assign rwritepId = WriteProcessId > 0 ? 1 : 0;
		
endmodule 





