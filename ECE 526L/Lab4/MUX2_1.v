/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #34                Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #3 title                                                 *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: MUX2_1.v      Created by Avinash Damse, 1st Mar 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 


`timescale 1 ns / 1 ns

`define PRIMARY_OUT			2		// ns  (primary output)
`define FAN_OUT_1  			0.5		// ns  (one output fanout)
`define FAN_OUT_2  			0.8		// ns  (two output fanout)
`define FAN_OUT_3  			1		// ns  (three output fanout)
`define TIME_DELAY_1		3   	// ns  (one input gates)
`define TIME_DELAY_2		4		// ns  (two input gates)
`define TIME_DELAY_3		5		// ns  (three input gates)

module MUX2_1(OUT, A, B, SEL );

		output OUT;   //output
		input A, B, SEL;  //input
		wire A1, B1, SEL_N;
		
		
		not  #( `TIME_DELAY_1 + `FAN_OUT_1)		NOT(SEL_N, SEL);  // NOT operation for SEL
		and  #( `TIME_DELAY_2 + `FAN_OUT_1)		AND1(A1, A, SEL_N);  // AND operation 
		and  #( `TIME_DELAY_2 + `FAN_OUT_1)		AND2(B1, B, SEL);	// AND operation
		or  #( `TIME_DELAY_2 + `PRIMARY_OUT + `FAN_OUT_1)		OR(OUT, A1, B1);	// OR operation


endmodule