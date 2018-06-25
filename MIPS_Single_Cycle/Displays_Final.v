module Displays_Final (binary, um, cem, mil,neg, milhao, bilhao, trilhao, quadrilhao, neg, out);

	input [31:0] binary; // Entrada em binarios que deve ser mostrada no display
	output neg;
	input out;
	output [6:0] um, cem, mil, milhao, bilhao, trilhao, quadrilhao; // Saida dos displays
	wire [3:0] binUm, binCem, binMil, binMilhao, binBilhao, binTrilhao, binQuadrilhao; // Entrada de cada display conforme a ordem de valor
	
	Binary_to_BCD BTB (binary[31:0], neg, binUm[3:0], binCem[3:0], binMil[3:0], binMilhao[3:0], binBilhao[3:0], binTrilhao[3:0], binQuadrilhao[3:0]);

	Display U1 (binUm[3:0], um[6:0], out);
	Display U2 (binCem[3:0], cem[6:0], out);
	Display U3 (binMil[3:0], mil[6:0], out);
	Display U4 (binMilhao[3:0], milhao[6:0], out);
	Display U5 (binBilhao[3:0], bilhao[6:0], out);
	Display U6 (binTrilhao[3:0], trilhao[6:0], out);
	Display U7 (binQuadrilhao[3:0], quadrilhao[6:0], out);
	
endmodule
	
