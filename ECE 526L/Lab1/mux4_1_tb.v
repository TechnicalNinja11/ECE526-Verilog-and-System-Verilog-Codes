/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #1                 Avinnash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #1 title                                                 *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: mux4_1_tb.v      Created by Avinash Damse, 5th Feb 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 


`timescale 1 ns / 1 ns

module mux4_1_tb();
		reg A, B, C, D, SEL0, SEL1;
		wire OUT;
		
		mux4_1 UUT(OUT, A, B ,C, D, SEL0, SEL1);
		
		initial
		$monitorb ("%d OUT= %b A= %b B= %b C= %b D= %b SEL0= %b SEL1= %b", $time, OUT, A, B, C, D, SEL0, SEL1);
		initial begin
		$vcdpluson;
		A=1; B=1; C=1; D=1; SEL0=1'bx; SEL1=1'bx;
		#10 A=0; B=1; C=0; D=1; SEL0=0; SEL1=0;
		#20 SEL0=0; SEL1=1;
		#20 SEL0=1; SEL1=0;
		#20 SEL0=1; SEL1=1;
		#10 A=1; B=0; C=1; D=0; SEL0=0; SEL1=0;
		#20 SEL0=0; SEL1=1;
		#20 SEL0=1; SEL1=0;
		#20 SEL0=1; SEL1=1;
		#10 A=1; B=0; C=1; D=0; SEL0=1'bz; SEL1=1'bz;
		#20 SEL0=0; SEL1=0;
		#20 SEL0=0; SEL1=1;
		#20 SEL0=1; SEL1=0;
		#20 SEL0=1; SEL1=1;
		#20 $finish;
		end
endmodule

