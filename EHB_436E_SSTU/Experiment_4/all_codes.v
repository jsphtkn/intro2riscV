module HA(
    input x,
    input y,
    output cout,
    output sum
    );
    
assign cout = x & y;
assign sum = x ^ y;
    
endmodule

`timescale 1ns / 1ps
module HA_tb();

reg x, y;
wire cout, sum;

HA ha1(
    .x(x),
    .y(y),
    .cout(cout),
    .sum(sum)
    );

initial begin
    x = 1'b0; y = 1'b0; #10;
    x = 1'b0; y = 1'b1; #10;
    x = 1'b1; y = 1'b0; #10;
    x = 1'b1; y = 1'b1; #10;
	$finish();
end 
endmodule

module FA(
    input x,
    input y,
    input cin,
    output cout,
    output sum
    );
wire [2:0] fa_temp_wire;

HA ha1(.x(x), .y(y), .sum(fa_temp_wire[0]), .cout(fa_temp_wire[1]));
HA ha2(.x(fa_temp_wire[0]), .y(cin), .sum(sum), .cout(fa_temp_wire[2]));

assign cout = fa_temp_wire[1] | fa_temp_wire[2];

endmodule

`timescale 1ns / 1ps
module FA_tb();

wire cout, sum;
reg x, y, cin;

FA uut(
    .x(x),
    .y(y),
    .cin(cin),
    .cout(cout),
    .sum(sum)
    );

initial begin
    x = 1'b0; y = 1'b0; cin = 1'b0; #10;
    x = 1'b0; y = 1'b0; cin = 1'b1; #10;
    x = 1'b0; y = 1'b1; cin = 1'b0; #10;
    x = 1'b0; y = 1'b1; cin = 1'b1; #10;
    x = 1'b1; y = 1'b0; cin = 1'b0; #10;
    x = 1'b1; y = 1'b0; cin = 1'b1; #10;
    x = 1'b1; y = 1'b1; cin = 1'b0; #10;
    x = 1'b1; y = 1'b1; cin = 1'b1; #10;
    $finish();
end 
endmodule

module RCA(
    input [3:0] x,
    input [3:0] y,
    input cin,
    output cout,
    output [3:0] sum
    );

wire [2:0] rca_wire;

FA fa0(.x(x[0]), .y(y[0]), .cin(cin), .cout(rca_wire[0]), .sum(sum[0]));
FA fa1(.x(x[1]), .y(y[1]), .cin(rca_wire[0]), .cout(rca_wire[1]), .sum(sum[1]));
FA fa2(.x(x[2]), .y(y[2]), .cin(rca_wire[1]), .cout(rca_wire[2]), .sum(sum[2]));
FA fa3(.x(x[3]), .y(y[3]), .cin(rca_wire[2]), .cout(cout), .sum(sum[3]));

endmodule

`timescale 1ns / 1ps

module RCA_tb();

wire cout;
wire [3:0] sum;
reg [3:0] x, y;
reg cin;

RCA uut(
    .x(x),
    .y(y),
    .cin(cin),
    .cout(cout),
    .sum(sum));

initial begin
    x = 4'b0000; y = 4'b0000; cin = 1'b0; #10;
    x = 4'b0001; y = 4'b0001; cin = 1'b0; #10;
    x = 4'b0010; y = 4'b0010; cin = 1'b0; #10;
    x = 4'b0100; y = 4'b0100; cin = 1'b0; #10;
    x = 4'b1000; y = 4'b1000; cin = 1'b0; #10;
    x = 4'b0000; y = 4'b0000; cin = 1'b1; #10;
    x = 4'b0001; y = 4'b0001; cin = 1'b1; #10;
    x = 4'b0010; y = 4'b0010; cin = 1'b1; #10;
    x = 4'b0100; y = 4'b0100; cin = 1'b1; #10;
    x = 4'b1000; y = 4'b1000; cin = 1'b1; #10;
    $finish();
end
endmodule

module parametric_RCA #(parameter SIZE = 8)(
    input [SIZE - 1:0] x,
    input [SIZE - 1:0] y,
    input cin,
    output cout,
    output [SIZE - 1:0] sum
    );

wire [SIZE - 2:0] carry;
genvar i;

generate 
    for(i = 0; i < SIZE; i = i + 1) begin  : RCA_generate
        if (i == 0) begin
            FA fa_first(.x(x[i]), 
                        .y(y[i]), 
                        .cin(cin), 
                        .cout(carry[i]), 
                        .sum(sum[i]));
        end
        else if (i == SIZE - 1) begin
            FA fa_last (.x(x[i]), 
                        .y(y[i]), 
                        .cin(carry[i-1]), 
                        .cout(cout), 
                        .sum(sum[i]));
        end
        else begin
            FA fa_middle(.x(x[i]), 
                         .y(y[i]), 
                         .cin(carry[i-1]), 
                         .cout(carry[i]), 
                         .sum(sum[i]));
        end
    end
endgenerate
endmodule

`timescale 1ns / 1ps
module parametric_RCA_tb();

reg [7:0] x, y;
reg cin;
wire [7:0] sum;
wire cout;



parametric_RCA #(.SIZE(8)) uut(
    .x(x),
    .y(y),
    .cin(cin),
    .cout(cout),
    .sum(sum)
    );

initial begin
    x = 8'b0000_0001; y = 8'b0000_1000; cin = 1'b0; #10;
    x = 8'b0000_1100; y = 8'b0110_0000; cin = 1'b0; #10;
    x = 8'b1110_0011; y = 8'b1100_0001; cin = 1'b0; #10;
    x = 8'b0000_0001; y = 8'b0000_1000; cin = 1'b1; #10;
    x = 8'b0000_1100; y = 8'b0110_0000; cin = 1'b1; #10;
    x = 8'b1110_0011; y = 8'b1100_0001; cin = 1'b1; #10;
    $finish();
end 
endmodule

module CLA #(parameter SIZE = 8)(
    input [SIZE-1:0] x,
    input [SIZE-1:0] y,
    input cin,
    output cout,
    output [SIZE-1:0] s
    );

wire [SIZE-1:0] wire_g, wire_p, wire_c;
genvar i;

    generate 
        for (i = 0; i<SIZE; i = i + 1) begin
            assign wire_g[i] = x[i] & y[i];
            assign wire_p[i] = x[i] ^ y[i];       
        end
    endgenerate
    
    assign wire_c[0] = cin;
    generate 
    for (i = 1; i<SIZE; i = i + 1) begin
        assign wire_c[i] = wire_g[i-1] | (wire_p[i-1] & wire_c[i-1]);
    end
    endgenerate
    
    generate 
    for (i = 0; i<SIZE; i = i + 1) begin
        assign s[i] = wire_p[i] ^ wire_c[i];      
    end
    endgenerate

    assign cout = wire_g[SIZE-1] | (wire_p[SIZE-1] & wire_c[SIZE-1]);
endmodule

`timescale 1ns / 1ps
module CLA_tb();

wire [7:0] s;
wire cout;
reg cin;
reg [7:0] x, y;

CLA #(.SIZE(8)) uut(
    .x(x),
    .y(y),
    .cin(cin),
    .cout(cout),
    .s(s));

initial begin
    x = 4'b0000; y = 4'b0000; cin = 1'b0; #10;
    x = 4'b0001; y = 4'b0001; cin = 1'b0; #10;
    x = 4'b0010; y = 4'b0010; cin = 1'b0; #10;
    x = 4'b0100; y = 4'b0100; cin = 1'b0; #10;
    x = 4'b1000; y = 4'b1000; cin = 1'b0; #10;
    x = 4'b0000; y = 4'b0000; cin = 1'b1; #10;
    x = 4'b0001; y = 4'b0001; cin = 1'b1; #10;
    x = 4'b0010; y = 4'b0010; cin = 1'b1; #10;
    x = 4'b0100; y = 4'b0100; cin = 1'b1; #10;
    x = 4'b1000; y = 4'b1000; cin = 1'b1; #10;
    $finish();
end

endmodule

module BA #(parameter SIZE = 8)(
    input [SIZE-1:0] x,
    input [SIZE-1:0] y,
    output cout,
    output [SIZE-1:0] sum
    );
 
wire [SIZE:0] temp;

assign temp = x + y;
assign sum = temp[SIZE-1:0];
assign cout = temp[SIZE];

endmodule

`timescale 1ns / 1ps
module BA_tb();

wire [7:0] sum;
wire cout;
reg [7:0] x, y;

BA #(.SIZE(8)) uut(
    .x(x),
    .y(y),
    .cout(cout),
    .sum(sum));

initial begin
    x = 8'b0000_0000; y = 8'b0000_0000; #10;
    x = 8'b0001_0001; y = 8'b0001_0001; #10;
    x = 8'b0010_0010; y = 8'b0010_0010; #10;
    x = 8'b0100_0100; y = 8'b0100_0100; #10;
    x = 8'b1000_1001; y = 8'b1000_1000; #10;
    x = 8'b0000_0100; y = 8'b0110_1100; #10;
    x = 8'b1001_0001; y = 8'b0001_0001; #10;
    x = 8'b1010_0010; y = 8'b0110_0010; #10;
    x = 8'b0100_0100; y = 8'b0100_0111; #10;
    x = 8'b1111_1111; y = 8'b1010_1000; #10;
    $finish();
end
endmodule

module Add_Sub(
    input [3:0] A,
    input [3:0] B,
    input cin,
    output [3:0] sum,
    output cout,
    output overflow
    );
    
wire [2:0] wire_c;
wire [3:0] wire_fa_b;
genvar i;

generate
    for(i=0; i<4; i = i +1) begin
        assign wire_fa_b[i] = cin ^ B[i];
    end
endgenerate

FA fa0(.x(A[0]), .y(wire_fa_b[0]), .cin(cin), .cout(wire_c[0]), .sum(sum[0]));
FA fa1(.x(A[1]), .y(wire_fa_b[1]), .cin(wire_c[0]), .cout(wire_c[1]), .sum(sum[1]));
FA fa2(.x(A[2]), .y(wire_fa_b[2]), .cin(wire_c[1]), .cout(wire_c[2]), .sum(sum[2]));
FA fa3(.x(A[3]), .y(wire_fa_b[3]), .cin(wire_c[2]), .cout(cout), .sum(sum[3]));

assign overflow = wire_c[2] ^ cout;

endmodule

`timescale 1ns / 1ps
module Add_Sub_tb();

wire cout, overflow;
wire [3:0] sum;
reg [3:0] A, B;
reg cin;

Add_Sub uut(
    .A(A),
    .B(B),
    .cin(cin),
    .cout(cout),
    .sum(sum),
    .overflow(overflow));

initial begin
    A = 4'b0000; B = 4'b0000; cin = 1'b0; #10;
    A = 4'b1010; B = 4'b0101; cin = 1'b0; #10;
    A = 4'b0000; B = 4'b1111; cin = 1'b0; #10;
    A = 4'b1100; B = 4'b1100; cin = 1'b0; #10;
    A = 4'b1110; B = 4'b0011; cin = 1'b0; #10;
    A = 4'b0000; B = 4'b0000; cin = 1'b1; #10;
    A = 4'b1010; B = 4'b0101; cin = 1'b1; #10;
    A = 4'b0000; B = 4'b1111; cin = 1'b1; #10;
    A = 4'b1100; B = 4'b1100; cin = 1'b1; #10;
    A = 4'b1110; B = 4'b0011; cin = 1'b1; #10;
    A = 4'b1100; B = 4'b1111; cin = 1'b1; #10;
    $finish();
end

endmodule

// Unsigned 16x24-bit Multiplier
// 1 latency stage on operands
// 3 latency stage after the multiplication
// File: multipliers2.v
//
module mult_unsigned (clk, A, B, RES);

parameter WIDTHA = 16;
parameter WIDTHB = 24;
input clk;
input [WIDTHA-1:0] A;
input [WIDTHB-1:0] B;
output [WIDTHA+WIDTHB-1:0] RES;

reg [WIDTHA-1:0] rA;
reg [WIDTHB-1:0] rB;
reg [WIDTHA+WIDTHB-1:0] M [3:0];

integer i;
always @(posedge clk)
begin
rA <= A;
rB <= B;
M[0] <= rA * rB;
for (i = 0; i < 3; i = i+1)
M[i+1] <= M[i];
end

assign RES = M[3];

endmodule

