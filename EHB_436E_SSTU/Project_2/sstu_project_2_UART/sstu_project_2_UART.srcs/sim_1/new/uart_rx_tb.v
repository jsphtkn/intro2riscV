`timescale 1ns / 1ns
module uart_rx_tb();

    // Parameters for 9600 baud, 8x oversampling
    localparam DIV_9600_Rx = (100000000 / (9600 * 8)) - 1;

    reg [15:0] baud_count_Rx = 0;
    reg [15:0] baud_limit_Rx;

    reg clk, rst, clk_Rx, Rx_data_in, Rx_enable;

    wire [7:0] Rx_data_out;
    wire Rx_start, Rx_busy, Rx_done;
    
    uart_rx uut (
        .clk(clk),
        .rst(rst),
        .clk_Rx(clk_Rx),
        .Rx_data_in(Rx_data_in),
        .Rx_enable(Rx_enable),
        .Rx_data_out(Rx_data_out),
        .Rx_start(Rx_start),
        .Rx_busy(Rx_busy),
        .Rx_done(Rx_done)
    );

    
    always #5 clk = ~clk; 

    // Baud clock generation: 8x baud clock for 9600 baud rate
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            baud_count_Rx <= 0;
            clk_Rx <= 1'b0;
            baud_limit_Rx <= DIV_9600_Rx; 
        end else begin
            if (baud_count_Rx < baud_limit_Rx) begin
                baud_count_Rx <= baud_count_Rx + 1;
                clk_Rx <= 1'b0;
            end else begin
                baud_count_Rx <= 0;
                clk_Rx <= 1'b1; 
            end
        end
    end
    
    always @(*) begin
        if(Rx_done == 1'b1) begin
            if(Rx_data_out == 8'b1110_0001) begin
                $display("Frame 1: Received data is correct = %b", Rx_data_out);
            end else if(Rx_data_out == 8'b1010_1010) begin
                $display("Frame 2: Received data is correct = %b", Rx_data_out);
            end else if(Rx_data_out == 8'b0000_1111) begin
                $display("Frame 3: Received data is correct = %b", Rx_data_out);
            end else if(Rx_data_out == 8'b1111_1111) begin
                $display("Frame 4: Received data is correct = %b", Rx_data_out);
            end else begin
                $display("Received data is not correct = %b", Rx_data_out);
            end
        end
    end
    
    
    initial begin
        
        clk = 1'b0;
        rst = 1'b1;
        Rx_data_in = 1'b1; 
        #10;
        rst = 1'b0; 
        Rx_enable = 1'b1; 
        #1000;

        // Frame 1: 8'b11100001 (Start bit = 0, Data = 11100001, Stop bit = 1)
        Rx_data_in = 1'b0; #104167; // Start bit
        Rx_data_in = 1'b1; #104167; // Bit 0
        Rx_data_in = 1'b0; #104167; // Bit 1
        Rx_data_in = 1'b0; #104167; // Bit 2
        Rx_data_in = 1'b0; #104167; // Bit 3
        Rx_data_in = 1'b0; #104167; // Bit 4
        Rx_data_in = 1'b1; #104167; // Bit 5
        Rx_data_in = 1'b1; #104167; // Bit 6
        Rx_data_in = 1'b1; #104167; // Bit 7
        Rx_data_in = 1'b1; #104167; // Stop bit
        
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        
        // Frame 2: 8'b10101010 (Start bit = 0, Data = 10101010, Stop bit = 1)
        Rx_data_in = 1'b0; #104167; // Start bit
        Rx_data_in = 1'b0; #104167; // Bit 0
        Rx_data_in = 1'b1; #104167; // Bit 1
        Rx_data_in = 1'b0; #104167; // Bit 2
        Rx_data_in = 1'b1; #104167; // Bit 3
        Rx_data_in = 1'b0; #104167; // Bit 4
        Rx_data_in = 1'b1; #104167; // Bit 5
        Rx_data_in = 1'b0; #104167; // Bit 6
        Rx_data_in = 1'b1; #104167; // Bit 7
        Rx_data_in = 1'b1; #104167; // Stop bit
        
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        
        // Frame 3: 8'b00001111 (Start bit = 0, Data = 00001111, Stop bit = 1)
        Rx_data_in = 1'b0; #104167; // Start bit
        Rx_data_in = 1'b1; #104167; // Bit 0
        Rx_data_in = 1'b1; #104167; // Bit 1
        Rx_data_in = 1'b1; #104167; // Bit 2
        Rx_data_in = 1'b1; #104167; // Bit 3
        Rx_data_in = 1'b0; #104167; // Bit 4
        Rx_data_in = 1'b0; #104167; // Bit 5
        Rx_data_in = 1'b0; #104167; // Bit 6
        Rx_data_in = 1'b0; #104167; // Bit 7
        Rx_data_in = 1'b1; #104167; // Stop bit
        
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        
        // Frame 4: 8'b11111111 (Start bit = 0, Data = 00001111, Stop bit = 1)
        Rx_data_in = 1'b0; #104167; // Start bit
        Rx_data_in = 1'b1; #104167; // Bit 0
        Rx_data_in = 1'b1; #104167; // Bit 1
        Rx_data_in = 1'b1; #104167; // Bit 2
        Rx_data_in = 1'b1; #104167; // Bit 3
        Rx_data_in = 1'b1; #104167; // Bit 4
        Rx_data_in = 1'b1; #104167; // Bit 5
        Rx_data_in = 1'b1; #104167; // Bit 6
        Rx_data_in = 1'b1; #104167; // Bit 7
        Rx_data_in = 1'b1; #104167; // Stop bit
        
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        Rx_data_in = 1'b1; #104167;
        $finish();
    end

endmodule
