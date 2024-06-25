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
	wire [31:0] answer	;
	wire [31:0] first_num;
    wire [31:0] second_num;
    wire [31:0] op ;

	main m(.clk(clk),.reset(reset) , .IO_P4_ROW(IO_P4_ROW) , .IO_P4_COL(IO_P4_COL) , .answer(answer)
	       , .first_num(first_num) , .second_num(second_num) , .op(op) );
	
	initial 
	begin
	clk = 1;
	reset = 1;  
	#10
    reset = 0;
	forever #1 clk = ~clk   ;
	end

	initial
	begin
    #1
    reset = 0;
	IO_P4_ROW = 4;         // 9
	IO_P4_COL = 4;

	
	#20
	IO_P4_ROW = 1; // ===> +
 	IO_P4_COL = 8;	


	#20                // 1
	IO_P4_ROW = 1;
	IO_P4_COL = 1;

	////////////////////////
		#20
	
	IO_P4_ROW = 2;            //====> -
	IO_P4_COL = 8;	

	#20
	IO_P4_ROW = 2;        //5
	IO_P4_COL = 2;


	///////////////////////////////
	#20              ////////////// ==> equal
	IO_P4_ROW = 8;
	IO_P4_COL = 1;
	
	end 	
endmodule
