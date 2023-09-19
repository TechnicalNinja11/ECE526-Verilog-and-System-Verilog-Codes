/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #5              Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #5                                                  *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: Top.v            Created by Avinash Damse, 8st Mar 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 


`timescale 1 ns / 1 ns

module Top(CNT, CLOCK, RESET, ENA, LOAD, DATA );

	input CLOCK, RESET, ENA; //inputs
	input [2:0] LOAD;		//input
	input [7:0] DATA;		//input
	
	output [7:0] CNT;		//output
	wire RST;
	
	Counter M0 (CLOCK, RST, ENA, LOAD, DATA, CNT); //instantiation of Counter module
	AASD A0 ( CLOCK, RESET, RST);	//instantiation of AASD module
	
	
endmodule

	 
	