/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #8             Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #8  Non-Exhaustive                                       *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: non_exhstv.v    created by Avinash Damse, 15th May 2023  *** 
 ***  non-hierarchical sum of products							   	      *** 
 ***************************************************************************/ 
 
 `timescale 1ns / 1ps

module non_exhstv;

    parameter SIZE_2 =4;
    parameter SIZE_4 =8;
    parameter SIZE_3 =9;
    parameter SIZE_5 =10;

    reg  clk;
    reg  [SIZE_2-1:0]Data_in;
    reg  [SIZE_2-1:0]C0;
    reg  [SIZE_2-1:0]C1;
    reg  [SIZE_2-1:0]C2;
    reg  [SIZE_2-1:0]C3;
    wire [2*SIZE_2+1:0]Output;
    
	event sig;
	integer i;
	wire [2*SIZE_2+1:0]expec_out;
		
	non_hi_sop DUT(Output, Data_in, C0, C1, C2, C3, clk);
	
	always #5 clk=~clk;

	initial 
		begin
			$vcdpluson;
			clk=0;
			
			#10 Data_in=1; C0=1; C1=1; C2=1; C3=1; #40 ->sig; 
			#10 Data_in=2; C0=2; C1=2; C2=2; C3=2; #40 ->sig; 
			#10 Data_in=3; C0=3; C1=3; C2=3; C3=3; #40 ->sig; 
			#10 Data_in=4; C0=4; C1=4; C2=4; C3=4; #40 ->sig; 
			#10 Data_in=5; C0=5; C1=5; C2=5; C3=5; #40 ->sig; 
			#10               
			#10 Data_in=4; C0=1; C1=2; C2=3; C3=4; #40 ->sig; 
			#10 Data_in=5; C0=2; C1=3; C2=4; C3=5; #40 ->sig; 
			#10 Data_in=6; C0=3; C1=4; C2=5; C3=6; #40 ->sig; 
			#10 Data_in=7; C0=4; C1=5; C2=6; C3=7; #40 ->sig; 
			#10 Data_in=8; C0=5; C1=6; C2=7; C3=8; #40 ->sig; 
			#10 $finish;
		end
			
			
	always @(sig) $display("in=%d C0=%d C1=%d C2=%d C3=%d | actual_out=%d | expec_out=%d", Data_in, C0, C1, C2, C3, Output, expec_out);
		
	assign expec_out=((Data_in*C0)+(Data_in*C1))+((Data_in*C2)+(Data_in*C3));
			
endmodule
