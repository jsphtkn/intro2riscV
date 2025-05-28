`timescale 1ns / 1ps

/*

A Mod B için

önce -B yi bul : Xor(B, 0xFF), sonra +0x01 yapıp -Byi bul
C=ADD(A,-B) yap
criclerShift(C) yapıp C[0]'a bak 1 ise C + B yapıp outputa ver değilse A=C yapıp önceki işlemi yap

*/

module alu(
input [7:0] ALUinA,
input [7:0] ALUinB,
input [1:0] InsSel,
output [7:0]ALUout,
output C0,Z
);
wire[7:0] r0;
wire[7:0] r1;
wire[7:0] r2;
wire[7:0] r3;
wire[7:0] o;
wire output_c;
assign ALUout = o ;

and8 and8_inst (
    .a(ALUinA),
    .b(ALUinB),
    .c(r0)
);

xor8 xor8_inst (
    .a(ALUinA),
    .b(ALUinB),
    .c(r1)
);

add8 add8_inst (
    .a(ALUinA),
    .b(ALUinB),
    .c(r2),
    .cout(output_c)
);

criclerShift criclerShift_inst (
    .a(ALUinA),
    .c(r3),
    .lastbit(last_bit)
);


mux8 mux8_inst (
    .c0(r0),
    .c1(r1),
    .c2(r2),
    .c3(r3),
    .sel(InsSel),
    .c(o)
);

mux2 mux2_inst (
    .r0(1'b0),
    .r1(1'b0),
    .r2(output_c),
    .r3(last_bit),
    .sel(InsSel),
    .c0(C0)
);



zeroComparator zeroComparator_inst (
    .a(o),
    .isZero(Z)
);



endmodule

 module and8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] c
 );
assign c = a & b;
 endmodule

 module xor8 (
    input [7:0] a,
    input [7:0] b,
    output [7:0] c
 );
assign c = a ^ b;
 endmodule

 module add8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] c,
    output cout
 );
 wire [8:0] res;
 assign res = a + b;
 assign c_out = res[8];
 assign c = res[7:0];
 endmodule

 module criclerShift(
    input [7:0] a,
    output [7:0] c,
    output lastbit
 );
 assign c = {a[6:0],a[7]};
 assign lastbit = a[7];
 endmodule

 module zeroComparator(
    input[7:0] a,
    output isZero
 );
assign isZero = (a==0) ? 1 : 0;

 endmodule
 
 module mux8(
input [7:0] c0,
input [7:0] c1,
input [7:0] c2,
input [7:0] c3,
input [1:0] sel,
output reg [7:0] c
 );
 always @(*) begin
    case (sel)
        2'b00: c = c0;
        2'b01: c = c1;
        2'b10: c = c2;
        2'b11: c = c3;
        default: c = 0;
    endcase
 end
 endmodule

module mux2(
input r0,r1,r2,r3,
input [1:0] sel,
output reg c0
);
always @(*) begin
    case (sel)
        2'b00: c0 = r0;
        2'b01: c0 = r1;
        2'b10: c0 = r2;
        2'b11: c0 = r3;
        default: c0 = 0;
    endcase
 end
endmodule