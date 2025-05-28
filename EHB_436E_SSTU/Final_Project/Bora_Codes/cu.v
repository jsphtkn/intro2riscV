`timescale 1ns / 1ps

module cu(
input clk,rst,Start,Busy,
input C0,Z,
output reg WE,
output reg [7:0] CUconst,
output reg [2:0] InMuxAdd,
output reg [3:0] RegAdd,
output reg [3:0] OutMuxAdd,
output reg [1:0] InsSel
    );

localparam idle = 3'b000;

reg [3:0] state;
always @(posedge clk, posedge rst) begin
    if(rst == 1) begin
        WE <= 0;
        CUconst <= 8'b11111111;
        InMuxAdd <= 0;
        RegAdd <= 4'b0001;
        InsSel <= 0;
    end else begin
        case (state)
            idle: begin
            
            end
             
            default: state <= idle;
        endcase

end

end
endmodule
