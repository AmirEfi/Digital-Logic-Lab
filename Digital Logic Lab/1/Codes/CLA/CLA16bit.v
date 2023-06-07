`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:37 03/07/2022 
// Design Name: 
// Module Name:    CLA16 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CLA16(A, B, Cin, sum, Cout, P1, G1);

input [15:0] A;
input [15:0] B;
input Cin;
output [15:0] sum;
output Cout;
output P1;
output G1;
wire [3:0] GG;
wire [3:0] PG;
wire [3:1] C;
wire Cin;

CLALogic CarryLogic_2 (GG[3:0], PG[3:0], Cin, C[3:1], Cout, P1, G1);
CLA4 u0 (A[3:0], B[3:0], Cin, sum[3:0],PG[0], GG[0]);
CLA4 u1 (A[7:4], B[7:4], C[1],  sum[7:4], PG[1], GG[1]);
CLA4 u2 (A[11:8], B[11:8], C[2], sum[11:8], PG[2], GG[2]);
CLA4 u3 (A[15:12], B[15:12], C[3], sum[15:12], PG[3], GG[3]);

endmodule