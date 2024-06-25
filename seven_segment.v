`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2024 12:07:09 AM
// Design Name: 
// Module Name: seven_segment
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

module seven_segment_display (
    input [31:0] num,
    output reg [6:0] seg1,
    output reg [6:0] seg2
);
    integer digit1;
    integer digit2;
// Seven-segment display encoding for digits 0-9 and character 'F'
always @(num) begin
    // Extract the two least significant digits


    if (num < 99) begin
        digit1 = num % 10;
        digit2 = (num / 10) % 10;
    end else begin
        digit1 = 15; // 'F'
        digit2 = 15; // 'F'
    end

    // Convert digits to 7-segment display encoding
    case (digit1)
        0: seg1 = 7'b0111111;
        1: seg1 = 7'b0000110;
        2: seg1 = 7'b1011011;
        3: seg1 = 7'b1001111;
        4: seg1 = 7'b1100110;
        5: seg1 = 7'b1101101;
        6: seg1 = 7'b1111101;
        7: seg1 = 7'b0000111;
        8: seg1 = 7'b1111111;
        9: seg1 = 7'b1101111;
        15: seg1 = 7'b1110001; // 'F'
        default: seg1 = 7'b0000000; // off
    endcase

    case (digit2)
        0: seg2 = 7'b0111111;
        1: seg2 = 7'b0000110;
        2: seg2 = 7'b1011011;
        3: seg2 = 7'b1001111;
        4: seg2 = 7'b1100110;
        5: seg2 = 7'b1101101;
        6: seg2 = 7'b1111101;
        7: seg2 = 7'b0000111;
        8: seg2 = 7'b1111111;
        9: seg2 = 7'b1101111;
        15: seg2 = 7'b1110001; // 'F'
        default: seg2 = 7'b0000000; // off
    endcase
end

endmodule