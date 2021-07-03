module shiftreg(d,load,clk,q);

input [3:0]d;
input load, clk;
output reg [3:0]q;

always @(posedge clk)
	if(load)
		q<=d;
	else
		begin
			q[3]=q[0];
			q[2]=q[3];
			q[1]=q[2];
			q[0]=q[1];
		end
endmodule