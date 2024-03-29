module decryption192(datain,out,ke0);

input [127:0]datain;
output [127:0]out;
input [191:0]ke0;
wire [191:0]ke1,ke2,ke3,ke4,ke5,ke6,ke7,ke8;

wire [127:0]RI0,RI1,RI2,RI3,RI4,RI5,RI6,RI7,RI8,RI9,RI10,RI11,RI12;


Key_Expansion192 qq(.KeyI(ke0),.rcon(32'h01000000),.KeyF(ke1));
Key_Expansion192 qq1(.KeyI(ke1),.rcon(32'h02000000),.KeyF(ke2));
Key_Expansion192 qq2(.KeyI(ke2),.rcon(32'h04000000),.KeyF(ke3));
Key_Expansion192 qq3(.KeyI(ke3),.rcon(32'h08000000),.KeyF(ke4));
Key_Expansion192 qq4(.KeyI(ke4),.rcon(32'h10000000),.KeyF(ke5));
Key_Expansion192 qq5(.KeyI(ke5),.rcon(32'h20000000),.KeyF(ke6));
Key_Expansion192 qq6(.KeyI(ke6),.rcon(32'h40000000),.KeyF(ke7));
Key_Expansion192 qq7(.KeyI(ke7),.rcon(32'h80000000),.KeyF(ke8));


//round0
assign RI0=datain^ke8[191:64];
//round1
invround rri1(.dataIN(RI0),.dataOUT(RI1),.keyF(ke7[127:0]));
//round2
invround rri2(.dataIN(RI1),.dataOUT(RI2),.keyF({ke6[63:0],ke7[191:128]}));
//round3
invround rri3(.dataIN(RI2),.dataOUT(RI3),.keyF(ke6[191:64]));
//round4
invround rri4(.dataIN(RI3),.dataOUT(RI4),.keyF(ke5[127:0]));
//round5
invround rri5(.dataIN(RI4),.dataOUT(RI5),.keyF({ke4[63:0],ke5[191:128]}));
//round6
invround rri6(.dataIN(RI5),.dataOUT(RI6),.keyF(ke4[191:64]));
//round7
invround rri7(.dataIN(RI6),.dataOUT(RI7),.keyF(ke3[127:0]));
//round8
invround rri8(.dataIN(RI7),.dataOUT(RI8),.keyF({ke2[63:0],ke3[191:128]}));
//round9
invround rri9(.dataIN(RI8),.dataOUT(RI9),.keyF(ke2[191:64]));
//round10
invround rri10(.dataIN(RI9),.dataOUT(RI10),.keyF(ke1[127:0]));
//round11
invround rri11(.dataIN(RI10),.dataOUT(RI11),.keyF({ke0[63:0],ke1[191:128]}));
//round12
invlastround rri12(.dataIN(RI11),.dataOUT(out),.keyF(ke0[191:64]));

endmodule