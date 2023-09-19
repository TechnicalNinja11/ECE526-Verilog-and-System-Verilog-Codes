/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #1                 Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #1 title                                                 *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: Lab2_1.v         Created by Avinash Damse, 8th Feb 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 


`timescale 1 ns / 100 ps

`define PRIMARY_OUT			0		// ns  (primary output)
`define FAN_OUT_1  			0		// ns  (one output fanout)
`define FAN_OUT_2  			0		// ns  (two output fanout)
`define TIME_DELAY_1		0		// ns  (one input gates)
`define TIME_DELAY_2		0		// ns  (two input gates)
`define TIME_DELAY_3		0		// ns  (three input gates)



module Lab2_1  (in1,in2,out1);
		input in1,in2;     //inputs
		output out1;       //output
		
		wire NT ,A1 ,A2;     //connections
		
		not  #( `TIME_DELAY_1 + `FAN_OUT_2)		NOT(NT ,in1);		//NOT operation to input in1          
		and  #( `TIME_DELAY_2 + `FAN_OUT_1)		AND1(A1 ,in2 ,in1);		//AND operation between in1 and in2
		and  #( `TIME_DELAY_2 + `FAN_OUT_1)		AND2(A2 ,in1 ,NT);      //AND operation between in1 and NT
		nand  #( `TIME_DELAY_3 + `PRIMARY_OUT)		NAND1(out1 ,NT ,A1 ,A2);    //NAND operation between NT, A1 and A2
		
endmodule


