`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2024 09:36:33 AM
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
    input [0:9]a,
    output reg b
    );
    wire x = a;
    always@(*)begin
    if (x == 1)begin
    b = 2;
    end
    
    else
    begin
    b = "x";
    end
    
    end

endmodule
