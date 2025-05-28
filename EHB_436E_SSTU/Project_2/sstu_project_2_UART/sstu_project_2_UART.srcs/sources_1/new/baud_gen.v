`timescale 1ns / 1ps
module baud_gen #(parameter Rx_resolution = 8)(
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
