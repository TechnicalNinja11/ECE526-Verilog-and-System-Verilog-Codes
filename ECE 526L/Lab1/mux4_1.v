/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #1                 Avinnash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #1 title                                                 *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: mux4_1.v         Created by Avinash Damse, 5th Feb 2023  *** 
 ***                                                                     *** 
 ***************************************************************************/
     This module models a 4:1 mux :                                      ***                          
 ***************************************************************************/ 




`timescale 1 ns / 1 ns

module mux4_1(out,			// Mux output
				a,          // mux input
				b,			// mux input
				c,			// mux input
				d,			// mux input
				s0,			// Select signal
				s1);	    // Select signal

output out;						   // Declare the  output 
input a, b, c, d, s0, s1;		   // Declare the inputs 
wire s0_n, s1_n, T1, T2, T3, T4;   // Declare signal type

not (s0_n, s0), (s1_n, s1);
and (T1, a, s0_n, s1_n), (T2, b, s0_n, s1),(T3, c, s0,s1_n),(T4, d, s0, s1);
or(out, T1, T2, T3, T4);

endmodule