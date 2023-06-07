`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:16:12 04/20/2022 
// Design Name: 
// Module Name:    fifo 
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
module fifo (
    input [9:0] in,
    input rst, rd_en, wr_en,
    output empty, full,
    input clk,
    output [9:0] out
);
/*   reg [7:0]  count = 0; 
	reg [9:0]  fifo [15:0];
	reg [7:0]  readCounter = 0, writeCounter = 0;
	
	
	assign empty = (count == 0)? 1: 0; 
	assign full = (count == 16)? 1 : 0; 

	always @ (posedge clk) 
		begin  
			if (rst) 
				begin 
				readCounter = 0; 
				writeCounter = 0;
				count = 0;
				out = 0;
			end 

			else if (rd_en == 1 && count!=0) begin 
				out = fifo[readCounter]; 
				readCounter = readCounter+1;
				count = count - 1;
			end 

			else if (wr_en == 1 && count < 16) begin
				fifo[writeCounter] = in; 
				writeCounter  = writeCounter+1;
				count = count + 1;
			end 
			


			if (writeCounter == 16) 
				writeCounter=0; 

			else if (readCounter == 16) 
				readCounter=0;


		end */
		
		core_fifo cor (
  .clk(clk), // input clk
  .srst(rst), // input srst
  .din(in), // input [9 : 0] din
  .wr_en(wr_en), // input wr_en
  .rd_en(rd_en), // input rd_en
  .dout(out), // output [9 : 0] dout
  .full(full), // output full
  .empty(empty) // output empty
   );

endmodule

