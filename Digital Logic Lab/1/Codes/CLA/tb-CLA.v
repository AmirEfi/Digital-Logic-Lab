`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:24:02 03/07/2022
// Design Name:   CLA16
// Module Name:   C:/CLA/carry-look-ahead/tb-CLA.v
// Project Name:  carry-look-ahead
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_CLA;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg Ci;

	// Outputs
	wire [15:0] S;

	// Instantiate the Unit Under Test (UUT)
	CLA16 uut (
		.A(A), 
		.B(B), 
		.Ci(Ci), 
		.S(S), 
	);

	initial begin
		A = 16'b1111111100000000;
		B = 16'b0000000011111111;
		Ci = 1'b0;
		#50;
		A = 16'b1111111100000000;
		B = 16'b0000000011111111;
		Ci = 1'b1;
		#50;
		A = 16'b0000001111000011;
		B = 16'b0000000011001111;
		Ci = 1'b1;
		#50;
	end
      
endmodule

