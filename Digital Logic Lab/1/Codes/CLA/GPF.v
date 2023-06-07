`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:42:23 03/07/2022 
// Design Name: 
// Module Name:    GPF 
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
   module GPFullAdder(A, B, Cin, G, P, Sum);
      input A;
      input B;
      input Cin;
      output G;
      output P;
      output Sum;
      wire P_int;
      assign G = A & B;
      assign P = P_int;
      assign P_int = A ^ B;
      assign Sum = P_int ^ Cin;
  endmodule