`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:13:49 03/06/2022
// Design Name:   adder16
// Module Name:   E:/Uni/Term 4 - Spring 1401/Digital Logic Lab/HWs/1/ans/ripple_adder/adder16_tb.v
// Project Name:  ripple_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder16_tb;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg cin;

	// Outputs
	wire [15:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	adder16 uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		a = 16'b1111111100000000;
		b = 16'b0000000011111111;
		cin = 1'b0;
		
		#50;
		
		a = 16'b1111111100000000;
		b = 16'b0000000011111111;
		cin = 1'b1;
		
		#50
		
		a = 16'b0000001111000011;
		b = 16'b0000000011001111;
		cin = 1'b1;
		
	end
      
endmodule

