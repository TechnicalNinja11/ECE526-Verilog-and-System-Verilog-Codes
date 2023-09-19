/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #8             Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #8  Exhaustive                                           *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: exhstv.v        reated by Avinash Damse, 15th May 2023   *** 
 ***  An exhaustive testbench								     	      *** 
 ***************************************************************************/ 
 
 `timescale 1ns / 1ps

`define INCLUDE_FORCE

module exhstv;

    parameter SIZE_2 =4;
    parameter SIZE_4 =8;
    parameter SIZE_3 =9;
    parameter SIZE_5 =10;

    reg  clk;
    reg  [SIZE_2-1:0]Data_in;
    reg  [SIZE_2-1:0]C0;
    reg  [SIZE_2-1:0]C1;
    reg  [SIZE_2-1:0]C2;
    reg  [SIZE_2-1:0]C3;
    wire [2*SIZE_2+1:0]Output;
    
	event sig;
	integer i;
	wire [2*SIZE_2+1:0]expec_out;
    
	non_hi_sop DUT(Output, Data_in, C0, C1, C2, C3, clk);
		
	always #5 clk=~clk;

	initial 
		begin
			$vcdpluson;
			clk=0;
			
			for(i=0;i<16;i=i+1) begin #10 Data_in=i; C0=$random; C1=$random; C2=$random; C3=$random; #40 ->sig; end
			for(i=0;i<16;i=i+1) begin #10 Data_in=$random; C0=i; C1=$random; C2=$random; C3=$random; #40 ->sig; end
			for(i=0;i<16;i=i+1) begin #10 Data_in=$random; C0=$random; C1=i; C2=$random; C3=$random; #40 ->sig; end
			for(i=0;i<16;i=i+1) begin #10 Data_in=$random; C0=$random; C1=$random; C2=i; C3=$random; #40 ->sig; end
			`ifdef INCLUDE_FORCE
				#10 force Data_in=0;
			`endif
			for(i=0;i<16;i=i+1) begin #10 Data_in=$random; C0=$random; C1=$random; C2=$random; C3=i; #40 ->sig; end
			#10 $finish;
		end
			
	initial $monitor("in=%d C0=%d C1=%d C2=%d C3=%d | actual_out=%d | expec_out=%d", Data_in, C0, C1, C2, C3, Output, expec_out);
	
	initial  
		for(i=0;i<80;i=i+1)
			begin
				#10 $monitoroff; #40 $monitoron;
				#10 $monitoroff; #40 $monitoron;
			end
	
	assign expec_out=((Data_in*C0)+(Data_in*C1))+((Data_in*C2)+(Data_in*C3));
			
endmodule
