/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #5              Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #5  AASD                                                 *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: AASD.v           Created by Avinash Damse, 8st Mar 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 


`timescale 1 ns / 1 ns
module AASD (CLOCK, RESET, RST);
	input RESET, CLOCK;
	output RST;
	
	reg TEMP, RST;
	always @(posedge CLOCK or negedge RESET)
	begin 
		if ( RESET == 1'b0 )
		begin	
			TEMP <= 1'b0;
			
			RST <= 1'b0;
			
		end
		else
		begin
			TEMP <= 1'b1;
			RST <= TEMP;
			
		end
	
	
	end  
	

	
	
endmodule

