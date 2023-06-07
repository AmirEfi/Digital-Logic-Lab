`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:42:02 05/11/2022
// Design Name:   elevator
// Module Name:   C:/Users/asus/Desktop/omid/elevator/elevator_tb.v
// Project Name:  elevator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: elevator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module elevator_tb;

	// Inputs
	reg F1;
	reg F2;
	reg F3;
	reg F4;
	reg U1;
	reg U2;
	reg U3;
	reg U4;
	reg D1;
	reg D2;
	reg D3;
	reg D4;
	reg S1;
	reg S2;
	reg S3;
	reg S4;
	reg hold;
	reg reset;
	reg clk;

	// Outputs
	wire [1:0] AC;
	wire open;
	wire [3:0] DISP;
	wire [4:0] state,next;

	// Instantiate the Unit Under Test (UUT)
	elevator uut (
		.state(state),
		.next(next),
		.F1(F1), 
		.F2(F2), 
		.F3(F3), 
		.F4(F4), 
		.U1(U1), 
		.U2(U2), 
		.U3(U3), 
		.U4(U4), 
		.D1(D1), 
		.D2(D2), 
		.D3(D3), 
		.D4(D4), 
		.S1(S1), 
		.S2(S2), 
		.S3(S3), 
		.S4(S4), 
		.hold(hold), 
		.reset(reset), 
		.clk(clk), 
		.AC(AC), 
		.open(open), 
		.DISP(DISP)
	);

	initial begin
		// Initialize Inputs
		F1 = 0;
		F2 = 0;
		F3 = 0;
		F4 = 0;
		U1 = 0;
		U2 = 0;
		U3 = 0;
		U4 = 0;
		D1 = 0;
		D2 = 0;
		D3 = 0;
		D4 = 0;
		S1 = 1;
		S2 = 0;
		S3 = 0;
		S4 = 0;
		hold = 0;
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
		#50;
        
		// Add stimulus here
		U1=1;
		#20;
		
		F2=1;
		S1=0;
		U1=0;
		#20;
		
		S2=1;
		D4=1;
		#20;
		
		S2=0;
		F1=1;
		#10;
		
		U2=1;
		#5;
		
		S1=1;
		#20;
		S1=0;
		S3=1;
		#5;
		S3=0;
		S4=1;
		#5;
		S4=0;
		S3=1;
		#5;
		S3=0;
		S2=1;
		#5;
		S2=0;
		S1=1;
		#100;
		
		
		
		
	
		reset=1;
		#300;
		$finish;
		
		
	end
	
	always #1 clk=~clk ;
      
endmodule

