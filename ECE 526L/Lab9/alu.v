/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #9             Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #9  alu                                                  *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: alu.v       Created by Avinash Damse,      2nd May 2023  *** 
 ***    This module models a Arithmatic Logic Unit with ADD, SUB, AND,   ***
 ***	OR, XOR and Negation opertation           					 	 *** 
 ***************************************************************************/ 
 
`timescale 1 ns / 100 ps

module alu ( CLK, EN, OE, OPCODE, A, B, ALU_OUT, CF, OF, SF, ZF );
	
	parameter WIDTH = 8;
	output reg [WIDTH-1:0] ALU_OUT;
	output reg CF, OF, SF, ZF;
	input [3:0] OPCODE;
	input [WIDTH-1:0] A, B;
	input CLK, EN, OE;
	reg [WIDTH-1:0] I_OUT;
	reg CX, OX;
	
 
	localparam ADD = 4'b0010;
	localparam SUB = 4'b0011;
	localparam AND = 4'b0100;
	localparam OR = 4'b0101;
	localparam XOR = 4'b0110;
	localparam NOTA = 4'b0111;
 
	always @ (posedge CLK) 
	begin
	if (!EN) 
	begin
		ALU_OUT <= ALU_OUT;
		CF <= CF;
		OF <= OF;
		SF <= SF;
		ZF <= ZF;
	end
	else 
	begin
		case (OPCODE)
			ADD: begin
				I_OUT <= A+B;
				if ((A[WIDTH-1] && !I_OUT[WIDTH-1]) || (A[WIDTH-1] && B[WIDTH-1]) || 
				(B[WIDTH-1] && !I_OUT[WIDTH-1]))
				CX <= 1'b1;
				else CX <= 1'b0;
				// Overflow flag determination
				if(!A[WIDTH-1] && !B[WIDTH-1] && I_OUT[WIDTH-1])
				OX <= 1'b1;
				else if (A[WIDTH-1] && B[WIDTH-1] && !I_OUT[WIDTH-1])
				OX <= 1'b1;
				else
				OX <= 1'b0;
				end
				
			SUB: begin
				I_OUT <= A-B;
				if (A < B) CX <= 1'b1;
				else CX <= 1'b0;
				// Overflow flag determination
				if(!A[WIDTH-1] && !B[WIDTH-1] && I_OUT[WIDTH-1])
				OX <= 1'b1;
				else if (A[WIDTH-1] && B[WIDTH-1] && !I_OUT[WIDTH-1])
				OX <= 1'b1;
				else
				OX <= 1'b0;
				end
					
			AND: begin 
				I_OUT <= A & B; CX <= 1'b0; OX <= 1'b0; 
				end
					
			OR : begin 
				I_OUT <= A | B; CX <= 1'b0; OX <= 1'b0; 
				end
				
			XOR: begin 
				I_OUT <= A ^ B; CX <= 1'b0; OX <= 1'b0; 
				end
				
			NOTA: begin 
				I_OUT <= ~A; CX <= 1'b0; OX <= 1'b0; 
				end
				
			default: begin 
				I_OUT <= I_OUT; CX <= CX; OX <= OX; 
				end
		endcase
		// Output assigment
		
		
		assign ALU_OUT = OE?I_OUT: 'bz;
 
		// Carry flag
		CF <= CX;
		// Overflow flagd
		OF <= OX;
		SF <= I_OUT[WIDTH-1]; // Negative flag determination
		ZF <= !(|I_OUT); // Zero flag determination
 
	end
	end
endmodule
