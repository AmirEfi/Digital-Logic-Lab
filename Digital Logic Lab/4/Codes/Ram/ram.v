`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:06:09 04/18/2022 
// Design Name: 
// Module Name:    ram 
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
module ram(
    input [9:0] in,
    input [7:0] addr,
    input rst,
    input en,
    input we,
    input clk,
    output [9:0] out
    );
   
   reg [9:0] memory [255:0];
	 always @(posedge clk,posedge rst)
	 begin
		if (rst)
			out<=0;
		else
			begin
				if (we & en)
					memory[addr] <= in;
				
				else if (!we & en)
					out <= memory[addr];
			end
	 end

	 
	 ram_core ram_core1 (
  .clka(clk), // input clka
  .rsta(rst), // input rsta
  .ena(en), // input ena
  .wea(we), // input [0 : 0] wea
  .addra(addr), // input [7 : 0] addra
  .dina(in), // input [9 : 0] dina
  .douta(out) // output [9 : 0] douta
	);
    
    
endmodule
