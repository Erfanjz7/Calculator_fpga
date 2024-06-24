`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2024 12:08:30 AM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();

	reg clk;
	reg reset;
	reg [3:0] IO_P4_ROW;
	reg [3:0] IO_P4_COL;
	wire [3:0] number	;
	
	main m(.clk(clk),.reset(reset) , .IO_P4_ROW(IO_P4_ROW) , .IO_P4_COL(IO_P4_COL) , .number(number));
	
	initial 
	begin
	clk = 1;
	reset = 0;  
	forever #1 clk = ~clk   ;
	end
		
	initial
	begin

	IO_P4_ROW = 1;
	IO_P4_COL = 1;
	#10
	IO_P4_ROW = 2;
	IO_P4_COL = 2;
	
	#10
	IO_P4_ROW = 4;
	IO_P4_COL = 4;  
	
    #10
	IO_P4_ROW = 1;
	IO_P4_COL = 2;  
	
	end
endmodule
