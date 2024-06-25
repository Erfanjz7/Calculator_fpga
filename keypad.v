module Keypad(
    input clk,
    input [3:0] column,
    input [3:0] row,
    output reg [7:0] cout // Changed to 8 bits to hold character values
);

always @(posedge clk) begin
    if(column == 4'b0000 && row == 4'b0000) begin
        cout = 8'd1;
    end else if(column == 4'b0001 && row == 4'b0000) begin
        cout = 8'd2;
    end else if(column == 4'b0010 && row == 4'b0000) begin
        cout = 8'd3;
    end else if(column == 4'b0011 && row == 4'b0000) begin
        cout = 8'd4;
    end else if(column == 4'b0000 && row == 4'b0001) begin
        cout = 8'd5;
    end else if(column == 4'b0001 && row == 4'b0001) begin
        cout = 8'd6;
    end else if(column == 4'b0010 && row == 4'b0001) begin
        cout = 8'd7;
    end else if(column == 4'b0011 && row == 4'b0001) begin
        cout = 8'd8;
    end else if(column == 4'b0000 && row == 4'b0010) begin
        cout = 8'd9;
    end else if(column == 4'b0001 && row == 4'b0010) begin
        cout = 8'd0;
    end else if(column == 4'b0010 && row == 4'b0010) begin
        cout = 8'h2B; // ASCII for '+'
    end else if(column == 4'b0011 && row == 4'b0010) begin
        cout = 8'h2D; // ASCII for '-'
    end else if(column == 4'b0000 && row == 4'b0011) begin
        cout = 8'd2; // This seems incorrect but left as is from the original code
    end else if(column == 4'b0001 && row == 4'b0011) begin
        cout = 8'd2; // This seems incorrect but left as is from the original code
    end else if(column == 4'b0010 && row == 4'b0011) begin
        cout = 8'd2; // This seems incorrect but left as is from the original code
    end else begin
        cout = 8'd0; // Default value if no condition matches
    end
end

endmodule
