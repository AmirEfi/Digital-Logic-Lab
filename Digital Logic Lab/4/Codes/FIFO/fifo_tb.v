`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:19:14 04/20/2022
// Design Name:   fifo
// Module Name:   E:/Uni/Term 4 - Spring 1401/Digital Logic Lab/HWs/4/ans/fifo/fifo_tb.v
// Project Name:  fifo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fifo_tb;

	// Inputs
	reg [9:0] in;
	reg rst;
	reg rd_en;
	reg wr_en;
	reg clk = 1;

	// Outputs
	wire empty;
	wire full;
	wire [9:0] out;

	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.in(in), 
		.rst(rst), 
		.rd_en(rd_en), 
		.wr_en(wr_en), 
		.empty(empty), 
		.full(full), 
		.clk(clk), 
		.out(out)
	);

	always begin
    #10 clk = ~clk;
  end

  initial begin
    // Initialize Inputs
    in = 10;
    rd_en = 1;
    wr_en = 0;
    rst = 1;
    
    #20
    rst = 0;

    #20
    rd_en = 0;
    wr_en = 1;

    #20
    in = 20;

    #20
    in = 30;

    #20
    in = 40;

    #20
    in = 50;
	 
	 #20
    in = 60;

    #20
    in = 70;

    #20
    in = 80;

    #20
    in = 90;
	 
	 #20
    in = 100;

    #20
    in = 110;

    #20
    in = 120;

    #20
    in = 130;
	 
	 #20
	 in = 140;
	 
	 #20
	 in = 150;
	 
	 #20
	 in = 160;
	 
	 #20
	 
    rd_en = 1;
    wr_en = 0;

   // #50
    //rst = 1; 
    //#10
    //rst = 0;

    #25
    rd_en = 0;
    wr_en = 1;

    #20
    rd_en = 1;
    wr_en = 0;
	 
  end
      
endmodule

