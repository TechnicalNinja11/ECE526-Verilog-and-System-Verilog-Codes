/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #5              Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #5                                                  *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: Top_tb.v         Created by Avinash Damse, 8st Mar 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 


`timescale 1 ns / 1 ns

module Top_tb();

		reg CLOCK, RESET, ENA;
		reg [2:0] LOAD;
		reg [7:0] DATA;
		wire [7:0] CNT;
		
		Top UUT(CNT, CLOCK, RESET, ENA, LOAD, DATA);
	
	initial begin
	
	$monitorb ("%d CNT = %h CLOCK = %b RESET = %b ENA = %b LOAD = %d DATA = %h", $time, CNT, CLOCK, RESET, ENA, LOAD, DATA);
	
	
	end
	
	always #10 CLOCK = ~CLOCK;
		
	initial begin
	
	$vcdpluson;
	
		RESET = 1'b1;
		LOAD = 3'd0;
		CLOCK = 1'b0;
		
		
		#3 RESET = 1'b0;
		
		#10 RESET = 1'b1; ENA = 1'b1; DATA = 8'd0; //starts counting till 8
		 
		
		 
		
		
		
		
		
		#100 $finish;
	end	
		
		
	
	
	
endmodule
		
		