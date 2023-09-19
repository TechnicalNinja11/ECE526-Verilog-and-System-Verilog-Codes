/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #6             Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #6  mux_tb                                               *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: mux_tb.v      Created by Avinash Damse, 29th March 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 
 
 `timescale 1 ns / 1 ns
 module mux_tb();
	reg [3:0] A, B;		//input reg
	wire [3:0] OUT6;	//wire
	wire [2:0] OUT5;
	wire [1:0] OUT4;
	wire  OUT1;
	reg SEL;
	
	
	mux SM1 (A[0], B[0], SEL, OUT1); //instatntiation of mux
	mux #(2) SM4(A[1:0], B[1:0], SEL, OUT4);
	mux #(.SIZE(3)) SM5(A[2:0], B[2:0], SEL, OUT5);
	defparam SM6.SIZE = 4;
	mux SM6 (A, B, SEL, OUT6);
	
	
	initial begin
		A = 4'b1010;
		B = 4'b0011;
		SEL = 1'b0;
		
	end
	
	initial begin
		$monitorb("%d A = %b B = %b SEL = %b OUT1 = %b OUT4 = %b OUT5 = %b OUT6 = %b", $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
		

	end
	
	initial begin
	
		$vcdpluson;
		$display("******************************** SEL = 0 *******************************");
		#10 A = 4'b1011; B = 4'b0100; //A != B
		#10 B = 4'b1011;  // A =B
		$display("******************************** SEL = 1 *******************************");
		#10 SEL = 1'b1;
		#10 A = 4'b1011; B = 4'b0100; //A != B
		#10 B = 4'b1011;  // A =B
		$display("******************************** A != B *******************************");
		#10 SEL = 1'bx;
		#10 A = 4'b1001; B = 4'b0110; //A != B
		#10 A = 4'b1011; B = 4'b1100; //A != B
		$display("******************************** A = B *******************************");
		#10 SEL = 1'bx;
		#10 A = 4'b1101; B = 4'b1101; //A = B
		#10 A = 4'b1001; B = 4'b1001; //A = B
		#10 $finish;
	end
 
 endmodule