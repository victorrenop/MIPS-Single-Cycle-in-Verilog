module BIOS #(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=1024)
( address, instOut, clock, autoclock, rst, changeSource );
		
		input [(DATA_WIDTH-1):0] address;
		input clock, autoclock,rst;
		output changeSource;
		output reg [(DATA_WIDTH-1):0] instOut;
		reg [(DATA_WIDTH-1):0] mem [ADDR_WIDTH-1:0];
		
		always @ (posedge clock)
		begin
			if( rst )
			begin
				mem[0] = 32'b00000000000000000000000000000000;
				mem[1] = 32'b00111000000000000000000000000010;
				mem[2] = 32'b01111100000000010000000000000000;
				mem[3] = 32'b00110100000000010000000000000000;
				mem[4] = 32'b00101100000000010000000000000000;
				mem[5] = 32'b00001100001001000000000000000000;
				mem[6] = 32'b00110000000000010000000000000101;
				mem[7] = 32'b00001100001000100000000000000000;
				mem[8] = 32'b00001100100000110000000000000000;
				mem[9] = 32'b01100000011000100000000000001110;
				mem[10] = 32'b00110000000000010000000001100011;
				mem[11] = 32'b00110100000000010000001111111111;
				mem[12] = 32'b10000000000000000000001111111111;
				mem[13] = 32'b00111000000000000000000000001110;
				mem[14] = 32'b10000000000000000000000000000000;
				mem[15] = 32'b00000000000000000000000000000000;
			end
		end
		
		always @( posedge autoclock )
		begin
			instOut <= mem[address];
		end
		
		assign changeSource = address == 15 ? 1 : 0;
	
endmodule