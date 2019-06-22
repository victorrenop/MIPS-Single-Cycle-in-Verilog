module Displays_Final (binary, neg, out, d0, d1, d2, d3, d4, d5, d6, d7);

	input [31:0] binary; // Entrada em binarios que deve ser mostrada no display
	output neg;
	input out;
	output [0:6] d0, d1, d2, d3, d4, d5, d6, d7; // Saida dos displays
	wire [3:0] bin0, bin1, bin2, bin3, bin4, bin5, bin6, bin7; // Entrada de cada display conforme a ordem de valor
	
	Binary_to_BCD BTB (binary[31:0], neg, bin0[3:0], bin1[3:0], bin2[3:0], bin3[3:0], bin4[3:0], bin5[3:0], bin6[3:0], bin7[3:0]);

	Display U1 (bin0[3:0], d0[0:6], out);
	Display U2 (bin1[3:0], d1[0:6], out);
	Display U3 (bin2[3:0], d2[0:6], out);
	Display U4 (bin3[3:0], d3[0:6], out);
	Display U5 (bin4[3:0], d4[0:6], out);
	Display U6 (bin5[3:0], d5[0:6], out);
	Display U7 (bin6[3:0], d6[0:6], out);
	Display U8 (bin7[3:0], d7[0:6], out);
	
endmodule
	
