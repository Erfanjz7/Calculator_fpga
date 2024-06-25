module main(
input clk,
input reset,
input [3:0] IO_P4_ROW,
input [3:0] IO_P4_COL, // with PULLUP option,
output reg [31:0] answer,
output reg [31:0] first_num,
output reg [31:0] second_num,
output reg [31:0] op 
);

localparam [3:0] Add = 4'hA , Sub = 4'hB ,
Div = 4'hC , Mult = 4'hD ,
equal = 4'hE , Clr = 4'hF ;

wire [3:0] key_num;
reg [3:0] last_temp;
reg [31:0] lastNumber;
reg [3:0] state; 
/*
reg [31:0] first_num;
reg [31:0] second_num;
reg [3:0] op; */

// Instantiate the Keypad Decoder
Keypad_Decoder k_d(
    .clk(clk),
    .reset(reset),
    .rows(IO_P4_ROW),
    .columns(IO_P4_COL),
    .keycode_output(key_num)
);


always @(posedge clk) begin
    if (reset) begin
        answer <= 0;
        lastNumber <= 0;
        state <= 0;
        last_temp <= 4'hF; // Initialize last_temp to an invalid keycode
        op = 0;            // newwwwwwwww
        first_num =0;
        second_num = 0;
        
    end 
    else begin
    
        if (key_num != last_temp) begin
            case(state)
                0: begin                                   /// state 0 => first number
                    if(key_num == Add || key_num == Sub || key_num == Div || key_num == Mult )begin
                     state <= 1;  // ==> second number
                     last_temp = key_num;
                     op = key_num; //==> save op
                    
                     end
                   
                    else begin
                        first_num = first_num * 10 + key_num;
                        last_temp = key_num; 
                    end
                end
                
                1: begin                                   /// state 1 => second number
                    if(key_num == equal )
                    begin
                     state <= 2;  // ==> calculate result
                     last_temp = 4'hF;
                    end
                                          
                    else if(key_num == Add || key_num == Sub || key_num == Div || key_num == Mult)
                    begin
                        state <= 3;
                    end  
                   
                   else
                    begin
                        second_num <= second_num * 10 + key_num;
                        last_temp <= key_num; 
                    end   
                end
                
                3: begin
                        /*first_num =0;  
                        second_num=0;
                        op = 0;
                        answer = 0;*/
                        if(op==Add) begin first_num = first_num + second_num ; end
                        else if(op==Div) begin first_num = first_num / second_num ; end
                        else if(op==Mult) begin first_num = first_num * second_num ; end
                        else if(op==Sub) begin first_num = first_num - second_num ; end
                        op <= key_num;
                        second_num = 0;
                        state = 1; 
                end
                
                2: begin
                   if(op==Add) begin answer = first_num + second_num ; end
                   else if(op==Div) begin answer = first_num / second_num ; end
                   else if(op==Mult) begin answer = first_num * second_num ; end
                   else if(op==Sub) begin answer = first_num - second_num ; end
                   last_temp = key_num;
                   state <= 0; 
                end           
            endcase
           
          end
        end
end
endmodule
              
