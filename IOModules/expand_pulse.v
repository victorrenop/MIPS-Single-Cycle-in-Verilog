module expand_pulse(clock50, in, out);

input clock50, in;
output reg out;
reg[31:0] count;

always@(posedge clock50)
begin

	if(in == 1)
		begin
			out = 0;
			count = count + 1;
		end
	else if(count < 50000000 && count > 0)
		begin
			out = 0;
			count = count + 1;
		end
	else
		begin
			out = 1;
			count = 0;
		end

end

endmodule
