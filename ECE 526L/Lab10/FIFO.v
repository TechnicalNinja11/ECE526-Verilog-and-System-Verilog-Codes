/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #10   			 Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #10                   		                             *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: FIFO.v  	 Created by Avinash Damse,      15 May 2023  *** 
 ***																	 ***
 ***									           					 	 *** 
 ***************************************************************************/ 
 


`timescale 1ns/1ns
module sync_fifo
  #(
    parameter depth = 32,
    parameter width = 8,
    parameter log2_depth = $clog2(depth),
    parameter log2_depthp1 = $clog2(depth+1)
    )
  (
   input clk,
   input reset,
   input wr_enable,
   input rd_enable,
   output reg empty,
   output reg full,
   output [width-1:0] rd_data,
   input [width-1:0] wr_data,
   output reg [log2_depthp1-1:0] count
   );
   
   integer increment;
	// Local function returns ceiling of the log base two of its inputs, next one is used to read or write pointers

 function integer my_clog2(input [31:0] value);
    integer i;
    i = $clog2(value);
endfunction


	// Read and Writer pointers

  wire writing = wr_enable && (rd_enable || !full);
  wire reading = rd_enable && !empty;
	// read pointer

  reg [log2_depth-1:0] rd_ptr;
  reg [log2_depth-1:0] next_rd_ptr;
  always @(*)
    if (reset)
      next_rd_ptr = 0;
    else if (reading)
      next_rd_ptr = increment + rd_ptr;
    else
      next_rd_ptr = rd_ptr;
	// writer pointer

  reg [log2_depth-1:0] wr_ptr;
  reg [log2_depth-1:0] next_wr_ptr;
  always @(*)
    if (reset)
      next_wr_ptr = 0;
    else if (writing)
      next_wr_ptr = increment + wr_ptr;
    else
      next_wr_ptr = wr_ptr;

  always @(posedge clk)
    wr_ptr <= next_wr_ptr;
	// Used a counter to track read and write pointers

  always @(posedge clk)
    if (reset)
      count <= 0;
    else if (writing && !reading)
      count <= count+1;
    else if (reading && !writing)
      count <= count-1;
  always @(posedge clk)
    if (reset)
      empty <= 1;
    else if (reading && next_wr_ptr == next_rd_ptr && !full)
      empty <= 1;
    else
      if (writing && !reading)
	      empty <= 0;
  
  always @(posedge clk)
    if (reset)
      full <= 0;
    else if (writing && next_wr_ptr == next_rd_ptr)
      full <= 1;
    else if (reading && !writing)
      full <= 0;
	// memory

  reg [width-1:0] mem [depth-1:0];
  always @(posedge clk)
    begin
      if (writing)
        mem[wr_ptr] <= wr_data;
      rd_ptr <= next_rd_ptr;
    end

  assign rd_data = mem[rd_ptr];
endmodule


