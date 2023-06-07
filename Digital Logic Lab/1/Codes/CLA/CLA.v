`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:03 03/07/2022 
// Design Name: 
// Module Name:    CLA 
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
module CLALogic (G, P, Cin, C, Cout, P0, G0);
   input [3:0] G;
   input [3:0] P;
   input Cin;
   output [3:1] C;
   output Cout;
   output P0;
   output G0;
   wire G_temp;
   wire P_temp;
   assign C[1] = G[0] | (P[0] & Cin);
   assign C[2] = G[1] | (P[1] & G[0])| (P[1] & P[0] & Cin);
   assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0])| (P[2] & P[1] & P[0] & Cin);
   assign P_temp = P[3] & P[2] & P[1] & P[0];
   assign G_temp = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
   assign Cout = G_temp | (P_temp & Cin);
   assign P0 = P_temp;
   assign G0 = G_temp;
endmodule