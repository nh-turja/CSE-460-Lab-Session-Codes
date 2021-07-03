module testmealy(Clock, Resetn, w, z);

input Clock, Resetn, w;
output reg z;
reg y, Y;
parameter A=0, B=1;
//Define the next state and output combinational circuits
always @(w,y)
	case(y)
		A: if(w)
				begin
				z=0; Y=B;
				end
			else
				begin
				z=0; Y=A;
				end
		B: if(w)
				begin
				z=1; Y=B;
				end
			else 
				begin
				z=0; Y=A;
				end
	endcase

always@(negedge Resetn, posedge Clock)
	if(Resetn == 0) y <=A;
	else y <= Y;
endmodule