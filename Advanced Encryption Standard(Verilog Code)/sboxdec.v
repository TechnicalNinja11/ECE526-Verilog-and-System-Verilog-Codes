/*************************************************************************** 
 ***                                                                     *** 
 *** EE 526 L Project                   Avinash Damse, Spring, 2023      *** 
 ***                                                                     *** 
 *** AES Encryption Decryption                                           *** 
 ***                                                                     *** 
 *************************************************************************** 
 ***  Filename: sboxdec.v      Created by Avinash Damse,   2nd May 2023  *** 
 ***     								         					 	 *** 
 ***************************************************************************/ 

module inv_sbox(subout,subin);

input [7:0] subout;
output reg [7:0] subin;


always@(*)

case(subout)
8'h00:subin =8'h52;
8'h01:subin =8'h09;
8'h02:subin =8'h6a;
8'h03:subin =8'hd5;
8'h04:subin =8'h30;
8'h05:subin =8'h36;
8'h06:subin =8'ha5;
8'h07:subin =8'h38;
8'h08:subin =8'hbf;
8'h09:subin =8'h40;
8'h0a:subin =8'ha3;
8'h0b:subin =8'h9e;
8'h0c:subin =8'h81;
8'h0d:subin =8'hf3;
8'h0e:subin =8'hd7;
8'h0f:subin =8'hfb;
8'h10:subin =8'h7c;
8'h11:subin =8'he3;
8'h12:subin =8'h39;
8'h13:subin =8'h82;
8'h14:subin =8'h9b;
8'h15:subin =8'h2f;
8'h16:subin =8'hff;
8'h17:subin =8'h87;
8'h18:subin =8'h34;
8'h19:subin =8'h8e;
8'h1a:subin =8'h43;
8'h1b:subin =8'h44;
8'h1c:subin =8'hc4;
8'h1d:subin =8'hde;
8'h1e:subin =8'he9;
8'h1f:subin =8'hcb;
8'h20:subin =8'h54;
8'h21:subin =8'h7b;
8'h22:subin =8'h94;
8'h23:subin =8'h32;
8'h24:subin =8'ha6;
8'h25:subin =8'hc2;
8'h26:subin =8'h23;
8'h27:subin =8'h3d;
8'h28:subin =8'hee;
8'h29:subin =8'h4c;
8'h2a:subin =8'h95;
8'h2b:subin =8'h0b;
8'h2c:subin =8'h42;
8'h2d:subin =8'hfa;
8'h2e:subin =8'hc3;
8'h2f:subin =8'h4e;
8'h30:subin =8'h08;
8'h31:subin =8'h2e;
8'h32:subin =8'ha1;
8'h33:subin =8'h66;
8'h34:subin =8'h28;
8'h35:subin =8'hd9;
8'h36:subin =8'h24;
8'h37:subin =8'hb2;
8'h38:subin =8'h76;
8'h39:subin =8'h5b;
8'h3a:subin =8'ha2;
8'h3b:subin =8'h49;
8'h3c:subin =8'h6d;
8'h3d:subin =8'h8b;
8'h3e:subin =8'hd1;
8'h3f:subin =8'h25;
8'h40:subin =8'h72;
8'h41:subin =8'hf8;
8'h42:subin =8'hf6;
8'h43:subin =8'h64;
8'h44:subin =8'h86;
8'h45:subin =8'h68;
8'h46:subin =8'h98;
8'h47:subin =8'h16;
8'h48:subin =8'hd4;
8'h49:subin =8'ha4;
8'h4a:subin =8'h5c;
8'h4b:subin =8'hcc;
8'h4c:subin =8'h5d;
8'h4d:subin =8'h65;
8'h4e:subin =8'hb6;
8'h4f:subin =8'h92;
8'h50:subin =8'h6c;
8'h51:subin =8'h70;
8'h52:subin =8'h48;
8'h53:subin =8'h50;
8'h54:subin =8'hfd;
8'h55:subin =8'hed;
8'h56:subin =8'hb9;
8'h57:subin =8'hda;
8'h58:subin =8'h5e;
8'h59:subin =8'h15;
8'h5a:subin =8'h46;
8'h5b:subin =8'h57;
8'h5c:subin =8'ha7;
8'h5d:subin =8'h8d;
8'h5e:subin =8'h9d;
8'h5f:subin =8'h84;
8'h60:subin =8'h90;
8'h61:subin =8'hd8;
8'h62:subin =8'hab;
8'h63:subin =8'h00;
8'h64:subin =8'h8c;
8'h65:subin =8'hbc;
8'h66:subin =8'hd3;
8'h67:subin =8'h0a;
8'h68:subin =8'hf7;
8'h69:subin =8'he4;
8'h6a:subin =8'h58;
8'h6b:subin =8'h05;
8'h6c:subin =8'hb8;
8'h6d:subin =8'hb3;
8'h6e:subin =8'h45;
8'h6f:subin =8'h06;
8'h70:subin =8'hd0;
8'h71:subin =8'h2c;
8'h72:subin =8'h1e;
8'h73:subin =8'h8f;
8'h74:subin =8'hca;
8'h75:subin =8'h3f;
8'h76:subin =8'h0f;
8'h77:subin =8'h02;
8'h78:subin =8'hc1;
8'h79:subin =8'haf;
8'h7a:subin =8'hbd;
8'h7b:subin =8'h03;
8'h7c:subin =8'h01;
8'h7d:subin =8'h13;
8'h7e:subin =8'h8a;
8'h7f:subin =8'h6b;
8'h80:subin =8'h3a;
8'h81:subin =8'h91;
8'h82:subin =8'h11;
8'h83:subin =8'h41;
8'h84:subin =8'h4f;
8'h85:subin =8'h67;
8'h86:subin =8'hdc;
8'h87:subin =8'hea;
8'h88:subin =8'h97;
8'h89:subin =8'hf2;
8'h8a:subin =8'hcf;
8'h8b:subin =8'hce;
8'h8c:subin =8'hf0;
8'h8d:subin =8'hb4;
8'h8e:subin =8'he6;
8'h8f:subin =8'h73;
8'h90:subin =8'h96;
8'h91:subin =8'hac;
8'h92:subin =8'h74;
8'h93:subin =8'h22;
8'h94:subin =8'he7;
8'h95:subin =8'had;
8'h96:subin =8'h35;
8'h97:subin =8'h85;
8'h98:subin =8'he2;
8'h99:subin =8'hf9;
8'h9a:subin =8'h37;
8'h9b:subin =8'he8;
8'h9c:subin =8'h1c;
8'h9d:subin =8'h75;
8'h9e:subin =8'hdf;
8'h9f:subin =8'h6e;
8'ha0:subin =8'h47;
8'ha1:subin =8'hf1;
8'ha2:subin =8'h1a;
8'ha3:subin =8'h71;
8'ha4:subin =8'h1d;
8'ha5:subin =8'h29;
8'ha6:subin =8'hc5;
8'ha7:subin =8'h89;
8'ha8:subin =8'h6f;
8'ha9:subin =8'hb7;
8'haa:subin =8'h62;
8'hab:subin =8'h0e;
8'hac:subin =8'haa;
8'had:subin =8'h18;
8'hae:subin =8'hbe;
8'haf:subin =8'h1b;
8'hb0:subin =8'hfc;
8'hb1:subin =8'h56;
8'hb2:subin =8'h3e;
8'hb3:subin =8'h4b;
8'hb4:subin =8'hc6;
8'hb5:subin =8'hd2;
8'hb6:subin =8'h79;
8'hb7:subin =8'h20;
8'hb8:subin =8'h9a;
8'hb9:subin =8'hdb;
8'hba:subin =8'hc0;
8'hbb:subin =8'hfe;
8'hbc:subin =8'h78;
8'hbd:subin =8'hcd;
8'hbe:subin =8'h5a;
8'hbf:subin =8'hf4;
8'hc0:subin =8'h1f;
8'hc1:subin =8'hdd;
8'hc2:subin =8'ha8;
8'hc3:subin =8'h33;
8'hc4:subin =8'h88;
8'hc5:subin =8'h07;
8'hc6:subin =8'hc7;
8'hc7:subin =8'h31;
8'hc8:subin =8'hb1;
8'hc9:subin =8'h12;
8'hca:subin =8'h10;
8'hcb:subin =8'h59;
8'hcc:subin =8'h27;
8'hcd:subin =8'h80;
8'hce:subin =8'hec;
8'hcf:subin =8'h5f;
8'hd0:subin =8'h60;
8'hd1:subin =8'h51;
8'hd2:subin =8'h7f;
8'hd3:subin =8'ha9;
8'hd4:subin =8'h19;
8'hd5:subin =8'hb5;
8'hd6:subin =8'h4a;
8'hd7:subin =8'h0d;
8'hd8:subin =8'h2d;
8'hd9:subin =8'he5;
8'hda:subin =8'h7a;
8'hdb:subin =8'h9f;
8'hdc:subin =8'h93;
8'hdd:subin =8'hc9;
8'hde:subin =8'h9c;
8'hdf:subin =8'hef;
8'he0:subin =8'ha0;
8'he1:subin =8'he0;
8'he2:subin =8'h3b;
8'he3:subin =8'h4d;
8'he4:subin =8'hae;
8'he5:subin =8'h2a;
8'he6:subin =8'hf5;
8'he7:subin =8'hb0;
8'he8:subin =8'hc8;
8'he9:subin =8'heb;
8'hea:subin =8'hbb;
8'heb:subin =8'h3c;
8'hec:subin =8'h83;
8'hed:subin =8'h53;
8'hee:subin =8'h99;
8'hef:subin =8'h61;
8'hf0:subin =8'h17;
8'hf1:subin =8'h2b;
8'hf2:subin =8'h04;
8'hf3:subin =8'h7e;
8'hf4:subin =8'hba;
8'hf5:subin =8'h77;
8'hf6:subin =8'hd6;
8'hf7:subin =8'h26;
8'hf8:subin =8'he1;
8'hf9:subin =8'h69;
8'hfa:subin =8'h14;
8'hfb:subin =8'h63;
8'hfc:subin =8'h55;
8'hfd:subin =8'h21;
8'hfe:subin =8'h0c;
8'hff:subin =8'h7d;
endcase

endmodule