
/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #3                 Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #3 D Flipflop                                                 *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: DFF_tb.v      Created by Avinash Damse, 15th Feb 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 




`timescale 1 ns / 1 ns

`define MONITOR_STR_1 "%d:  clock = %b,  clear = %b,  data = %b, dbar = %b,  d = %b,  rbar = %b, r = %b,  clkbar = %b,  clk = %b, cbar = %b,  clr = %b,  s = %b,  |  q = %b, qbar = %b"



module DFF_tb();
		reg  clock, data, clear;  // inputs
		wire q, qbar;  // outputs
		dff  UUT(q, qbar, clock, data, clear);
		
		always @(posedge clock);

		initial begin
				$monitor(`MONITOR_STR_1, $time, clock, clear, data, UUT.dbar, UUT.d, UUT.rbar, UUT.r, UUT.clkbar, UUT.clk, UUT.cbar, UUT.clr, UUT.s, q, qbar );
		end
		
		initial begin
		$vcdpluson;
		#15  data = 1'b0;
			 clear = 1'b0;
			 clock = 1'b0;
		#15  data = 1'b0;
			 clear = 1'b1;
			 clock = 1'b1;
		#15  data = 1'b1;
			 clear = 1'b1;
			 clock = 1'b0;
		#15  data = 1'b1;
			 clear = 1'b1;
			 clock = 1'b1;
			 
		#15 $finish;
		end
endmodule