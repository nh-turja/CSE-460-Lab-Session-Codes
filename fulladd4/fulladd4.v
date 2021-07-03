module fulladd4(S0,S1,S2,S3,Cout,A0,A1,A2,A3,B0,B1,B2,B3,Cin);

input A0,A1,A2,A3,B0,B1,B2,B3,Cin;
output S0,S1,S2,S3,Cout;
wire Cout0,Cout1,Cout2;

fulladd stage0(S0,Cout0,A0,B0,Cin);
fulladd stage1(S1,Cout1,A1,B1,Cout0);
fulladd stage2(S2,Cout2,A2,B2,Cout1);
fulladd stage3(S3,Cout,A3,B3,Cout2);

endmodule

module fulladd(S,Cout,A,B,Cin);
input A,B,Cin;
output S,Cout;

assign S = A^B^Cin;
assign Cout = (A&B) |(Cin&(A^B));
endmodule