/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #4                 Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #4 REG_test                                              *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: REG_test.v       Created by Avinash Damse, 15th Feb 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 


`timescale 1 ns / 100 ps

`define clock 40

module REG_test();
	reg CLK, ENA, RST;
	reg [7:0] DATA;
	wire [7:0] R;
	
	REGISTER UUT(CLK, RST, ENA, DATA, R);
	
	initial begin 
		CLK = 1'b0;
		RST = 1'b0;
		ENA = 1'b0;
	end
	
	initial
	begin
	forever #(`clock/2) CLK = ~CLK;
	end
	
	always@ (posedge CLK)
		$monitor("%d R= %b CLK = %b DATA = %b", $time, R, CLK, DATA);
		
	
	initial begin     
		$vcdpluson;		//for graphical viewer
			$monitor("\t\t\t**********************************************************************\t\t\t");
			$monitor("\t\t\t****************************Simulation********************************\t\t\t");
			#100 RST = 1'b0; ENA = 1'b0; DATA = 8'b00000000;
			#100 RST = 1'b0; ENA = 1'b1; DATA = 8'b11111111;
			
			
			$monitor("\t\t\t**********************************************************************\t\t\t");
			$monitor("\t\t\t***************************ENABLE LOW********************************\t\t\t");
			#160 RST = 1'b1; ENA = 1'b0; DATA = 8'b10101010;
			#160 RST = 1'b1; ENA = 1'b0; DATA = 8'b00001111;
			#160 RST = 1'b1; ENA = 1'b0; DATA = 8'b11110000;
			#160 RST = 1'b1; ENA = 1'b0; DATA = 8'b11111111;
			
			$monitor("\t\t\t**********************************************************************\t\t\t");
			$monitor("\t\t\t***************************ENABLE HIGH********************************\t\t\t");
			#160 RST = 1'b1; ENA = 1'b1; DATA = 8'b10101010;
			#160 RST = 1'b1; ENA = 1'b1; DATA = 8'b00001111;
			#160 RST = 1'b1; ENA = 1'b1; DATA = 8'b11110000;
			#160 RST = 1'b1; ENA = 1'b1; DATA = 8'b11111111;
			
			$monitor("%d DATA = %b", $time, DATA);
			$monitor("%d R = %b", $time, R);
			
			
			#100 $finish;
			
	end
	
endmodule