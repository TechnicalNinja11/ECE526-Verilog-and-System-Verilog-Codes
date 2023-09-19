/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #6             Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #6  mux                                                  *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: mux.v         Created by Avinash Damse, 29th March 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 
 
 `timescale 1 ns / 1 ns
 module mux(A, B, SEL, OUT);
 
 parameter SIZE = 1;
 output [SIZE-1:0] OUT;
 input [SIZE-1:0] A, B;
 input SEL;
 reg [SIZE-1:0] OUT;
 integer i;
 
 always @(A or B or SEL)
	begin
		if (SEL == 1'b0)
			OUT = A;
		else if (SEL == 1'b1)
			OUT = B;
		else 
		begin
			for(i = 0; i < SIZE; i = i + 1)
				if( A[i] === B[i])
				OUT[i] = A[i];
				else
				OUT[i] = 1'bx;
		end
	
	end
		
 
 endmodule