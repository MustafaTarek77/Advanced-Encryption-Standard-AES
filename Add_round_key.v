module Add_round_key(
msg ,
key ,
mix);
input [127:0] msg;
input [127:0] key;
output [127:0] mix;
assign mix [127:120] =( msg[127:120] ^ key[127:120] );
assign mix [119:112] =( msg[119:112] ^ key[119:112] );
assign mix [111:104] =( msg[111:104] ^ key[111:104] );
assign mix [103:96] =( msg[103:96] ^ key[103:96] );
assign mix [95:88] =( msg[95:88] ^ key[95:88] );
assign mix [87:80] =( msg[87:80] ^ key[87:80] );
assign mix [79:72] =( msg[79:72] ^ key[79:72] );
assign mix [71:64] =( msg[71:64] ^ key[71:64] );
assign mix [63:56] =( msg[63:56] ^ key[63:56] );
assign mix [55:48] =( msg[55:48] ^ key[55:48] );
assign mix [47:40] =( msg[47:40] ^ key[47:40] );
assign mix [39:32] =( msg[39:32] ^ key[39:32] );
assign mix [31:24] =( msg[31:24] ^ key[31:24] );
assign mix [23:16] =( msg[23:16] ^ key[23:16] );
assign mix [15:8] =( msg[15:8] ^ key[15:8] );
assign mix [7:0] =( msg[7:0] ^ key[7:0] );

endmodule