/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #7            Avinash Damse, Spring, 2023       *** 
 ***                                                                     *** 
 *** Experiment #7  REG_TB2                                              *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: REG_TB2.v      reated by Avinash Damse,  6th April 2023  *** 
 ***   This module serves as a test bench for the module REG_F.v         *** 
 ***************************************************************************/ 
 `timescale 1 ns / 1 ns
 
module REG_TB2();

	reg OE, WS, CS, hold1, hold2;
	reg [4:0] ADDR;
	wire [7:0] DATA;
	integer count;
	reg [7:0] mem[0:31];
	reg [7:0] a, b;
	
	REG_F UUT(DATA, ADDR, OE, WS, CS);
	
	assign DATA = !OE ? a : 8'bz;
	
	
	
	initial begin
		$vcdpluson;
		CS = 1'b0; WS = 1'b0; OE = 1'b0; ADDR = 5'b0; a = 8'b0;
		$readmemh("INIT.txt", mem);
		for (count = 0; count < 32; count = count + 1) 
		begin
		a = mem[count];
		ADDR = count;
		#6 WS = 1'b1;
		#2 WS = 1'b0;
		end
	// Read
		#4 OE = 1'b1;
		for (count = 0; count < 32; count = count + 1) 
		begin
			ADDR = count;
			#2 $display("DATA = %h, ADDR = %h", DATA, ADDR);
		end
	// Original
		#2 $display("***********Original***********");
		for (count = 16; count < 24; count = count + 1) 
		begin
			ADDR = count;
			#2 $display("DATA = %h, ADDR = %h", DATA, ADDR);
		end
	//Scrambler
		for (count = 16; count < 24; count = count + 1) 
		begin
		ADDR = count;
		#2 b = DATA;
		#1 hold1 = b[0]; hold2 = b[1];
		#1 b[0] = b[4]; b[1] = b[3];
		#1 b[4] = b[6]; b[3] = b[2];
		#1 b[6] = b[7]; b[2] = b[5];
		#1 b[7] = hold1; b[5] = hold2;
		#2 OE = 1'b0;
		#2 a = b;
		#2 WS = 1'b1;
		#2 WS = 1'b0;
		#2 OE = 1'b1;
		end
	// Scrambled memory bytes
		#2 $display("***********Scrambled***********");
		for (count = 16; count < 24; count = count + 1) 
		begin
		ADDR = count;
		#2 $display("DATA = %h, ADDR = %h", DATA, ADDR);
		end
	end
endmodule