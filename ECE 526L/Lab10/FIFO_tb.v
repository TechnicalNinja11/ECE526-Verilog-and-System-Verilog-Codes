/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Experiment #10   			 Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** Experiment #10                   		                             *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: FIFO_tb.v		Created by Avinash Damse,      15 May 2023  *** 
 ***																	 ***
 ***									           					 	 *** 
 ***************************************************************************/ 
 

`timescale 1ns/1ns

module sync_fifo_tb;

// Parameters
localparam DEPTH = 8;
localparam WIDTH = 8;

// Inputs
reg clk;
reg reset;
reg wr_enable;
reg rd_enable;
reg [WIDTH-1:0] wr_data;

// Outputs
wire empty;
wire full;
wire [WIDTH-1:0] rd_data;
wire [5:0] count;

integer i; 

// Instantiate the Unit Under Test (UUT)
sync_fifo uut (
    .clk(clk),
    .reset(reset),
    .wr_enable(wr_enable),
    .rd_enable(rd_enable),
    .empty(empty),
    .full(full),
    .rd_data(rd_data),
    .wr_data(wr_data),
    .count(count)
);

initial begin
$vcdpluson;
    // Initialize inputs
    clk = 0;
    reset = 1;
    wr_enable = 0;
    rd_enable = 0;
    wr_data = 0;

    // Wait for 100 ns for global reset to finish
    #100 reset = 0;

    // Test Case 1: Test empty flag
    wr_enable = 1;
    #10 wr_data = 8'hAA;
    #10 wr_enable = 0;
    #10 rd_enable = 1;
    #10 $display("Empty flag=%b", empty);
    #10 rd_enable = 0;

    // Test Case 2: Test full flag
    wr_enable = 1;
    rd_enable = 1;
    #10 wr_data = 8'hBB;
    #10 $display("Full flag=%b", full);
    #10 rd_enable = 0;
    #10 wr_enable = 0;

    // Test Case 3: Test simultaneous write and read in the middle
    wr_enable = 1;
    wr_data = 8'hCC;
    rd_enable = 1;
	#10 $display("Test simultaneous write and read in the middle:");
    #10 $display("Read data=%h, Write data=%h", rd_data, wr_data);
    #10 wr_enable = 0;
    #10 rd_enable = 0;

    // Test Case 4: Test writing and reading at all locations
    // Write data
    wr_enable = 1;
    for (i = 0; i < DEPTH; i = i + 1) begin
        wr_data = i;
        #10;
    end
    wr_enable = 0;

    // Read data
	#10 $display("Test writing and reading at all locations:");
    rd_enable = 1;
    for ( i = 0; i < DEPTH; i = i + 1) begin
        #10 $display("Read data=%h, Expected data=%h", rd_data, i);
    end
    rd_enable = 0;

    // Test Case 5: Test count and valid behaviors
    wr_enable = 1;
    wr_data = 8'hDD;
    #10 wr_data = 8'hEE;
    #10 wr_data = 8'hFF;
    wr_enable = 0;
    rd_enable = 1;
	#10 $display("Test writing and reading at all locations:");
    #10 $display("Count=%d, Empty=%b, Full=%b", count, empty, full);
    #10 rd_enable = 0;

    // End simulation
    #10 $finish;
end

// Clock generation
always #5 clk = ~clk;

endmodule


