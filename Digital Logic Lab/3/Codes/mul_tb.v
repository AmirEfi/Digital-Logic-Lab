`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:38:36 04/12/2022
// Design Name:   mul
// Module Name:   C:/Users/mamad/Desktop/mult/mul/mul_tb.v
// Project Name:  mul
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mul
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mul_tb;

	// Inputs
	reg [8:0] A;
	reg [8:0] B;
	reg reset;
	reg clk;

	// Outputs
	wire [17:0] res;

	// Instantiate the Unit Under Test (UUT)
	mul uut (
		.A(A), 
		.B(B), 
		.reset(reset), 
		.clk(clk), 
		.res(res)
	);
	always	#5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 1;
		A = 25;
		B = 20;
		reset = 1;
		#10
		reset = 0;
		#100
		A = 24;
		B = 26;
		reset = 1;
		#10
		reset = 0;
		#100
		A = 6;
		B = 23;
		reset = 1;
		#10
		reset = 0;
		#100
		A = 43;
		B = 33;
		reset = 1;
		#10
		reset = 0;
		#100
		A = 341;
		B = 345;
		reset = 1;
		#10
		reset = 0;
		#100
		A = 511;
		B = 511;
		reset = 1;
		#10
		reset = 0;
	end
      
endmodule

