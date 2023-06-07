`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:26:34 04/05/2022 
// Design Name: 
// Module Name:    ALU 
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
module adder8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] sum,
    output cout
    );
	wire [8:0] tmp;
 
  assign tmp = a + b;  
  assign sum = tmp [7:0];  
  assign cout  = tmp [8]; 

endmodule

module sub8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] sum
    );
	 
  assign sum = a - b; 

endmodule

module ALU(
    input [7:0] a,
    input [7:0] b,
    input [2:0] op,
    output reg [7:0] z,
    output reg ov,
    output reg cout,
    output reg sign
    );
	wire [7:0] sum;
	wire [7:0] sum_1;
	wire cout_add;

	adder8bit add(a,b,sum,cout_add);

	sub8bit sub(a,b,sum_1);

	always @(*) 
		begin
			case (op)
			
				3'b000:
					begin
						z = sum;
						cout = cout_add;
						ov = (a[7] & b[7]) ^ z[7];
						sign = z[7] | ov;
					end
					
				3'b001: 
					begin
						z = sum_1;
						cout = a[7] & b[7];
						ov = (a[7] & b[7]) ^ z[7];
						sign = z[7] | ov;
					end
					
				3'b010:
					begin
						z[0] = a[0] & b[0];
						z[1] = a[1] & b[1];
						z[2] = a[2] & b[2];
						z[3] = a[3] & b[3];
						z[4] = a[4] & b[4];
						z[5] = a[5] & b[5];
						z[6] = a[6] & b[6];
						z[7] = a[7] & b[7];
						ov = 0;
						cout = 0;
						sign = z[7];
					end 
					
				3'b011: 
					begin
						z[0] = a[0] | b[0];
						z[1] = a[1] | b[1];
						z[2] = a[2] | b[2];
						z[3] = a[3] | b[3];
						z[4] = a[4] | b[4];
						z[5] = a[5] | b[5];
						z[6] = a[6] | b[6];
						z[7] = a[7] | b[7];
						ov = 0;
						cout = 0;
						sign = z[7];
					end 
				3'b100: 
					begin
						z[0] = a[0] ^ b[0];
						z[1] = a[1] ^ b[1];
						z[2] = a[2] ^ b[2];
						z[3] = a[3] ^ b[3];
						z[4] = a[4] ^ b[4];
						z[5] = a[5] ^ b[5];
						z[6] = a[6] ^ b[6];
						z[7] = a[7] ^ b[7];
						ov = 0;
						cout = 0;
						sign = z[7];
					end 
					
				3'b101: 
					begin
						z[0] = ~a[0];
						z[1] = ~a[1];
						z[2] = ~a[2];
						z[3] = ~a[3];
						z[4] = ~a[4];
						z[5] = ~a[5];
						z[6] = ~a[6];
						z[7] = ~a[7];
						ov = 0;
						cout = 0;
						sign = z[7];
					end 
					
				3'b110: 
					begin
						z = a >> 1;
						cout = 0;
						ov = a[7];
						sign = z[7];
					end
					
				3'b111: 
					begin
						z = a << 1;
						cout = 0;
						ov = a[7] ^ a[6];
						sign =  z[7];
					end

				endcase

			end
			
endmodule
