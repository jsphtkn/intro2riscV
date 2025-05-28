`timescale 1ns / 1ps

module top(
input clk,reset,Start,Busy,
input [7:0] InA,
input [7:0] InB,
output [7:0] Out
    );

wire C0,Z,WE;
wire [1:0] InsSel;
wire [7:0] ALUinA;
wire [7:0] ALUinB;
wire [7:0] ALUout;
wire [7:0] CUconst;
wire [2:0] InMuxAdd;
wire [3:0] OutMuxAdd;
wire [3:0] RegAdd;
cu cu_instance (
    .clk(clk),
    .rst(reset),
    .Start(Start),
    .Busy(Busy),
    .C0(C0),
    .Z(Z),
    .WE(WE),
    .CUconst(CUconst),
    .InMuxAdd(InMuxAdd),
    .RegAdd(RegAdd),
    .OutMuxAdd(OutMuxAdd),
    .InsSel(InsSel)
);

rb rb_instance (
    .lnA(InA),
    .lnB(InB),
    .CUconst(CUconst),
    .InMuxAdd(InMuxAdd),
    .WE(WE),
    .reset(reset),
    .clk(clk),
    .RegAdd(RegAdd),
    .OutMuxAdd(OutMuxAdd),
    .ALUout(ALUout),
    .Out(Out),
    .ALUinA(ALUinA),
    .ALUinB(ALUinB)
);

alu alu_instance (
    .ALUinA(ALUinA),
    .ALUinB(ALUinB),
    .InsSel(InsSel),
    .ALUout(ALUout),
    .C0(C0),
    .Z(Z)
);

endmodule