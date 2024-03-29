module main128(datain1,out1,k0);

input [127:0]datain1;
output [127:0]out1;
input [127:0]k0;
wire [127:0]k1,k2,k3,k4,k5,k6,k7,k8,k9,k10;

wire [127:0]R0,R1,R2,R3,R4,R5,R6,R7,R8,R9;



//Encryption

//round0
assign R0=datain1^k0;
//round1
Key_Expansion q(.KeyI(k0),.rcon(32'h01000000),.KeyF(k1));
round r1(.dataIN(R0),.dataOUT(R1),.keyF(k1));
//round2
Key_Expansion q1(.KeyI(k1),.rcon(32'h02000000),.KeyF(k2));
round r2(.dataIN(R1),.dataOUT(R2),.keyF(k2));
//round3
Key_Expansion q2(.KeyI(k2),.rcon(32'h04000000),.KeyF(k3));
round r3(.dataIN(R2),.dataOUT(R3),.keyF(k3));
//round4
Key_Expansion q3(.KeyI(k3),.rcon(32'h08000000),.KeyF(k4));
round r4(.dataIN(R3),.dataOUT(R4),.keyF(k4));
//round5
Key_Expansion q4(.KeyI(k4),.rcon(32'h10000000),.KeyF(k5));
round r5(.dataIN(R4),.dataOUT(R5),.keyF(k5));
//round6
Key_Expansion q5(.KeyI(k5),.rcon(32'h20000000),.KeyF(k6));
round r6(.dataIN(R5),.dataOUT(R6),.keyF(k6));
//round7
Key_Expansion q6(.KeyI(k6),.rcon(32'h40000000),.KeyF(k7));
round r7(.dataIN(R6),.dataOUT(R7),.keyF(k7));
//round8
Key_Expansion q7(.KeyI(k7),.rcon(32'h80000000),.KeyF(k8));
round r8(.dataIN(R7),.dataOUT(R8),.keyF(k8));
//round9
Key_Expansion q8(.KeyI(k8),.rcon(32'h1b000000),.KeyF(k9));
round r9(.dataIN(R8),.dataOUT(R9),.keyF(k9));
//round10
Key_Expansion q9(.KeyI(k9),.rcon(32'h36000000),.KeyF(k10));
lastround r10(.dataIN(R9),.dataOUT(out1),.keyF(k10));

endmodule