`timescale 1ns / 1ps
module top_tb();

reg clk,reset,start;
reg[7:0] a;
reg[7:0] b;
wire busy;
wire[7:0] out;
wire[7:0] shouldBeResult;

top DUT(
    .clk(clk),
    .reset(reset),
    .Start(start),
    .Busy(busy),
    .InA(a),
    .InB(b),
    .Out(out)
);

assign shouldBeResult = a%b;

always begin
    clk = ~clk;
    #5;
end

initial begin
    clk = 0;
    reset = 1;
    start = 0;
    a = 8'b0111_0110; //118
    b = 8'b0000_0101; //5
    #20;
    reset = 0;
    start = 1;
    #10400;
    a = 8'b0111_0111; //119
    b = 8'b0000_0101; //5
    #10400;
    a = 8'd45;
    b = 8'd30;
    #10400;
    a = 8'd3;
    b = 8'd120;
    #10400;
    a = 8'd73;
    b = 8'd19;
    #10400;
    a = 8'b0000_0000; //255
    b = 8'b0111_1111; //255
    #10400;
    a = 8'b0111_1111; //255
    b = 8'b0000_0000; //0
    #10400;
    a = 8'b0011_1110; //62
    b = 8'b0011_1110; //62
    #10400;
    $finish();
end
endmodule
