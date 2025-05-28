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
    
    reg [3:0] bit_index = 4'b0;
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
            bit_index <= 4'b0;
        end else if(clk_Tx) begin
            case(state)
                IDLE: begin
                    Tx_data_out <= 1'b1;
                    busy <= 1'b0;
                    done <= 1'b0;
                    bit_index <= 4'b0;
                    if(Tx_enable) begin
                        state <= START;
                        data_buffer <= Tx_data_in;
                        Tx_data_out <= 1'b0;
                        start_flag <= 1'b1;
                    end else begin
                        state <= IDLE;
                    end
                end
                START: begin
                    Tx_data_out <= data_buffer[bit_index];
                    bit_index <= bit_index + 1;
                    state <= DATA;
                    start_flag <= 1'b0;
                    busy <= 1'b1;
                end
                DATA: begin
                    start_flag <= 1'b0;
                    if(bit_index < 8) begin
                        Tx_data_out <= data_buffer[bit_index];
                        bit_index <= bit_index + 1;
                        state <= DATA;
                    end else begin
                        bit_index <= 0;
                        busy <= 1'b0; 
                        done <= 1'b1;                       
                        state <= STOP;
                    end
                end
                STOP: begin
                    Tx_data_out <= 1'b1;
                    data_buffer <= 8'b0;
                    state <= IDLE;
                end
                default: begin
                    state <= IDLE;
                end                
            endcase
        end
    end
endmodule
