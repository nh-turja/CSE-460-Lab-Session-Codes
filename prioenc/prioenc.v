//2>1>3>0
module prioenc(w,y);

input [3:0] w;
output reg[1:0] y;

always@(w)
	casex(w)
		4'bx1xx: y=2;
		4'bx01x: y=1;
		4'b100x: y=3;
		4'b0001: y=0;
	endcase
endmodule