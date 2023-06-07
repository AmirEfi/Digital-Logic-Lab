`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:30:39 04/05/2022
// Design Name:   ALU
// Module Name:   E:/Uni/Term 4 - Spring 1401/Digital Logic Lab/HWs/2/ans/ALU/alu_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg [2:0] op;

	// Outputs
	wire [7:0] z;
	wire ov;
	wire cout;
	wire sign;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.op(op), 
		.z(z), 
		.ov(ov), 
		.cout(cout), 
		.sign(sign)
	);

	initial begin
		// Initialize Inputs
		  a=8'b10101001;
        b=8'b10000011;
		  
        op = 3'b000;
        #100;
		  
        op = 3'b001;
        #100;
		  
        op = 3'b010;
        #100;
		  
        op = 3'b011;
        #100;
		  
        op = 3'b100;
        #100;
		  
        op = 3'b101;
        #100;
		  
        op = 3'b110;
        #100;
		  
        op = 3'b111;
		  #100;
		  
		  a=8'b01101001;
        b=8'b01000011;
		  
		  op = 3'b000;
        #100;
		  
        op = 3'b001;
        #100;
		  
        op = 3'b010;
        #100;
		  
        op = 3'b011;
        #100;
		  
        op = 3'b100;
        #100;
		  
        op = 3'b101;
        #100;
		  
        op = 3'b110;
        #100;
		  
        op = 3'b111;
		  #100;
		  
		  a=8'b11101001;
        b=8'b01010011;
		  
		  op = 3'b000;
        #100;
		  
        op = 3'b001;
        #100;
		  
        op = 3'b010;
        #100;
		  
        op = 3'b011;
        #100;
		  
        op = 3'b100;
        #100;
		  
        op = 3'b101;
        #100;
		  
        op = 3'b110;
        #100;
		  
        op = 3'b111;
		  #100;
	end
      
endmodule

