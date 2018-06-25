module Output_Module (clock, adress, writedata, dataout, out, MemWrite, rst);

	input clock, out, MemWrite, rst;
	input [4:0] adress;
	input [31:0] writedata;
	output reg [31:0] dataout;
	reg [31:0] mem [31:0];
	
	always @(posedge clock)
		begin
			//mem[0] = 32'b0;
			if (MemWrite && adress >= 0)
				mem[adress] = writedata;
			else if (out)
				dataout = mem[adress];
			else if (rst)
				dataout = mem[0];
		end
		
		
endmodule 