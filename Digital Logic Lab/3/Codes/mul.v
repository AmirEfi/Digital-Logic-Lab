`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:37 04/12/2022 
// Design Name: 
// Module Name:    mul 
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
module mul(
    input [8:0] A,
    input [8:0] B,
    input reset,
    input clk,
    output reg [17:0] res
    );
	reg [17:0] multiplicand;
	reg [8:0] multiplier;
	reg [3:0] counter;
	always @(posedge clk or posedge reset)
	begin
		if(reset)
		begin
			counter <= 0;
			res <= 0;
			multiplicand <= {{9{0}}, B};
			multiplier <= A;
		end
		else
		begin
			if(counter < 9)
			begin
				if(multiplier[0] == 1)
				begin
					res <= res + multiplicand;
				end
				multiplier <= multiplier >> 1;
				multiplicand <= multiplicand << 1;
				counter <= counter + 1;
			end
		end
	end
endmodule
