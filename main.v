module main(
    input clk,
    input reset,
    input [3:0] IO_P4_ROW,
    input [3:0] IO_P4_COL,   // with PULLUP option,
    output reg [31:0] answer
);

    wire [3:0] temp;
    reg [3:0] last_temp;
    reg [31:0] lastNumber;
    reg [3:0] state; 

    // Instantiate the Keypad Decoder
    Keypad_Decoder k_d (
        .clk(clk),
        .reset(reset),
        .rows(IO_P4_ROW),
        .columns(IO_P4_COL),
        .keycode_output(temp)
    );

    always @(posedge clk) begin
        if (reset) begin
            answer <= 0;
            lastNumber <= 0;
            state <= 0;
            last_temp <= 4'hF; // Initialize last_temp to an invalid keycode
        end else begin
            if (temp != last_temp) begin
                // Only process the new input when temp changes
                case(state)
                    0: begin
                        if      (temp == 4'hA)begin
                         state <= 1;  // Addition
                         last_temp <= 4'hF;
                         end
                        else if (temp == 4'hB)begin
                         state <= 2;  // Subtraction
                         last_temp <= 4'hF;
                         end
                        else if (temp == 4'hC)begin
                         state <= 3;  // Division
                         last_temp <= 4'hF;
                         end
                        else if (temp == 4'hD)begin
                         state <= 4;  // Multiplication
                         last_temp <= 4'hF;
                         end
                        else if (temp == 4'hE)begin
                         state <= 5;  // Unknown operation
                         last_temp <= 4'hF;
                         end
                        else if (temp == 4'hF)begin
                         state <= 6;  // Unknown operation
                         last_temp <= 4'hF;
                         end
                        else answer <= answer * 10 + temp;
                        last_temp <= temp; 
                    end
                    
                    1: begin
                        answer <= lastNumber + answer;
                        lastNumber <= answer;
                        state <= 7;
                    end
                    2: begin
                        answer <= lastNumber - answer;
                        lastNumber <= answer;
                        state <= 7;

                    end
                    3: begin
                        if (answer != 0) begin
                            answer <= lastNumber / answer;
                        end else begin
                            answer <= 32'hFFFFFFFF;  // Division by zero error
                        end
                        lastNumber <= answer;
                        state <= 7;

                    end
                    4: begin
                        answer <= lastNumber * answer;
                        lastNumber <= answer;
                        state <= 7;
                    end
                    5: begin
                        // Unknown operation
                        state <= 0;
                        answer<=0;
                    end
                    6:begin

                    end
                    7:begin
                    //display answer
                        if(temp != 4'hA && temp != 4'hB && temp != 4'hC && temp != 4'hD &&
                         temp != 4'hE && temp != 4'hF) begin
                            answer <= temp;
                            state <= 0;
                            last_temp <= temp;
                        end
                    end
                    default: begin
                        state <= 0;
                    end
                endcase
            end
        end
    end
endmodule
