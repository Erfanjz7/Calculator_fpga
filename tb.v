module tb_main;

    // Inputs
    reg clk;
    reg reset;
    reg [3:0] IO_P4_ROW;
    reg [3:0] IO_P4_COL;

    // Output
    wire [31:0] answer;

    // Instantiate the Unit Under Test (UUT)
    main uut (
        .clk(clk),
        .reset(reset),
        .IO_P4_ROW(IO_P4_ROW),
        .IO_P4_COL(IO_P4_COL),
        .answer(answer)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        // Initialize Inputs
        reset = 1;
        IO_P4_ROW = 2;
        IO_P4_COL = 4;

        // Wait for a few clock cycles
        #20;
        reset = 0;


        IO_P4_ROW = 1;
        IO_P4_COL = 1;
        #20;


        IO_P4_ROW = 2;
        IO_P4_COL = 2;
        #20;


        IO_P4_ROW = 1;
        IO_P4_COL = 4;
        #20;


        IO_P4_ROW = 2;
        IO_P4_COL = 2;
        #20;
        
        IO_P4_ROW = 1;
        IO_P4_COL = 4;
        #20;       
        // Add more test cases as needed
        #100 $finish;
    end
endmodule
