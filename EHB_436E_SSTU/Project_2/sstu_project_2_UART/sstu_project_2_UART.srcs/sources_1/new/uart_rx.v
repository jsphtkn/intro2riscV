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
