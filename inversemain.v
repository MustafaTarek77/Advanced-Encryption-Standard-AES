module inversemain(datain1,out1,out2,out3);

input [127:0]datain1;
output [127:0]out1,out2,out3;

reg [127:0]k0=128'h000102030405060708090a0b0c0d0e0f;
wire [127:0]k1,k2,k3,k4,k5,k6,k7,k8,k9,k10;
wire [127:0]key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;

wire [127:0]RI0,RI1,RI2,RI3,RI4,RI5,RI6,RI7,RI8,RI9;

Key_Expansion q(.KeyI(k0),.rcon(32'h01000000),.KeyF(k1));
Key_Expansion q1(.KeyI(k1),.rcon(32'h02000000),.KeyF(k2));
Key_Expansion q2(.KeyI(k2),.rcon(32'h04000000),.KeyF(k3));
Key_Expansion q3(.KeyI(k3),.rcon(32'h08000000),.KeyF(k4));
Key_Expansion q4(.KeyI(k4),.rcon(32'h10000000),.KeyF(k5));
Key_Expansion q5(.KeyI(k5),.rcon(32'h20000000),.KeyF(k6));
Key_Expansion q6(.KeyI(k6),.rcon(32'h40000000),.KeyF(k7));
Key_Expansion q7(.KeyI(k7),.rcon(32'h80000000),.KeyF(k8));
Key_Expansion q8(.KeyI(k8),.rcon(32'h1b000000),.KeyF(k9));
Key_Expansion q9(.KeyI(k9),.rcon(32'h36000000),.KeyF(k10));


assign RI0=datain1^k10;
//round1
invround ri1(.dataIN(RI0),.dataOUT(RI1),.keyF(k9));
//round2
invround ri2(.dataIN(RI1),.dataOUT(RI2),.keyF(k8));
//round3
invround ri3(.dataIN(RI2),.dataOUT(RI3),.keyF(k7));
//round4
invround ri4(.dataIN(RI3),.dataOUT(RI4),.keyF(k6));
//round5
invround ri5(.dataIN(RI4),.dataOUT(RI5),.keyF(k5));
//round6
invround ri6(.dataIN(RI5),.dataOUT(RI6),.keyF(k4));
//round7
invround ri7(.dataIN(RI6),.dataOUT(RI7),.keyF(k3));
//round8
invround ri8(.dataIN(RI7),.dataOUT(RI8),.keyF(k2));
//round9
invround ri9(.dataIN(RI8),.dataOUT(RI9),.keyF(k1));
//round10
invlastround ri10(.dataIN(RI9),.dataOUT(out1),.keyF(k0));

endmodule