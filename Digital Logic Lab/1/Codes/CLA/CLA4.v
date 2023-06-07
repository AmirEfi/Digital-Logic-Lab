`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:58 03/07/2022 
// Design Name: 
// Module Name:    CLA4 
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
module CLA4(A, B, Cin, sum, P0, G0);
   input [3:0] A;
   input [3:0] B;
   input Cin;
   output [3:0] sum;
   output P0;
   output G0;
   wire Cin;
   wire [3:0] G;
   wire [3:0] P;
   wire [3:1] C;
   CLALogic CarryLogic (G, P, Cin, C, Co, P0, G0);
   GPFullAdder FA0 (A[0], B[0], Cin, G[0], P[0], sum[0]);
   GPFullAdder FA1 (A[1], B[1], C[1], G[1], P[1], sum[1]);
   GPFullAdder FA2 (A[2], B[2], C[2], G[2], P[2], sum[2]);
   GPFullAdder FA3 (A[3], B[3], C[3], G[3], P[3], sum[3]);

endmodule
