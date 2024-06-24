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
    reg [3:0] number11=1'b000;
    
    reg [3:0] state =0; 
    localparam [3:0] fir=0 , sec=1 , plus=2;           ///state 
    
    wire [3:0] first_num;
    wire [3:0] second_num;
    
    
Keypad_Decoder k_d(
  .clk(clk),.reset(reset) , .rows(IO_P4_ROW) , .columns(IO_P4_COL) , .keycode_output(number1) );
   
always@(*)

  begin 
           if(number11== 1'bx) number=10;
           if(number11==1'b000) number=10;
             number11 = number11 *10;
			 number11 = number11 + number1;
             number = number11;  
             // number = number1;
/*            case(state)
			     0: begin
			         if(number1== 4'he )  state  <= 1;
			         else if(number1== 4'hA )  state  <= 1;
			         else if(number1== 4'hB )  state  <= 1;
			         else if(number1== 4'hC )  state  <= 1;
			         else if(number1== 4'hD )  state  <= 1;
			         else begin
			               number = number *10;
			               number = number + number1;
			              end    
			         end 
			
			endcase		 */
      end
endmodule
