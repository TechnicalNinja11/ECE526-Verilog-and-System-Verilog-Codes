/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #5              Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #5  8-Bit Counter                                        *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: Counter.v        Created by Avinash Damse, 8st Mar 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 


`timescale 1 ns / 1 ns

module Counter (CLK, RST, ENA, LOAD, DATA, CNT);  //module for 8-bit up counter
	input CLK, RST, ENA;		//input 
	input [2:0] LOAD;			//input
	input [7:0] DATA;			//input
	output [7:0] CNT;			//output
	
	reg [7:0] CNT;
	always @(posedge CLK or negedge RST)
	begin		//logic for counter
		if( RST == 1'b0 )
			CNT <= 8'h00;
		else if( ENA == 1'b1)
		begin
			if ( LOAD == 1'b1)
				CNT <= DATA;
			else
				CNT <= CNT + 1;
		end
		else
			CNT <= CNT;
			
	end
			
	
	
	endmodule
	