/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #8             Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #8  MULT                                                  *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: MULT.v          reated by Avinash Damse, 15th May 2023   *** 
 ***    															      *** 
 ***************************************************************************/ 
 
`timescale 1ns / 1ps

module MULT(out, M, C);

    parameter SIZE_C = 4;
    
    output reg [2*SIZE_C-1:0]out;
    input [SIZE_C-1:0]M;
    input [SIZE_C-1:0]C;
    
    always @*
        out[2*SIZE_C-1:0] = M * C;

endmodule
