/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #8             Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #8  Non-hierarchical                                     *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: non_exhstv.v    created by Avinash Damse, 15th May 2023  *** 
 ***  Non exhaustive testbench								    	      *** 
 ***************************************************************************/ 
 
 `timescale 1ns / 1ps

module non_hi_sop(Output, Data_in, C0, C1, C2, C3, clk);

    parameter SIZE_2 =4;
    parameter SIZE_4 =8;
    parameter SIZE_3 =9;
    parameter SIZE_5 =10;

    input clk;
    input [SIZE_2-1:0]Data_in;
    input [SIZE_2-1:0]C0;
    input [SIZE_2-1:0]C1;
    input [SIZE_2-1:0]C2;
    input [SIZE_2-1:0]C3;
    output reg [2*SIZE_2+1:0]Output;
    
    wire [SIZE_2-1:0]i1;
    wire [2*SIZE_2-1:0]i2;
    wire [SIZE_2-1:0]i3;
    wire [2*SIZE_2-1:0]i4;
    wire [SIZE_2-1:0]i5;
    wire [2*SIZE_2-1:0]i6;
    wire [SIZE_2-1:0]i7;
    wire [2*SIZE_2-1:0]i8;
    
    wire [2*SIZE_2:0]i9;
    wire [2*SIZE_2:0]i10;
    
    wire [2*SIZE_2+1:0]int;
    

    REG #(.SIZE(SIZE_2)) DU1(.q(i1), .data(Data_in), .clk(clk));
    
    MULT #(.SIZE_C(SIZE_2)) DU2(.out(i2), .M(i1), .C(C0));
    
    REG #(.SIZE(SIZE_2)) DU3(.q(i3), .data(i1), .clk(clk));
    
    MULT #(.SIZE_C(SIZE_2)) DU4(.out(i4), .M(i3), .C(C1));
    
    REG #(.SIZE(SIZE_2)) DU5(.q(i5), .data(i3), .clk(clk));
    
    MULT #(.SIZE_C(SIZE_2)) DU6(.out(i6), .M(i5), .C(C2));
    
    REG #(.SIZE(SIZE_2)) DU7(.q(i7), .data(i5), .clk(clk));
    
    MULT #(.SIZE_C(SIZE_2)) DU8(.out(i8), .M(i7), .C(C3));
    
    ADDR #(.SIZE(SIZE_4)) DU9 (.AD_out(i9), .A1(i2), .A2(i4));
    
    ADDR #(.SIZE(SIZE_4)) DU10 (.AD_out(i10), .A1(i6), .A2(i8));
    
    ADDR #(.SIZE(SIZE_3)) DU11 (.AD_out(int), .A1(i9), .A2(i10));

    always @*
        assign Output = int;

endmodule
