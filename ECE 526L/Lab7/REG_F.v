/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #7            Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #7  REG                                                  *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: REG_F.v        reated by Avinash Damse,  6th April 2023  *** 
 ***    This module models a register file with a bidirectional port     ***
 ***    DATA and input port ADDR that specifies the target address       *** 
 ***************************************************************************/ 
 
 `timescale 1 ns / 1 ns
 
 module REG_F(DATA, ADDR, OE, WS, CS);
 parameter WIDTH = 8; 
 parameter DEPTH = 32;
 
	inout[7:0] DATA;		// 8-bit bidirectional data
	input[4:0] ADDR;		// 5-bit Address input
	input WS, OE, CS;		//input
	
	reg [WIDTH-1:0] STORE[0:DEPTH-1];
	
	assign DATA = OE && !CS ? STORE[ADDR] : 8'bz;
	
	always @ (posedge WS) 
		begin
		if(!CS && !OE)
			STORE[ADDR] <= DATA;
		else
			STORE[ADDR] <= STORE[ADDR];
		end
 endmodule