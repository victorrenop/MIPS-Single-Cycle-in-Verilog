module one_shot(clk, pulse, clkout);

input	clk;
input	pulse;
output	clkout;

reg	cnt, temp;
initial begin cnt = 0;
temp = 0;
end

always @(posedge clk)
if(pulse && !cnt) begin
cnt <= ~cnt;
temp <= 1;
end
else if(!pulse) begin
cnt <= 0;
end
else
temp <= 0;


assign clkout = temp|clk;

endmodule