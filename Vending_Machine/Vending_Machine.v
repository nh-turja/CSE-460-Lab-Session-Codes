//Courtesy: Kaushik Biswas (EEE, BUET)
module Vending_Machine(clock, reset, cash_in, purchase, present_state, next_state, cash_return);
	input clock, reset;
	input [1:0] cash_in;
	output reg purchase;
	output reg [1:0] cash_return, present_state, next_state;
	parameter 	state0= 2'b00, //0tk/final state
				state1= 2'b01, //5tk state
				state2= 2'b10, //10tk state
				state3= 2'b11, //15tk state; only for cash_input: 2'b11= 20 tk, otherwise 2'b11 = 15tk
				n = 15;
	
	always@(posedge clock)
	begin
		if(n==10)
		begin 
			if(reset==1)
			begin 
				present_state=0;
				next_state=0;
			end
			else
			begin
				present_state=next_state;
				case(present_state)
				state0: if(cash_in == 2'b00)
							begin
								next_state = state0;
								purchase =0;
								cash_return =0;
							end
						else if(cash_in == 2'b01)
							begin
								next_state=state1;
								purchase = 0;
								cash_return = 0;
							end
						else if(cash_in == 2'b10)
							begin
								next_state=state0;
								purchase=1;
								cash_return=0;
							end
						else if(cash_in == 2'b11)
							begin
								next_state = state0;
								purchase = 1;
								cash_return = 2'b10;
							end
				state1: if(cash_in == 2'b00)
							begin
								next_state = state0;
								purchase =0;
								cash_return =2'b01;
							end
						else if(cash_in == 2'b01)
							begin
								next_state=state0;
								purchase = 1;
								cash_return = 0;
							end
						else if(cash_in == 2'b10)
							begin
								next_state=state0;
								purchase=1;
								cash_return=2'b01;
							end
						else if(cash_in == 2'b11)
							begin
								next_state = state0;
								purchase = 1;
								cash_return = 2'b11;
							end
				endcase
			end
		end
		else if (n==15)
		begin 
			if(reset==1)
			begin 
				present_state=0;
				next_state=0;
			end
			else
			begin
				present_state=next_state;
				case(present_state)
				state0: if(cash_in == 2'b00)
							begin
								next_state = state0;
								purchase =0;
								cash_return =0;
							end
						else if(cash_in == 2'b01)
							begin
								next_state=state1;
								purchase = 0;
								cash_return = 0;
							end
						else if(cash_in == 2'b10)
							begin
								next_state=state2;
								purchase=0;
								cash_return=0;
							end
						else if(cash_in == 2'b11)
							begin
								next_state = state0;
								purchase = 1;
								cash_return = 2'b01;
							end
				state1: if(cash_in == 2'b00)
							begin
								next_state = state0;
								purchase =0;
								cash_return =2'b01;
							end
						else if(cash_in == 2'b01)
							begin
								next_state=state2;
								purchase = 0;
								cash_return = 0;
							end
						else if(cash_in == 2'b10)
							begin
								next_state=state0;
								purchase=1;
								cash_return=0;
							end
						else if(cash_in == 2'b11)
							begin
								next_state = state0;
								purchase = 1;
								cash_return = 2'b10;
							end
				state2: if(cash_in == 2'b00)
							begin
								next_state = state0;
								purchase =0;
								cash_return =2'b10;
							end
						else if(cash_in == 2'b01)
							begin
								next_state=state0;
								purchase = 1;
								cash_return = 0;
							end
						else if(cash_in == 2'b10)
							begin
								next_state=state0;
								purchase=1;
								cash_return=2'b01;
							end
						else if(cash_in == 2'b11)
							begin
								next_state = state0;
								purchase = 1;
								cash_return = 2'b11;
							end
				endcase
			end
		end
		else if(n==20)
		begin 
			if(reset==1)
			begin 
				present_state=0;
				next_state=0;
			end
			else
			begin
				present_state=next_state;
				case(present_state)
				state0: if(cash_in == 2'b00)
							begin
								next_state = state0;
								purchase =0;
								cash_return =0;
							end
						else if(cash_in == 2'b01)
							begin
								next_state=state1;
								purchase = 0;
								cash_return = 0;
							end
						else if(cash_in == 2'b10)
							begin
								next_state=state2;
								purchase=0;
								cash_return=0;
							end
						else if(cash_in == 2'b11)
							begin
								next_state = state0;
								purchase = 1;
								cash_return = 0;
							end
				state1: if(cash_in == 2'b00)
							begin
								next_state = state0;
								purchase =0;
								cash_return =2'b01;
							end
						else if(cash_in == 2'b01)
							begin
								next_state=state2;
								purchase = 0;
								cash_return = 0;
							end
						else if(cash_in == 2'b10)
							begin
								next_state=state3;
								purchase=0;
								cash_return=0;
							end
						else if(cash_in == 2'b11)
							begin
								next_state = state0;
								purchase = 1;
								cash_return = 2'b10;
							end
				state2: if(cash_in == 2'b00)
							begin
								next_state = state0;
								purchase =0;
								cash_return =2'b10;
							end
						else if(cash_in == 2'b01)
							begin
								next_state=state3;
								purchase = 0;
								cash_return = 0;
							end
						else if(cash_in == 2'b10)
							begin
								next_state=state0;
								purchase=1;
								cash_return=2'b00;
							end
						else if(cash_in == 2'b11)
							begin
								next_state = state0;
								purchase = 1;
								cash_return = 2'b10;
							end
				state3: if(cash_in == 2'b00)
							begin
								next_state = state0;
								purchase =0;
								cash_return =2'b11;
							end
						else if(cash_in == 2'b01)
							begin
								next_state=state0;
								purchase = 1;
								cash_return = 0;
							end
						else if(cash_in == 2'b10)
							begin
								next_state=state0;
								purchase=1;
								cash_return=2'b01;
							end
						else if(cash_in == 2'b11)
							begin
								next_state = state0;
								purchase = 1;
								cash_return = 2'b11;
							end
				endcase
			end
		end
	end
endmodule