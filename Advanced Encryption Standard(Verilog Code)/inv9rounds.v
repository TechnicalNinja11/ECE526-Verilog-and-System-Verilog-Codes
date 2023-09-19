/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Project                   Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** AES Encryption Decryption                                           *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: inv9rounds.v   Created by Avinash Damse,   2nd May 2023  *** 
 ***     								         					 	 *** 
 ***************************************************************************/ 

`timescale 1ns / 1ps
module inv_rounds9(clk,rcRound,keyin,keyOut,invRnd9state,invRndState);
input clk;
input [3:0] rcRound;
input [127:0] keyin;
input [127:0] invRnd9state;
output [127:0] keyOut;
output [127:0] invRndState;


wire [127:0] invm,invsh,invsb;

//1-9 rounds

keyExp s0(rcRound,keyin,keyOut);
inv_mixColumn s1(invRnd9state, invm);
shiftRow s2(invm,invsh);
inv_subBytes s3(invsh,invsb);

assign invRndState = invsb^keyOut;

endmodule
