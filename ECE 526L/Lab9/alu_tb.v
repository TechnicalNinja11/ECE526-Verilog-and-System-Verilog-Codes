/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #9             Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #9  alu_tb                                               *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: alu_tb.v    Created by Avinash Damse,      2nd May 2023  *** 
 ***    This module models a Arithmatic Logic Unit with ADD, SUB, AND,   ***
 ***	OR, XOR and Negation opertation           					 	 *** 
 ***************************************************************************/ 
 
`timescale 1 ns / 100 ps
module alu_tb();
	reg EN, CLK, OE;
	reg [3:0] OPCODE;
	reg [7:0] A, B;
	wire CF, OF, SF, ZF;
	wire [7:0] ALU_OUT;
	alu UUT( CLK, EN, OE, OPCODE, A, B, ALU_OUT, CF, OF, SF, ZF );
	initial CLK = 1'b0;
	always #5 CLK = ~CLK;
	initial begin
		$vcdpluson;
		EN = 1'b0; OE = 1'b0; A = 8'd255; B = 8'd255; OPCODE = 4'b0000;
		$monitorb ("%d ALU_OUT = %b CF = %b OF = %b SF = %b ZF = %b OPCODE= %b A = %b B = %b EN = %b OE = %b", $time, ALU_OUT, CF, OF, SF, ZF, OPCODE, A, B, EN, OE);
		
		#3 EN = 1'b1; OE = 1'b1;
		$display("************************************************** Adiition *************************************************");
		#15 OPCODE = 4'b0010; // Carry propagation through addition
		#10 A = 8'd103; B = 8'd30; // Addition Overflow
		
		$display("**************************************************    XOR   *************************************************");
		#10 OPCODE = 4'b0110; // Bitwise XOR (regular)
		#10 A = 8'd0; B = 8'd0; // Bitwise XOR for all 0's
		
		$display("************************************************** Adiition *************************************************");
		#10 OPCODE = 4'b0010; // When carry is not present
		#10 A = 8'd245; B = 8'd90; 
		
		#10 EN = 1'b0; // unit disabled state
		
		#10 EN = 1'b1; // unit re-enabled
		$display("************************************************* Substraction ************************************************");
		#10 OPCODE = 4'b0011; // Subtraction with A > B (no borrow)
		#10 A = 8'd22; // Subtraction with A < B (borrrow) and overflow
		
		#10 OE = 1'b0; // Output disabled
		
		#10 OE = 1'b1; // Output Enabled
		
		$display("***************************************************   AND    **************************************************");
		#10 OPCODE = 4'b0100; // Bitwise AND
		
		$display("*****************************************************  OR  ****************************************************");
		#10 OPCODE = 4'b0101; // Bitwise OR
		
		$display("*********************************************** Undefined Opcode **********************************************");
		#10 OPCODE = 4'b1001; // undefined opcode should not change output
		
		$display("**************************************************  Negation  *************************************************");
		#10 OPCODE = 4'b0111; // Bitwise negation
		#50 $finish;
	end
endmodule
