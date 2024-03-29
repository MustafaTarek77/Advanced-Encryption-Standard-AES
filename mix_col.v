module mix_col(data, mix);

input [127:0] data;
output [127:0] mix;

assign mix[127:120]/*1*/ = twoMult(data[127:120])^twoMult(data[119:112])^data[119:112]^data[111:104]^data[103:96];
assign mix[119:112]/*2*/ = data[127:120]^twoMult(data[119:112])^twoMult(data[111:104])^data[111:104]^data[103:96];
assign mix[111:104]/*3*/ = data[127:120]^data[119:112]^twoMult(data[111:104])^twoMult(data[103:96])^data[103:96] ;
assign mix[103:96] /*4*/ = twoMult(data[127:120])^data[127:120]^data[119:112]^data[111:104]^twoMult(data[103:96]);
																																	
assign mix[95:88] = twoMult(data[95:88])^twoMult(data[87:80])^data[87:80]^data[79:72]^data[71:64];
assign mix[87:80] = data[95:88]^twoMult(data[87:80])^twoMult(data[79:72])^data[79:72]^data[71:64];
assign mix[79:72] = data[95:88]^data[87:80]^twoMult(data[79:72])^twoMult(data[71:64])^data[71:64];
assign mix[71:64] = twoMult(data[95:88])^data[95:88]^data[87:80]^data[79:72]^twoMult(data[71:64]);

assign mix[63:56] = twoMult(data[63:56])^twoMult(data[55:48])^data[55:48]^data[47:40]^data[39:32];
assign mix[55:48] = data[63:56]^twoMult(data[55:48])^twoMult(data[47:40])^data[47:40]^data[39:32];
assign mix[47:40] = data[63:56]^data[55:48]^twoMult(data[47:40])^twoMult(data[39:32])^data[39:32];
assign mix[39:32] = twoMult(data[63:56])^data[63:56]^data[55:48]^data[47:40]^twoMult(data[39:32]);

assign mix[31:24] = twoMult(data[31:24])^twoMult(data[23:16])^data[23:16]^data[15:8]^data[7:0];  
assign mix[23:16] = data[31:24]^twoMult(data[23:16])^twoMult(data[15:8])^data[15:8]^data[7:0];
assign mix[15:8]  = data[31:24]^data[23:16]^twoMult(data[15:8])^twoMult(data[7:0])^data[7:0];
assign mix[7:0]   = twoMult(data[31:24])^data[31:24]^data[23:16]^data[15:8]^twoMult(data[7:0]);










function [7:0] twoMult;
input [7:0] i;
begin

if(i[7] == 0)
twoMult = {i[6:0], 1'b0};
else
twoMult = {i[6:0], 1'b0}^8'h1b;

end

endfunction

endmodule