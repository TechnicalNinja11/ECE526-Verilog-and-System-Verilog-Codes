/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #4                 Avinash Damse, Spring, 2023 *** 
 ***                                                                     *** 
 *** Experiment #4 REGISTER                                                *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: REGISTER.v      Created by Avinash Damse, 15th Feb 2023  *** 
 ***    --- revision history, if any, goes here ---                      *** 
 ***************************************************************************/ 


`timescale 1 ns / 100 ps

module REGISTER(CLK, RST, ENA, DATA, R);
	input CLK, RST, ENA;	//input
	input [7:0] DATA;		//input
	output [7:0] R;			//output
	
	wire [7:0] IN;	//internal wires
	wire [7:0] R_bar;	
	
	MUX2_1 M0(IN[0], DATA[0], R[0], ENA );		//MUX for R[0]
	dff D0(R[0], R_bar[0], CLK, IN[0], RST );	//D flip flop for R[0]
	
	MUX2_1 M1(IN[1], DATA[1], R[1], ENA );		//MUX for R[1]
	dff D1(R[1], R_bar[1], CLK, IN[1], RST );	//D flip flop for R[1]
	
	MUX2_1 M2(IN[2], DATA[2], R[2], ENA );		//MUX for R[2]
	dff D2(R[2], R_bar[2], CLK, IN[2], RST );	//D flip flop for R[2]
	
	MUX2_1 M3(IN[3], DATA[3], R[3], ENA );		//MUX for R[3]
	dff D3(R[3], R_bar[3], CLK, IN[3], RST );	//D flip flop for R[3]
	
	MUX2_1 M4(IN[4], DATA[4], R[4], ENA );		//MUX for R[4]
	dff D4(R[4], R_bar[4], CLK, IN[4], RST );	//D flip flop for R[4]
	
	MUX2_1 M5(IN[5], DATA[5], R[5], ENA );		//MUX for R[5]
	dff D5(R[5], R_bar[5], CLK, IN[5], RST );	//D flip flop for R[5]
	
	MUX2_1 M6(IN[6], DATA[6], R[6], ENA );		//MUX for R[6]
	dff D6(R[6], R_bar[6], CLK, IN[6], RST );	//D flip flop for R[6]
	
	MUX2_1 M7(IN[7], DATA[7], R[7], ENA );		//MUX for R[7]
	dff D7(R[7], R_bar[7], CLK, IN[7], RST );	//D flip flop for R[7]
	
	
	
	
	
endmodule