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
