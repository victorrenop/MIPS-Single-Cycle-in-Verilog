module ALU (OPcode, op1, op2, result, shamt, zero, overflow_add, overflow_sub, clock);

	input [31:0] op1, op2;
	input clock;
	input [4:0] OPcode;
	input [4:0] shamt;
	output reg [31:0] result;
	reg [15:0] a, b; 
	wire [31:0] not_zero;
	output zero, overflow_add, overflow_sub;
	wire [31:0] value_add, value_sub;
	
	assign value_add = op1 + op2;
	assign value_sub = op1 - op2;
	
	assign overflow_add = (op1[31] == op2[31] && op1[31] != value_add[31]) ? 1 : 0;
	assign overflow_sub = (op1[31] != op2[31] && op1[31] != value_sub[31]) ? 1 : 0;
	
	assign not_zero = (op2 == 0) ? 1 : op2;
	
	always@(op1 or op2 or OPcode)
		begin
			a <= {op1[15:0]};
			b <= {op2[15:0]};
			case (OPcode[4:0])
				5'b00000: result = op1 + op2; // Soma
				5'b00001: result = op1 - op2; // Subtraçao
				5'b00010: result = a * b; // Multiplicaçao
				5'b00011: result = op1 / not_zero; // Divisao
				5'b00100: result = ~op1; // Not
				5'b00101: result = op1 & op2; // And bit a bit
				5'b00110: result = op1 | op2; // Or bit a bit
				5'b00111: result = op1 ^ op2; // Xor bit a bit
				5'b01000: result = op1 << shamt; // Shift left
				5'b01001: result = op1 >> shamt; // Shift right
				5'b01010: result = op1 < op2 ? 1 : 0; // Set less than
				5'b01011: result = op1 > op2 ? 1 : 0; // Set greater than (Branch)
				5'b01100: result = op1 == op2 ? 1: 0; // Set equal than (Branch)
				5'b01101: result = op1 <= op2 ? 1 : 0; // Set less or equal than (Branch)
				5'b01110: result = op1 >= op2 ? 1 : 0; // Set greater or equal than (Branch)
				5'b01111: result = op1 != op2 ? 1 : 0; // Set different
				default: result = 0;
			endcase
		end 
		
	
	assign zero = (result == 0);

endmodule 
