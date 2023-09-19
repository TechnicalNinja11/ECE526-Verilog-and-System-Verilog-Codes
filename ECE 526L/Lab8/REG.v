/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #8             Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #8  REG                                                  *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: REG.v          reated by Avinash Damse, 15th May 2023    *** 
 ***    															     *** 
 ***************************************************************************/ 
 
`timescale 1ns / 1ps

module REG(q, qbar, data, clk, rst);
    
    parameter SIZE =4;
    
    input [SIZE-1:0]data;
    input clk;
    input rst;
    output reg [SIZE-1:0]q;
    output reg [SIZE-1:0]qbar;
    
    always @*            // trigger at any signal change
        begin
        if ( rst == 1)    // reset is active high 
            begin
                q <= 0;
                qbar <= 1;
            end
        else
            begin
                q <= data;
                qbar <= !data;
            end
    end
    
endmodule
