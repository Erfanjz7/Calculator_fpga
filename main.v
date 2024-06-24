`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2024 11:59:11 PM
// Design Name: 
// Module Name: main
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


module main(
	input clk,
	input reset,
	input [3:0] IO_P4_ROW,
	input [3:0] IO_P4_COL,   //with PULLUP option,
	output reg [3:0] number		
);

    wire [3:0] number1;
    wire [3:0] first_number;
    reg [3:0] state; 
    localparam [3:0] fir=0 , sec=1 , plus=2;           ///state 
    
    wire [3:0] first_num;
    wire [3:0] second_num;
Keypad_Decoder k_d(
  .clk(clk),.reset(reset) , .rows(IO_P4_ROW) , .columns(IO_P4_COL) , .keycode_output(number1) );
   
   
    always@(*)
            number = number1;
            case(state)
                fir : 
                begin
                if(number1 == 0) stste = fir;
                end
      
endmodule
