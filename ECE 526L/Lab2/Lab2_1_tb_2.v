/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #2                 Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #2 title                                                 *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: Lab2_1_tb.v         Created by Avinash Damse, 8th Feb 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 


`timescale 1 ns / 1 ns

`define MONITOR_STR_1 "%d:  in1 = %b,  in2 = %b,  A1 = %b,  A2 = %b, NT = %b, N1 = %b,  |  out1 = %b"



module Lab2_1_tb();
		reg in1,  in2;
		wire  out;
		Lab2_1  UUT(in1,in2,out);
		
		initial begin
				$monitor(`MONITOR_STR_1, $time, in1, in2, UUT.A1, UUT.A2, UUT.NT, UUT.N1, UUT.out1);   //Displaying in waveform
		end
		
		initial begin
		$vcdpluson;
		#15  in1 = 1'b0;
			 in2 = 1'b0;
		#15  in1 = 1'b0;
			 in2 = 1'b1;
		#15  in1 = 1'b1;
			 in2 = 1'b0;
		#15  in1 = 1'b1;
			 in2 = 1'b1;
			 
			 
		#15 $finish;
		end
endmodule
		