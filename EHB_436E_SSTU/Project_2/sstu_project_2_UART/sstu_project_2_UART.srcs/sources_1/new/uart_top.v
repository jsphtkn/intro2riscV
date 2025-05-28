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
