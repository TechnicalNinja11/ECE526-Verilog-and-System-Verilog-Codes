/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #3                 Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #4 D Flipflop                                                *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: DFF.v      Created by Avinash Damse, 15th Feb 2023  *** 
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



module dff (q, qbar, clock, data, clear);

		output q;
		output qbar;
		input clock, data, clear;
		wire dbar,d,rbar,r,clkbar,clk,cbar,clr,s,sbar;
		
	
		not #( `TIME_DELAY_1 + `FAN_OUT_1 ) NOT1(dbar,data);   //not operation
		not #( `TIME_DELAY_1 + `FAN_OUT_1 ) NOT2(clkbar,clock);  //not operation
		not #( `TIME_DELAY_1 + `FAN_OUT_1 ) NOT3(cbar,clear);   //not operation
		not #( `TIME_DELAY_1 + `FAN_OUT_1 ) NOT4(d,dbar);   //not operation
		not #( `TIME_DELAY_1 + `FAN_OUT_2 ) NOT5(clk, clkbar);   //not operation
		not #( `TIME_DELAY_1 + `FAN_OUT_3 ) NOT6(clr,cbar);   //not operation
		
		defparam SR_Latch2.NAND_DELAY1=`TIME_DELAY_3  + `FAN_OUT_2;
		defparam SR_Latch2.NAND_DELAY2=`TIME_DELAY_3  + `FAN_OUT_2;
		SR_Latch2 L1(rbar, 1'b1, clr, clk, sbar, s);  //SR_Latch for DFF with output s and sbar
		
		SR_Latch2 L2(s, clk, clr, d, r, rbar);    //SR_Latch for DFF with output r and rbar
		
		SR_Latch2 L3(s, 1'b1, clr, r, q, qbar);   //SR_Latch for DFF with final output q and qbar


		
		
		
endmodule
