`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:02:20 04/20/2022
// Design Name:   ram
// Module Name:   E:/Uni/Term 4 - Spring 1401/Digital Logic Lab/HWs/4/ans/ram/ram_tb.v
// Project Name:  ram
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ram_tb;

	// Inputs
	reg [9:0] in;
	reg [7:0] addr;
	reg rst;
	reg en;
	reg we;
	reg clk = 1;

	// Outputs
	wire [9:0] out;

	// Instantiate the Unit Under Test (UUT)
	ram uut (
		.in(in), 
		.addr(addr), 
		.rst(rst), 
		.en(en), 
		.we(we), 
		.clk(clk), 
		.out(out)
	);
	
	always begin
		#10 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		addr = 1;
		in = 5;
		en = 0;
		we = 0;
		rst = 1;
    
		#20
		rst = 0;

		#20
		en = 1;
		we = 1;

		#20
		addr = 3;
		in = 60;
		

		#20
		addr = 15;
		in = 100;
		

		#20
		addr = 200;
		in = 420;
		
		#20
		addr = 1;
		we = 0;

		#20
		addr = 3;
		
		#20
		addr = 15;
		
		#20
		addr = 200;
		
		#20
		addr = 68;

	end      
endmodule

