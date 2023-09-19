/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #8             Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #8  ADDR                                                  *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: ADDR.v          reated by Avinash Damse, 15th May 2023   *** 
 ***    															      *** 
 ***************************************************************************/ 
 
 `timescale 1ns / 1ps

module ADDR(AD_out, A1, A2);
    
    parameter SIZE = 9;
    
    output reg [SIZE:0]AD_out;
    input [SIZE-1:0]A1;
    input [SIZE-1:0]A2;
    
    always @*
        AD_out = A1 + A2;
    
endmodule
