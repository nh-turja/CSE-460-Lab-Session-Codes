module examplemealy(Clock, Resetn, w, z);

input Clock, Resetn, w;
output reg z;
reg [3:1]y, Y;
parameter S0= 3'b000, S1= 3'b001, S2= 3'b010, S3= 3'b011, S4= 3'b100, S5= 3'b101;

//Define the next state and output combinational circuits
always@(w,y)
	case(y)
		S0: if(w)
			begin
				z=0;
				Y=S1;
			end
			else 
			begin
				z=0;
				Y=S0;
			end
		S1: if(w)
			begin
				z=0;
				Y=S2;
			end
			else
			begin
				z=0;
				Y=S4;
			end
		S2: if(w)
			begin
				z=0;
				Y=S3;
			end
			else
			begin
				z=0;
				Y=S4;
			end
		S3: if(w)
			begin
				z=1;
				Y=S3;
			end
			else
			begin
				z=0;
				Y=S4;
			end
		S4: if(w)
			begin
				z=0;
				Y=S1;
			end
			else
			begin
				z=0;
				Y=S5;
			end
		S5: if(w)
			begin
				z=1;
				Y=S1;
			end
			else
			begin
				z=0;
				Y=S0;
			end
		default: 
			begin
				z=0;
				Y=3'bxxx;
			end
	endcase

//Define the sequential block
always@(negedge Resetn, posedge Clock)
	if(Resetn==0) y<=S0;
	else y<=Y;
endmodule