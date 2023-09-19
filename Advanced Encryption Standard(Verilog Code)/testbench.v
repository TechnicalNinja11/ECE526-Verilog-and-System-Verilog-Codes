/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Project                   Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** AES Encryption Decryption                                           *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: testbench.v   Created by Avinash Damse,    2nd May 2023  *** 
 ***     								         					 	 *** 
 ***************************************************************************/ 

module testbench();
reg clk;

reg [127:0] i_data;
reg [127:0] keyIn;
wire [127:0] o_data;
wire [127:0] cipherkey;

reg [127:0] cipherText;
reg [127:0] cipherkey1;
wire [127:0] retData;
wire [127:0] origkey;





 

AesCore UUT(clk,i_data,keyIn,o_data,cipherkey);

InvAesCore UUT1(clk,cipherText,cipherkey,retData,origkey);

initial begin
		$vcdpluson;
		$display("***************************************************************************************************************");
		$display("************************************************** Encryption *************************************************");
		$display("***************************************************************************************************************");
		
		i_data = 128'h4669766520476d204372656174696e65; // Five Gm Creatine
		
		keyIn = 128'h49204c6f766520526f626f7473; // I Love Robots
		$monitorb ("%d Test_Data = %h Key = %h Output_Data = %h Cipher_Key = %h", $time, i_data, keyIn, o_data,cipherkey);
		
		#10
		
		
		$display("***************************************************************************************************************");
		$display("************************************************** Decryption *************************************************");
		$display("***************************************************************************************************************");
	    cipherText = 128'h590d5df67c08bebaf06b53ff3e8ad8dc;
		
		cipherkey1 = 128'h723853a35eccd87573c2bead339d256b;
		$monitorb ("%d Cipher_Text = %h   Cipher_Key = %h Ret_Data = %h Original_Key = %h", $time, cipherText, cipherkey1, retData, origkey);
		
		
		
	end

endmodule