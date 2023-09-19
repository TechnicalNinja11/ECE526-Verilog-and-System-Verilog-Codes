
/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #3                 Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #3 title                                                 *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: SR_Latch2.v      Created by Avinash Damse, 15th Feb 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 




`timescale 1 ns / 1 ns

`define MONITOR_STR_1 "%d:  s0 = %b,  s1 = %b,  r0 = %b,  r1 = %b,  |  Q = %b, Qnot = %b"



module SR_Latch2_tb();
		reg  s0, s1, r0, r1;
		wire  Q, Qnot;
		SR_Latch2 UUT(Q,Qnot);
		
		initial begin
				$monitor(`MONITOR_STR_1, $time, s0, s1, r0, r1, Q, Qnot );
		end
		
		initial begin
		$vcdpluson;
		#15  s0 = 1'b0;
			 s1 = 1'b0;
		#15  s0 = 1'b0;
			 s1 = 1'b1;
		#15  r0 = 1'b0;
			 r1 = 1'b0;
		#15  r0 = 1'b0;
			 r1 = 1'b1;
			 
			 
		#15 $finish;
		end
endmodule