/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #7            Avinash Damse, Spring, 2023       *** 
 ***                                                                     *** 
 *** Experiment #7  ROM                                              *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: ROM.v      reated by Avinash Damse,  6th April 2023  *** 
 ***    This module serves as a test bench for the module REG_F.v        *** 
 ***************************************************************************/ 
 `timescale 1 ns / 1 ns
 
 module ROM ( oe, cs, addr, data);
       parameter WIDTH=8;
	   parameter DEPTH = 16;
	   input wire [4:0] addr;
     input wire oe;
     input wire cs;
     output reg [WIDTH-1:0] data;
     
    reg [WIDTH-1:0] mem [0:DEPTH-1];
     
    initial $readmemh("INIT.txt", mem);
     
    always @ (posedge cs or posedge addr)
    begin
        if (cs == 1'b0)
        begin
            data <= mem[addr];
        end
    end
endmodule

