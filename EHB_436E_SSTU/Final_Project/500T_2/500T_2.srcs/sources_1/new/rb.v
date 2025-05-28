`timescale 1ns / 1ps
module rb( 
    input [7:0] lnA,
    input [7:0] lnB,
    input [7:0] CUconst,
    input [2:0] InMuxAdd,
    input WE,reset,clk,
    input [3:0] RegAdd,
    input [3:0] OutMuxAdd,
    input [7:0] ALUout,
    output [7:0] Out,
    output [7:0] ALUinA,
    output [7:0] ALUinB
);
assign Out = R1;
assign ALUinA = R2;
assign ALUinB = R3;
wire [7:0] ALUout;
wire [7:0] R1;
wire [7:0] R2;
wire [7:0] R3;
wire [7:0] R4;
wire [7:0] R5;
wire [7:0] R6;
wire [7:0] R7;
wire [7:0] R8;
wire [7:0] R9;
wire [7:0] R10;
wire [7:0] R11;
wire [7:0] R12;
wire [7:0] R13;
wire [7:0] R14;
wire [7:0] R15;
wire [7:0] R16;
wire [7:0] RegOut;
wire [7:0] Rin;
wire [15:0] enables;

mux88 mux_instance (
    .i0(lnA),
    .i1(lnB),
    .i2(CUconst),
    .i3(ALUout),
    .i4(RegOut),
    .i5(RegOut),
    .i6(RegOut),
    .i7(RegOut),
    .sel(InMuxAdd),
    .o(Rin)
);

decoder decoder_instance (
    .RegAdd(RegAdd),
    .WE(WE),
    .oDec(enables)
);

mux8_16 mux8_16_instance (
    .c1(R1),
    .c2(R2),
    .c3(R3),
    .c4(R4),
    .c5(R5),
    .c6(R6),
    .c7(R7),
    .c8(R8),
    .c9(R9),
    .c10(R10),
    .c11(R11),
    .c12(R12),
    .c13(R13),
    .c14(R14),
    .c15(R15),
    .c16(R16),
    .sel(OutMuxAdd),
    .RegOut(RegOut)
);


regfile registers (
    .Rin(Rin),
    .rst(reset),
    .clk(clk),
    .en(enables),
    .Rout1(R1),
    .Rout2(R2),
    .Rout3(R3),
    .Rout4(R4),
    .Rout5(R5),
    .Rout6(R6),
    .Rout7(R7),
    .Rout8(R8),
    .Rout9(R9),
    .Rout10(R10),
    .Rout11(R11),
    .Rout12(R12),
    .Rout13(R13),
    .Rout14(R14),
    .Rout15(R15),
    .Rout16(R16)
);

    
endmodule

module mux88(
    input[7:0] i0,
    input[7:0] i1,
    input[7:0] i2,
    input[7:0] i3,
    input[7:0] i4,
    input[7:0] i5,
    input[7:0] i6,
    input[7:0] i7,
    input[2:0] sel,
    output reg[7:0] o
);
always @(*) begin
    case (sel)
        3'b000: o = i0;
        3'b001: o = i1;
        3'b010: o = i2;
        3'b011: o = i3;
        3'b100: o = i4;
        3'b101: o = i5;
        3'b110: o = i6;
        3'b111: o = i7;
        default: o = 0;
    endcase
end
endmodule

module decoder (
input [3:0] RegAdd,
input WE,
output reg [15:0] oDec
);

always @(*) begin

    if (WE == 0) begin
        oDec = 0;
    end else begin
        oDec = 0;
        oDec[RegAdd] = 1;
    end
end
endmodule

 module mux8_16(
input [7:0] c1,
input [7:0] c2,
input [7:0] c3,
input [7:0] c4,
input [7:0] c5,
input [7:0] c6,
input [7:0] c7,
input [7:0] c8,
input [7:0] c9,
input [7:0] c10,
input [7:0] c11,
input [7:0] c12,
input [7:0] c13,
input [7:0] c14,
input [7:0] c15,
input [7:0] c16,
input [3:0] sel,
output reg [7:0] RegOut
 );
 always @(*) begin
    case (sel)
        4'b0000: RegOut = c1;
        4'b0001: RegOut = c2;
        4'b0010: RegOut = c3;
        4'b0011: RegOut = c4;
        4'b0100: RegOut = c5;
        4'b0101: RegOut = c6;
        4'b0110: RegOut = c7;
        4'b0111: RegOut = c8;
        4'b1000: RegOut = c9;
        4'b1001: RegOut = c10;
        4'b1010: RegOut = c11;
        4'b1011: RegOut = c12;
        4'b1100: RegOut = c13;
        4'b1101: RegOut = c14;
        4'b1110: RegOut = c15;
        4'b1111: RegOut = c16;
        default: RegOut = 0;
    endcase
 end
 endmodule


module register(
    input[7:0] Rin,
    input rst,En,clk,
    output reg [7:0] Rout
);

always @(posedge clk, posedge rst) begin
    if(rst == 1) begin
        Rout <= 0;
    end else begin
        if(En == 1) begin
            Rout <= Rin;
        end
         
    end
end
endmodule

module regfile(
    input[7:0] Rin,
    input rst,clk,
    input [15:0] en,
    output [7:0] Rout1,
    output [7:0] Rout2,
    output [7:0] Rout3,
    output [7:0] Rout4,
    output [7:0] Rout5,
    output [7:0] Rout6,
    output [7:0] Rout7,
    output [7:0] Rout8,
    output [7:0] Rout9,
    output [7:0] Rout10,
    output [7:0] Rout11,
    output [7:0] Rout12,
    output [7:0] Rout13,
    output [7:0] Rout14,
    output [7:0] Rout15,
    output [7:0] Rout16    
);


register reg1 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[0]),
    .Rout(Rout1)
);
register reg2 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[1]),
    .Rout(Rout2)
);
register reg3 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[2]),
    .Rout(Rout3)
);
register reg4 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[3]),
    .Rout(Rout4)
);
register reg5 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[4]),
    .Rout(Rout5)
);

register reg6 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[5]),
    .Rout(Rout6)
);

register reg7 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[6]),
    .Rout(Rout7)
);

register reg8 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[7]),
    .Rout(Rout8)
);

register reg9 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[8]),
    .Rout(Rout9)
);

register reg10 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[9]),
    .Rout(Rout10)
);

register reg11 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[10]),
    .Rout(Rout11)
);

register reg12 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[11]),
    .Rout(Rout12)
);

register reg13 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[12]),
    .Rout(Rout13)
);

register reg14 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[13]),
    .Rout(Rout14)
);

register reg15 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[14]),
    .Rout(Rout15)
);

register reg16 (
    .Rin(Rin),
    .rst(rst),
    .clk(clk),
    .En(en[15]),
    .Rout(Rout16)
);

endmodule