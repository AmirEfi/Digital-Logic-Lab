`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:40:38 05/11/2022 
// Design Name: 
// Module Name:    elevator 
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


module elevator(
	input F1,F2,F3,F4,
	U1,U2,U3,U4,
	D1,D2,D3,D4,
	S1,S2,S3,S4,
	hold,reset,clk,
	output reg [1:0] AC, 
	output reg open,
	output reg[3:0] DISP,
	output reg[4:0] state,next
    );
	 
	localparam S1N = 1 ;
	localparam S2N = 2 ;
	localparam S3N = 3 ;
	localparam S4N = 4 ;
	localparam S1PickUp = 5 ;
	localparam S1InRush = 6 ;
	localparam S4PickUp = 7 ;
	localparam S4InRush = 8 ;
	localparam S2InRushUp = 9 ;
	localparam S2InRushDown = 10 ;
	localparam S2PickUp = 11 ;
	localparam S3InRushUp = 12 ;
	localparam S3InRushDown = 13 ;
	localparam S3PickUp = 14 ;
	localparam UpTo2 = 15 ;
	localparam UpTo3 = 16 ;
	localparam UpTo4 = 17 ;
	localparam DownTo3 = 18 ;
	localparam DownTo2 = 19 ;
	localparam DownTo1 = 20 ;
	
	reg[1:4] F, D, U ;
	reg FDU234, FDU123, FDU34, FDU12, FDU1, FDU2, FDU3, FDU4 ;
	//reg[4:0] state, next;
	
	always @(F1,F2,F3,F4,D1,D2,D3,D4,U1,U2,U3,U4) begin
	
		F[1]=F1; F[2]=F2; F[3]=F3; F[4]=F4;
		D[1]=D1; D[2]=D2; D[3]=D3; D[4]=D4;
		U[1]=U1; U[2]=U2; U[3]=U3; U[4]=U4;
		
		FDU234 = ( |F[2:4] ) || ( |D[2:4] ) || ( |U[2:4] ) ;
		FDU123 = ( |F[1:3] ) || ( |D[1:3] ) || ( |U[1:3] ) ;
		
		FDU34  = ( |F[3:4] ) || ( |D[3:4] ) || ( |U[3:4] ) ;	
		FDU12  = ( |F[1:2] ) || ( |D[1:2] ) || ( |U[1:2] ) ;

		FDU1   = (F[1] || D[1] || U[1]) ;
		FDU2   = (F[2] || D[2] || U[2]) ;
		FDU3   = (F[3] || D[3] || U[3]) ;
		FDU4   = (F[4] || D[4] || U[4]) ;
	end
	
	initial begin
		state=S1N;
		next = S1N ;
		AC=0;
		DISP=1;
		open=0;
	end
	

	
	//reg[4:0] state, next;
	//FlipFlop ff (.clk(clk), .reset(reset), .d(next), .q(state));
	
	always @(posedge clk,posedge reset)
		if (reset) state <= S1N ;
		else state <= next ;
		
	always @(negedge clk)begin
		case(state)
		
			//Neutral Elevator:
			
			S1N:		if(U1) next = S1PickUp ;
						else if(FDU234) next = UpTo2 ;
			
			S2N:		if(D2)	next = S2PickUp ;
						else if(U2) next = S2PickUp ;
						else if(FDU1) next = DownTo1 ;
						else if(FDU34) next = UpTo3 ;
			
			S3N:		if(D3)	next = S3PickUp ;
						else if(U3) next = S3PickUp ;
						else if(FDU12) next = DownTo2 ;
						else if(FDU4) next = UpTo4 ;
			
			S4N:		if(D4)	next = S4PickUp ;
						else if(FDU123) next = DownTo3 ;
			
			//Playeing With Elevator's Door:
			
			S1PickUp:	if(FDU234) next = UpTo2 ;
			
			S1InRush:	if(FDU234) next = UpTo2 ;
							else next = S1N ;
			
			S4PickUp:		if(FDU123)	next = DownTo3 ;
			
			S4InRush:	if(FDU123)	next = DownTo3 ;
							else	next = S4N ;
			
			S2InRushUp:	if(FDU34)	next = UpTo3 ;
							else			next = S2N ;
			
			S2InRushDown:	if(FDU1)	next = DownTo1 ;
								else		next = S2N ;
			
			S2PickUp:	if(FDU34)	next = UpTo3 ;
							else if(FDU1)  next = DownTo1 ;
			
			S3InRushUp:	if(FDU4)	next = UpTo4 ;
							else		next = S3N ;
			
			S3InRushDown:	if(FDU12)	next = DownTo2 ;
								else			next = S3N ;
			
			S3PickUp:	if(FDU4)		next = UpTo4 ;
							else if(FDU12) next = DownTo2;
			
			
			//Moving Elevator:
			
			UpTo2:	if((F2 || U2) & S2)	next = S2InRushUp ;
						else if(FDU34 & S2) next = UpTo3 ;
			
			UpTo3:	if((F3 || U3) & S3)	next = S3InRushUp ;
						else if(FDU4 & S3) next = UpTo4 ;
			
			UpTo4:	if(FDU4 & S4)	next = S4InRush ;
			
			DownTo3:	if((F3 || D3) & S3)	next = S3InRushDown ;
						else if(FDU12 & S3) next = DownTo2 ;
			
			DownTo2:	if((F2 || D2) & S2)	next = S2InRushDown ;
						else if(FDU1 & S2) next = DownTo1 ;
			
			DownTo1:	if(FDU1 & S1)	next = S1InRush ;
			
		endcase
		end


	
		
	always @(posedge clk) 
		case(state)
		
			S1N: begin AC=0; DISP=2; open=0; end
			S2N: begin AC=0; DISP=4; open=0; end
			S3N: begin AC=0; DISP=6; open=0; end
			S4N: begin AC=0; DISP=8; open=0; end
			
		
			S1InRush: begin AC=0; DISP=2; open=1; F[1]=0; D[1]=0; U[1]=0; end
			S4InRush: begin AC=0; DISP=8; open=1; F[4]=0; D[4]=0; U[4]=0; end
			
			S2InRushUp:   begin AC=0; DISP=4; open=1; F[2]=0; D[2]=0; U[2]=0; end
			S2InRushDown: begin AC=0; DISP=4; open=1; F[2]=0; D[2]=0; U[2]=0; end
			
			S3InRushUp:   begin AC=0; DISP=6; open=1; F[3]=0; D[3]=0; U[3]=0; end
			S3InRushDown: begin AC=0; DISP=6; open=1; F[3]=0; D[3]=0; U[3]=0; end
			
			S2PickUp: open=1;
			S3PickUp: open=1;
					
			S1PickUp: open=1;
			S4PickUp: open=1;
			
			UpTo2: begin AC=1; DISP=3; open=0; end
			UpTo3: begin AC=1; DISP=5; open=0; end
			UpTo4: begin AC=1; DISP=7; open=0; end
			
			DownTo3: begin AC=-1; DISP=7; open=0; end
			DownTo2: begin AC=-1; DISP=5; open=0; end
			DownTo1: begin AC=-1; DISP=3; open=0; end
			
		endcase
		
endmodule


