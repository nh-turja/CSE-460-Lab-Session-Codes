module mux2to1(A,B,S,f);

input A,B,S;
output reg f;

always @(A,B,S)
begin
	if(S==0)
		f=A;
	else
		f=B;
end
endmodule