module Keypad(
    input clk,
    input column [0 : 3],
    input row [0 : 3],
    output reg cout
);

always @(posedge clk) 
begin
if(column == 0 && row == 0)begin
    output = 1;
    end

else if(column == 1 && row == 0)begin
    output = 2;
    end

else if(column == 2 && row == 0)begin
    output = 3;
    end

else if(column == 3 && row == 0)begin
    output = 4;
    end



else if(column == 0 && row == 1)begin
    output = 5;
    end

else if(column == 1 && row == 1)begin
    output = 6;
    end

else if(column == 2 && row == 1)begin
    output = 7;
    end

else if(column == 3 && row == 1)begin
    output = 8;
    end



else if(column == 0 && row == 2)begin
    output = 9;
    end

else if(column == 1 && row == 2)begin
    output = 0;
    end

else if(column == 2 && row == 2)begin
    output = '+';
    end

else if(column == 3 && row == 2)begin
    output = '-';
    end



else if(column == 0 && row == 3)begin
    output = 2;
    end

else if(column == 1 && row == 3)begin
    output = 2;
    end

else if(column == 2 && row == 3)begin
    output = 2;
    end

else begin
output = ;
end

end

endmodule