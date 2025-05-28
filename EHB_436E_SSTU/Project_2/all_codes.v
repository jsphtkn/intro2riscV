`timescale 1ns / 1ps
module baud_gen #(parameter Rx_resolution = 16)(
    input clk,
    input rst,
    input BR_mode, // 0 -> 9600 and 1 -> 115200
    output reg clk_Tx,
    output reg clk_Rx
    );
    
    parameter clk_freq = 100000000; //100MHz
    localparam DIV_9600 = (clk_freq / 9600) -1;
    localparam DIV_9600_Rx = (clk_freq / (9600 * Rx_resolution)) -1;
    localparam DIV_115200 = (clk_freq / 115200) -1;
    localparam DIV_115200_Rx = (clk_freq / (115200 * Rx_resolution)) -1;
    
    reg [15:0] baud_count = 0;
    reg [15:0] baud_count_Rx = 0;
    reg [15:0] baud_limit;
    reg [15:0] baud_limit_Rx;
    
    always @(posedge clk) begin
        if(BR_mode) begin
            baud_limit <= DIV_115200;
            baud_limit_Rx <= DIV_115200_Rx;            
        end else begin
            baud_limit <= DIV_9600;
            baud_limit_Rx <= DIV_9600_Rx;
        end
    end
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            baud_count <= 0;
            clk_Tx <= 1'b0;
        end else begin
            if(baud_count < baud_limit) begin
                baud_count <= baud_count +1;
                clk_Tx <= 1'b0;
            end else begin
                baud_count <= 0;
                clk_Tx <= 1'b1;
            end
        end
    end
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            baud_count_Rx <= 0;
            clk_Rx <= 1'b0;
        end else begin
            if(baud_count_Rx < baud_limit_Rx) begin
                baud_count_Rx <= baud_count_Rx +1;
                clk_Rx <= 1'b0;
            end else begin
                baud_count_Rx <= 0;
                clk_Rx <= 1'b1;
            end
        end
    end
endmodule

`timescale 1ns / 1ps
module baud_gen_tb();
    
    wire clk_Rx, clk_Tx;
    reg rst, clk, BR_mode; 
        
    baud_gen #(.Rx_resolution(16)) uut(
        .clk(clk),
        .rst(rst),
        .BR_mode(BR_mode),
        .clk_Tx(clk_Tx),
        .clk_Rx(clk_Rx)
        );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0; rst = 1'b1; BR_mode = 1'b0;
        #10; rst = 1'b0;
        #1000000;
        rst = 1'b1; BR_mode = 1'b1;
        #10; rst = 1'b0;
        #1000000;
        $finish();  
    end
endmodule

`timescale 1ns / 1ps
module uart_tx(
    input clk_Tx,
    input clk,
    input rst,
    input Tx_enable,
    input [7:0] Tx_data_in,
    output reg Tx_data_out,
    output reg start_flag,
    output reg busy,
    output reg done 
    );
    
    reg [2:0] bit_index = 3'b0;
    reg [7:0] data_buffer = 8'b0;
    reg [1:0] state = 2'b00;
    parameter IDLE  = 2'b00, START = 2'b01,
              DATA  = 2'b10, STOP  = 2'b11;
              
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= IDLE;
            Tx_data_out <= 1'b1;
            start_flag <= 1'b0;
            busy <= 1'b0;
            done <= 1'b0;
            bit_index <= 3'b0;
        end else if(clk_Tx) begin
            case(state)
                IDLE: begin
                    Tx_data_out <= 1'b1;
                    busy <= 1'b0;
                    done <= 1'b0;
                    bit_index <= 3'b0;
                    if(Tx_enable) begin
                        state <= START;
                        data_buffer <= Tx_data_in;
                    end else begin
                        state <= IDLE;
                    end
                end
                START: begin
                    Tx_data_out <= 1'b0;
                    busy <= 1'b0;
                    start_flag <= 1'b1;
                    state <= DATA;
                end
                DATA: begin
                    busy <= 1'b1;
                    start_flag <= 1'b0;
                    if(bit_index < 7) begin
                        Tx_data_out <= data_buffer[bit_index];
                        bit_index <= bit_index + 1;
                        state <= DATA;
                    end else begin
                        bit_index <= 0;
                        state <= STOP;
                    end
                end
                STOP: begin
                    Tx_data_out <= 1'b1;
                    data_buffer <= 8'b0;
                    done <= 1'b1;
                    busy <= 1'b0;
                    state <= IDLE;
                end
                default: begin
                    state <= IDLE;
                end                
            endcase
        end
    end
endmodule

`timescale 1ns / 1ps
module uart_tx_tb();

    wire done, busy, start_flag, Tx_data_out;
    reg clk, clk_Tx, rst, enable;
    reg [7:0] Tx_data_in;
    
    reg [15:0] baud_count = 0;
    reg [15:0] baud_limit;
    
    localparam DIV_9600 = (100000000 / 9600) -1;
    
    uart_tx uut(
        .clk_Tx(clk_Tx),
        .clk(clk),
        .rst(rst),
        .Tx_enable(enable),
        .Tx_data_in(Tx_data_in),
        .Tx_data_out(Tx_data_out),
        .start_flag(start_flag),
        .busy(busy),
        .done(done)
        );
        
    always #5 clk = ~clk;
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            baud_count <= 0;
            clk_Tx <= 1'b0;
            baud_limit <= DIV_9600;
        end else begin
            if(baud_count < baud_limit) begin
                baud_count <= baud_count +1;
                clk_Tx <= 1'b0;
            end else begin
                baud_count <= 0;
                clk_Tx <= 1'b1;
            end
        end
    end
    
    initial begin
        clk = 1'b0; rst = 1'b1; #10;
        rst = 1'b0; enable = 1'b1; #1000; 
        Tx_data_in = 8'b1100_0011;
        #1000000; 
        Tx_data_in = 8'b1111_1111;
        #1000000; 
        Tx_data_in = 8'b0000_0000;
        #1000000; 
         Tx_data_in = 8'b1010_1010;
        #1000000; 
        enable = 1'b0;
        $finish();
        end    
endmodule

`timescale 1ns / 1ps
module uart_rx (
    input clk,
    input rst,
    input clk_Rx,
    input Rx_data_in,
    input Rx_enable,
    output reg [7:0] Rx_data_out,
    output reg Rx_start,
    output reg Rx_busy,
    output reg Rx_done
    );
    
    parameter IDLE  = 2'b00, START = 2'b01,
              DATA  = 2'b10, STOP  = 2'b11;
    
    reg [1:0] state = 2'b00;
    reg [3:0] sample_count;
    reg [3:0] bit_index;
    reg [7:0] data_buffer;
    reg [3:0] bit_weight = 0;
    reg error = 0;
     
     always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= IDLE;
            Rx_start <= 1'b0;
            Rx_busy <= 1'b0;
            Rx_done <= 1'b0;
            Rx_data_out <= 8'b0;
            sample_count <= 4'b0;
            bit_index <= 4'b0;
            data_buffer <= 8'b0;
            bit_weight <= 4'b0;
            error <= 1'b0;
        end else if(clk_Rx) begin
            case(state)
                IDLE: begin
                    Rx_busy <= 1'b0;
                    sample_count <= 4'b0;
                    bit_index <= 4'b0;
                    error <= 1'b0;
                    bit_weight <= 4'b0;
                    data_buffer <= 8'b0;
                    if(Rx_enable && ~Rx_data_in) begin
                        state <= START;
                        Rx_start <= 1'b1;
                        Rx_done <= 1'b0;
                        Rx_data_out <= 8'b0;
                    end else begin
                        state <= IDLE;
                    end
                end
                START: begin
                    if(sample_count < 7) begin
                        sample_count <= sample_count + 1;
                        bit_weight <= bit_weight + Rx_data_in;
                    end else begin
                        sample_count <= 0;
                        if(bit_weight < 4) begin  //If mostly zeros
                            sample_count <= 0;
                            state <= DATA;
                            Rx_start <= 1'b0;
                            Rx_busy <= 1'b1;
                            bit_weight <= 4'b0;
                        end else begin            // If not mostly zeros
                            state <= IDLE;
                            error <= 1'b1;
                            Rx_start <= 1'b0;
                        end
                    end
                end
                DATA: begin
                    if(sample_count < 7) begin
                        sample_count <= sample_count + 1;
                        bit_weight <= bit_weight + Rx_data_in;
                    end else begin
                        sample_count <= 0; 
                        bit_weight <= 4'b0;                         
                        if(bit_index < 8) begin
                            bit_index <= bit_index + 1;
                            if(bit_weight < 4) begin            //Majority Low: bit = 0
                                data_buffer[bit_index] <= 1'b0;
                            end else begin                      //Majority High: bit = 1
                                data_buffer[bit_index] <= 1'b1;
                            end
                        end else begin
                            bit_index <= 4'b0;
                            state <= STOP;
                            Rx_busy <= 1'b0;
                        end
                    end
                    
                end
                STOP: begin
                    if (sample_count < 7) begin
                        sample_count <= sample_count + 1;
                        bit_weight <= bit_weight + Rx_data_in;
                    end else begin
                        sample_count <= 0;
                        bit_weight <= 4'b0;
                        if (bit_weight > 3) begin // Valid stop bit (majority high)
                            Rx_data_out <= data_buffer; // Output received data
                            Rx_done <= 1'b1;
                            state <= IDLE;
                        end else begin
                            error <= 1'b1; // Framing error
                            state <= IDLE;
                        end
                    end
                end
            endcase
        end
     end
endmodule


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
            baud_limit_Rx <= DIV_9600_Rx; // Set baud limit for 8x clock
        end else begin
            if (baud_count_Rx < baud_limit_Rx) begin
                baud_count_Rx <= baud_count_Rx + 1;
                clk_Rx <= 1'b0;
            end else begin
                baud_count_Rx <= 0;
                clk_Rx <= 1'b1; // Generate 8x baud clock
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

`timescale 1ns / 1ps
module uart_rx (
    input clk,
    input rst,
    input clk_Rx,
    input Rx_data_in,
    input Rx_enable,
    output reg [7:0] Rx_data_out,
    output reg Rx_start,
    output reg Rx_busy,
    output reg Rx_done
    );
    
    parameter IDLE  = 2'b00, START = 2'b01,
              DATA  = 2'b10, STOP  = 2'b11;
    
    reg [1:0] state = 2'b00;
    reg [3:0] sample_count;
    reg [3:0] bit_index;
    reg [7:0] data_buffer;
    reg [3:0] bit_weight = 0;
    reg error = 0;
     
     always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= IDLE;
            Rx_start <= 1'b0;
            Rx_busy <= 1'b0;
            Rx_done <= 1'b0;
            Rx_data_out <= 8'b0;
            sample_count <= 4'b0;
            bit_index <= 4'b0;
            data_buffer <= 8'b0;
            bit_weight <= 4'b0;
            error <= 1'b0;
        end else if(clk_Rx) begin
            /*if(error) begin
                state <= IDLE;
            end*/
            case(state)
                IDLE: begin
                    Rx_busy <= 1'b0;
                    sample_count <= 4'b0;
                    bit_index <= 4'b0;
                    error <= 1'b0;
                    bit_weight <= 4'b0;
                    if(Rx_enable && ~Rx_data_in) begin
                        state <= START;
                        Rx_start <= 1'b1;
                    end else begin
                        state <= IDLE;
                    end
                end
                START: begin
                    if(sample_count < 7) begin
                        sample_count <= sample_count + 1;
                        bit_weight <= bit_weight + Rx_data_in;
                    end else begin
                        sample_count <= 0;
                        if(bit_weight < 4) begin  //If mostly zeros
                            sample_count <= 0;
                            state <= DATA;
                            Rx_start <= 1'b0;
                            Rx_busy <= 1'b1;
                            bit_weight <= 4'b0;
                        end else begin            // If not mostly zeros
                            state <= IDLE;
                            error <= 1'b1;
                            Rx_start <= 1'b0;
                        end
                    end
                end
                DATA: begin
                    if(sample_count < 7) begin
                        sample_count <= sample_count + 1;
                        bit_weight <= bit_weight + Rx_data_in;
                    end else begin
                        sample_count <= 0; 
                        bit_weight <= 4'b0;                         
                        if(bit_index < 8) begin
                            bit_index <= bit_index + 1;
                            if(bit_weight < 4) begin            //Majority Low: bit = 0
                                data_buffer[bit_index] <= 1'b0;
                            end else begin                      //Majority High: bit = 1
                                data_buffer[bit_index] <= 1'b1;
                            end
                        end else begin
                            bit_index <= 4'b0;
                            state <= STOP;
                            Rx_busy <= 1'b0;
                        end
                    end
                    
                end
                STOP: begin
                    if (sample_count < 7) begin
                        sample_count <= sample_count + 1;
                        bit_weight <= bit_weight + Rx_data_in;
                    end else begin
                        sample_count <= 0;
                        bit_weight <= 4'b0;
                        if (bit_weight > 3) begin // Valid stop bit (majority high)
                            Rx_data_out <= data_buffer; // Output received data
                            Rx_done <= 1'b1;
                            state <= IDLE;
                        end else begin
                            error <= 1'b1; // Framing error
                            state <= IDLE;
                        end
                    end
                end
            endcase
        end
     end
endmodule


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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU - SSTU - 500T
// Engineer: Yusuf Tekin
// 
// Create Date: 01/12/2025 11:49:21 AM
// Design Name: UART
// Module Name: uart_top
// Project Name: UART
// Target Devices: Artix 7 100T
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

module uart_top(
    input clk,
    input rst,
    input [7:0] data_in,
    input Tx_en,
    input Rx_en,
    input BR_mode,
    output [7:0] data_out
    );
    
    wire signal, clk_Rx, clk_Tx;
    
    uart_rx receiver_1(
        .clk(clk),
        .rst(rst),
        .clk_Rx(clk_Rx),
        .Rx_data_in(signal),
        .Rx_enable(Rx_en),
        .Rx_data_out(data_out),
        .Rx_start(),
        .Rx_busy(), 
        .Rx_done());
    
    uart_tx transmitter_1(
        .clk_Tx(clk_Tx),          
        .clk(clk),             
        .rst(rst),             
        .Tx_enable(Tx_en),       
        .Tx_data_in(data_in),
        .Tx_data_out(signal),
        .start_flag(), 
        .busy(),       
        .done()
        );
    
    baud_gen BR_generator(
        .clk(clk),
        .rst(rst),
        .BR_mode(BR_mode),
        .clk_Tx(clk_Tx),
        .clk_Rx(clk_Rx)
        );
    
endmodule

`timescale 1ns / 1ns
module uart_top_tb();

wire [7:0] data_out;
reg rst, clk, Tx_en, Rx_en;
reg [7:0] data_in;
reg [1:0] BR_mode; // 0 -> 9600 and 1 -> 115200

uart_top uut(
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .Tx_en(Tx_en),
    .Rx_en(Rx_en),
    .BR_mode(BR_mode),
    .data_out(data_out)
    );

    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0; BR_mode = 1'b0;  //9600
        Tx_en = 1'b0; Rx_en = 1'b0;
        data_in = 8'b0000_0000;
        rst = 1'b1; #10; rst = 1'b0; 
        Tx_en = 1'b1; Rx_en = 1'b1;
        
        data_in = 8'b1100_0011; Tx_en = 1'b1;
        #1000000;
        data_in = 8'b1111_1111; Tx_en = 1'b1;
        #1100000;
        data_in = 8'b0000_0000; Tx_en = 1'b1;
        #1200000;
        data_in = 8'b1010_1010; Tx_en = 1'b1;
        #750000; Tx_en = 1'b0;
        #1500000;
        
        BR_mode = 1'b1;  //115200
        Tx_en = 1'b0; Rx_en = 1'b0;
        data_in = 8'b0000_0000;
        rst = 1'b1; #10; rst = 1'b0; 
        Tx_en = 1'b1; Rx_en = 1'b1;
        
        data_in = 8'b1100_0011;
        #100000;
        data_in = 8'b1111_1111;
        #150000;
        data_in = 8'b0000_0000;
        #160000;
        data_in = 8'b1010_1010;
        #200000;
        Tx_en = 1'b0; Rx_en = 1'b0; 
        #10000;
        $finish();
    end
endmodule

