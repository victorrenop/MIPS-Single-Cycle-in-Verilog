module HardDisk #(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=1024, TRACKS=4)( clock, autoClock, track, trackPos, writeData, readData, hdFlag );

	input clock, autoClock, hdFlag;
	input[(DATA_WIDTH-1):0] inputData, writeData, track, trackPos;
	output[(DATA_WIDTH-1):0] readData;
	
	reg[(DATA_WIDTH-1):0] data;
	reg[(DATA_WIDTH-1):0] disk [(ADDR_WIDTH-1):0];
	
	always @(posedge clock)
		begin
			if (hdFlag)
            begin
					disk[track*(ADDR_WIDTH/TRACKS)+trackPos] <= writeData;
            end
		end
		
		always@( posedge autoclock )
		begin
			data <= disk[track*(ADDR_WIDTH/TRACKS)+trackPos];
		end
		
		assign readData = data;

endmodule
