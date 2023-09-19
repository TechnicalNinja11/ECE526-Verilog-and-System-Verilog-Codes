/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #4                 Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #4                                                 *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: SR_Latch2.v      Created by Avinash Damse, 15th Feb 2023  *** 
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

module SR_Latch2( s0, s1, r0, r1, Q, Qnot );

		output Q, Qnot;   //output
		input s0, s1, r0, r1;  //input
		
		
		nand  #( `TIME_DELAY_3 + `PRIMARY_OUT + `FAN_OUT_2)		NAND1(Q ,s0 ,s1 ,Qnot);  // NAND operation for SR Latch
		nand  #( `TIME_DELAY_3 + `PRIMARY_OUT + `FAN_OUT_2)		NAND2(Qnot ,r0 ,r1 ,Q);  // NAND operation for SR Latch


endmodule