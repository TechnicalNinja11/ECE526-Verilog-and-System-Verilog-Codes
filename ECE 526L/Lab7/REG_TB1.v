/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #7            Avinash Damse, Spring, 2023       *** 
 ***                                                                     *** 
 *** Experiment #7  REG_TB1                                              *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: REG_TB1.v      reated by Avinash Damse,  6th April 2023  *** 
 ***    This module serves as a test bench for the module REG_F.v        *** 
 ***************************************************************************/ 
 `timescale 1 ns / 1 ns
 
module REG_TB1();
	reg OE, WS, CS;
	reg [4:0] ADDR;
	wire [7:0] DATA;
	integer count1;
	reg [7:0] a;
	
	REG_F UUT(DATA, ADDR, OE, WS, CS);
	
	assign DATA = !OE && !CS ? a : 8'bz;
	
	initial
	$monitorb ("%d DATA = %d, ADDR = %d, OE = %b, WS = %b, CS = %b", $time, DATA, ADDR, OE, WS, CS);
	
	initial begin
	$vcdpluson;
		CS = 1'b1; OE = 1'b0; WS = 1'b0; ADDR = 5'b0; a = 8'd30;
		#6 CS = 1'b0;
		for (count1 = 0; count1 < 32; count1 = count1 + 1) 
		begin
			a = a + 8'd1;
			ADDR = count1;
			//Individual read and write
			#6 WS = 1'b1;
			#2 WS = 1'b0;
			#6 OE = 1'b1;
			#2 OE = 1'b0;
		end
		
		#2 OE = 1'b1;
		$monitorb ("%d DATA = %d, ADDR = %d, OE = %b, WS = %b, CS = %b", $time, 
		DATA, ADDR, OE, WS, CS);
		for (count1 = 4; count1 < 11; count1 = count1 + 1) 
		begin 					// block read
			ADDR = count1;
			if (count1 == 7)	 // Chip select inactive
			#2 CS = 1'b1;
			else
			#2 CS = 1'b0;
		end
	end
endmodule

