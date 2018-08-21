module Output_Module #(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=1024)(clock, auto, adress, writedata, dataout, out, MemWrite, datain);

	input clock, out, MemWrite, auto;
	input [(DATA_WIDTH-1):0] adress;
	input [(DATA_WIDTH-1):0] writedata;
	input [(DATA_WIDTH-1):0] datain;
	reg [(DATA_WIDTH-1):0] data1;
	reg [(DATA_WIDTH-1):0] data2;
	output [(DATA_WIDTH-1):0] dataout;
	reg [(DATA_WIDTH-1):0] mem [ADDR_WIDTH-1:0];
	
	/*input [31:0] adress;
	input [31:0] writedata;
	output reg [31:0] dataout;
	reg [31:0] mem [99:0];*/
	
	always @(posedge clock)
		begin
			if (MemWrite && adress >= 0)
				mem[adress] <= writedata;
		end
		
	always @( posedge auto )
	begin
			data1 <= mem[adress];
			data2 <= datain;
	end
		
	assign dataout = out ? data1 : data2;
		
endmodule 