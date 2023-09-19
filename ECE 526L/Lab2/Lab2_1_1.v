/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #2                Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #2 title                                                 *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: Lab2_1.v         Created by Avinash Damse, 8th Feb 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 


`timescale 1 ns / 100 ps

`define PRIMARY_OUT			5		// ns  (primary output)
`define FAN_OUT_1  			0.5		// ns  (one output fanout)
`define FAN_OUT_2  			1		// ns  (two output fanout)
`define FAN_OUT_3  			1.5		// ns  (three output fanout)
`define TIME_DELAY_1		1   	// ns  (one input gates)
`define TIME_DELAY_2		2		// ns  (two input gates)
`define TIME_DELAY_3		4		// ns  (three input gates)
`define TIME_DELAY_4		5		// ns  (four input gates)


module Lab2_1  (in1,in2,out1);
		input in1,in2;     //inputs
		output out1;        //output
		
		wire NT ,A1 ,A2;     //CONNECTIONS
		
		not  #( `TIME_DELAY_1 + `FAN_OUT_2)		NOT(NT ,in1);		//NOT operation to input in1       
		and  #( `TIME_DELAY_2 + `FAN_OUT_1)		AND1(A1 ,in2 ,in1);  //AND operation between in1 and in2
		and  #( `TIME_DELAY_2 + `FAN_OUT_1)		AND2(A2 ,in1 ,NT);		//AND operation between in1 and NT
		nand  #( `TIME_DELAY_3 + `PRIMARY_OUT)		NAND1(out1 ,NT ,A1 ,A2);   //NAND operation between NT, A1 and A2
		
endmodule


