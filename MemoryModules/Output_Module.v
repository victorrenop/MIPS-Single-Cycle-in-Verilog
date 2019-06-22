module Output_Module #(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=1024, parameter NPROCESS=11)
(clock, auto, adress, writedata, dataout, out, MemWrite, datain, ReadpId, WritepId);

	input clock, out, MemWrite, auto;
	input [(DATA_WIDTH-1):0] adress;
	input [(DATA_WIDTH-1):0] writedata;
	input [(DATA_WIDTH-1):0] datain;
	input [(DATA_WIDTH-1):0] ReadpId, WritepId;
	reg [(DATA_WIDTH-1):0] data1;
	reg [(DATA_WIDTH-1):0] data2;
	output [(DATA_WIDTH-1):0] dataout;
	reg [(DATA_WIDTH-1):0] mem [(NPROCESS*ADDR_WIDTH-1):0];
	
	always @(posedge clock)
		begin
			if (MemWrite && adress >= 0)
				mem[WritepId*ADDR_WIDTH+adress] <= writedata;
		end
		
	always @( posedge auto )
	begin
			data1 <= mem[ReadpId*ADDR_WIDTH+adress];
			data2 <= datain;
	end
		
	assign dataout = out ? data1 : data2;
		
endmodule 