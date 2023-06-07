`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:33 03/06/2022 
// Design Name: 
// Module Name:    adder16 
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
module adder16(
	 input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
    );
	 
	 wire c1, c2, c3;
	 adder4 add4_1 (.a(a[3:0]) , .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c1));
	 adder4 add4_2 (.a(a[7:4]) , .b(b[7:4]), .cin(c1), .sum(sum[7:4]), .cout(c2));
	 adder4 add4_3 (.a(a[11:8]) , .b(b[11:8]), .cin(c2), .sum(sum[11:8]), .cout(c3));
	 adder4 add4_4 (.a(a[15:12]) , .b(b[15:12]), .cin(c3), .sum(sum[15:12]), .cout(cout));
	
endmodule

module adder4(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
    );
	 
	 wire c1, c2, c3;
	 full_adder FA1 (.a(a[0]) , .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
	 full_adder FA2 (.a(a[1]) , .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
	 full_adder FA3 (.a(a[2]) , .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
	 full_adder FA4 (.a(a[3]) , .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout));
	 
endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );
	 
	 assign sum = (a ^ b) ^ cin;
	 assign cout = (a & b) | (a & cin) | (b & cin);
	 
	 
endmodule	 