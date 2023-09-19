/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Project                   Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** AES Encryption Decryption                                           *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: testbench1.v  Created by Avinash Damse,    2nd May 2023  *** 
 ***     								         					 	 *** 
 ***************************************************************************/ 

module testbench2();
reg clk;

reg [127:0] cipherText;
reg [127:0] cipherkey;
wire [127:0] retData;
wire [127:0] origkey;



InvAesCore UUT(clk,cipherText,cipherkey,retData,origkey);

initial begin
		$vcdpluson;
		
		$display("***************************************************************************************************************");
		$display("************************************************** Decryption *************************************************");
		$display("***************************************************************************************************************");
		
	    cipherText = 128'h590d5df67c08bebaf06b53ff3e8ad8dc;
		
		cipherkey = 128'h723853a35eccd87573c2bead339d256b;
		$monitorb ("%d Cipher_Text = %h   Cipher_Key = %h Ret_Data = %h Original_Key = %h", $time, cipherText, cipherkey, retData, origkey);
		
		
	end

endmodule