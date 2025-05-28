`timescale 1ns / 1ps
module DECODER(
    input [3:0] IN,
    output reg [15:0] OUT
    );
    
    
    always @(*) begin
        
        case(IN) 
            4'b0000: OUT = 16'b0000_0000_0000_0001;
            4'b0001: OUT = 16'b0000_0000_0000_0010;
            4'b0010: OUT = 16'b0000_0000_0000_0100;
            4'b0011: OUT = 16'b0000_0000_0000_1000;
            4'b0100: OUT = 16'b0000_0000_0001_0000;
            4'b0101: OUT = 16'b0000_0000_0010_0000;
            4'b0110: OUT = 16'b0000_0000_0100_0000;
            4'b0111: OUT = 16'b0000_0000_1000_0000;
            4'b1000: OUT = 16'b0000_0001_0000_0000;
            4'b1001: OUT = 16'b0000_0010_0000_0000;
            4'b1010: OUT = 16'b0000_0100_0000_0000;
            4'b1011: OUT = 16'b0000_1000_0000_0000;
            4'b1100: OUT = 16'b0001_0000_0000_0000;
            4'b1101: OUT = 16'b0010_0000_0000_0000;
            4'b1110: OUT = 16'b0100_0000_0000_0000;
            4'b1111: OUT = 16'b1000_0000_0000_0000;
            default: OUT = 16'b0000_0000_0000_0000;
        endcase  
        
    end 
endmodule

`timescale 1ns / 1ps
module top_module(
    input [7:0] sw,
    input [3:0] btn,
    output [7:0] led,
    output [6:0] cat,
    output [3:0] an,
    output dp
    );
    
wire [15:0] decoder_out;    
wire [3:0] decoder_in;
    
assign dp = decoder_out[15];
assign cat = decoder_out[14:8];
assign led = decoder_out[7:0];
assign decoder_in[3:0] = sw[3:0];
assign an = 4'b1110;

DECODER decoder1(
    .IN(decoder_in),
    .OUT(decoder_out)
);    
endmodule


`timescale 1ns / 1ps
module top_modul_tb();

reg [7:0] sw;
reg [3:0] btn = 4'b0000;
wire [7:0] led;
wire [6:0] cat;
wire [3:0] an;
wire dp;

top_module uut(
    .sw(sw),
    .btn(btn),
    .led(led),
    .cat(cat),
    .an(an),
    .dp(dp)
    );

initial begin
    sw = 8'b0000_0000; #10;
    sw = 8'b0000_0001; #10;
    sw = 8'b0000_0010; #10;
    sw = 8'b0000_0011; #10;
    sw = 8'b0000_0100; #10;
    sw = 8'b0000_0101; #10;
    sw = 8'b0000_0110; #10;
    sw = 8'b0000_0111; #10;
    sw = 8'b0000_1000; #10;
    sw = 8'b0000_1001; #10;
    sw = 8'b0000_1010; #10;
    sw = 8'b0000_1011; #10;
    sw = 8'b0000_1100; #10;
    sw = 8'b0000_1101; #10;
    sw = 8'b0000_1110; #10;
    sw = 8'b0000_1111; #10;
    sw = 8'b0000_0000; #10;
    $finish();
end 
endmodule

`timescale 1ns / 1ps
module ENCODER(
    input [3:0] IN,
    output [1:0] OUT,
    output V);
    
assign OUT[0] = IN[3] | (IN[1] & !IN[2]);
assign OUT[1] = IN[2] | IN[3];
assign V = IN[0] | IN[1] | IN[2] | IN[3];

endmodule

`timescale 1ns / 1ps
module top_module(
    input [7:0] sw,
    input [3:0] btn,
    output [7:0] led,
    output [6:0] cat,
    output [3:0] an,
    output dp
    );
    
wire [1:0] encoder_out;    
wire [3:0] encoder_in;
wire v_out;
    
assign led[1:0] = encoder_out;
assign led[7] = v_out;
assign encoder_in[3:0] = sw[3:0];


ENCODER encoder1(
    .IN(encoder_in),
    .OUT(encoder_out),
    .V(v_out)
);
endmodule

`timescale 1ns / 1ps
module top_modul_tb();

reg [7:0] sw;
wire [7:0] led;


top_module uut(
    .sw(sw),
    .btn(btn),
    .led(led),
    .cat(cat),
    .an(an),
    .dp(dp)
    );

initial begin
    sw = 8'b0000_0000; #10;
    sw = 8'b0000_0001; #10;
    sw = 8'b0000_0010; #10;
    sw = 8'b0000_0011; #10;
    sw = 8'b0000_0100; #10;
    sw = 8'b0000_0101; #10;
    sw = 8'b0000_0110; #10;
    sw = 8'b0000_0111; #10;
    sw = 8'b0000_1000; #10;
    sw = 8'b0000_1001; #10;
    sw = 8'b0000_1010; #10;
    sw = 8'b0000_1011; #10;
    sw = 8'b0000_1100; #10;
    sw = 8'b0000_1101; #10;
    sw = 8'b0000_1110; #10;
    sw = 8'b0000_1111; #10;
    sw = 8'b0000_0000; #10;
    $finish();
end 

endmodule

`timescale 1ns / 1ps
module MUX(
    input [3:0] D,
    input [1:0] S,
    output O
    );
    
assign O = (!S[0] & !S[1] & D[0]) + (!S[0] & S[1] & D[1]) + (S[0] & !S[1] & D[2]) + (S[0] & S[1] & D[3]); 
    
endmodule

`timescale 1ns / 1ps
module top_module(
    input [7:0] sw,
    input [3:0] btn,
    output [7:0] led,
    output [6:0] cat,
    output [3:0] an,
    output dp
    );

wire [3:0] input_d;
wire [1:0] input_s;
wire output_o;
    
assign input_d[3:0] = sw[3:0];
assign input_s[1:0] = btn[1:0];
assign led[0] = output_o;
    
MUX mux1(
    .D(input_d),
    .S(input_s),
    .O(output_o)
);
endmodule

`timescale 1ns / 1ps
module top_modul_tb();

reg [7:0] sw;
reg [3:0] btn;
wire [7:0] led;


top_module uut(
    .sw(sw),
    .btn(btn),
    .led(led),
    .cat(cat),
    .an(an),
    .dp(dp)
    );

initial begin
    sw = 8'b0000_0000; btn = 2'b00; #10;
    sw = 8'b0000_0001; btn = 2'b00; #10;
    sw = 8'b0000_0001; btn = 2'b00; #10;
    sw = 8'b0000_0010; btn = 2'b00; #10;
    sw = 8'b0000_0010; btn = 2'b01; #10;
    sw = 8'b0000_0100; btn = 2'b00; #10;
    sw = 8'b0000_0100; btn = 2'b10; #10;
    sw = 8'b0000_1000; btn = 2'b00; #10;
    sw = 8'b0000_1000; btn = 2'b11; #10;
    sw = 8'b0000_0000; btn = 2'b00; #10;
    $finish();
end 
endmodule


`timescale 1ns / 1ps
module MUX(
    input [3:0] D,
    input [1:0] S,
    output reg O
    );

always @(*) begin
    case(S)
        2'b00: O = D[0];
        2'b01: O = D[1];
        2'b10: O = D[2];
        2'b11: O = D[3];    
    endcase 
end 
endmodule

`timescale 1ns / 1ps
module DEMUX(
    input D,
    input [1:0] S,
    output [3:0] O
    );
    
wire enable_O0, enable_O1, enable_O2, enable_O3;

// AND and NOT gates:
assign enable_O0 = !S[0] & !S[1];
assign enable_O1 = S[0] & !S[1];
assign enable_O2 = !S[0] & S[1];
assign enable_O3 = S[0] & S[1];

//TRI gates:
assign O[0] = enable_O0 ? D : 1'bz;
assign O[1] = enable_O1 ? D : 1'bz;
assign O[2] = enable_O2 ? D : 1'bz;
assign O[3] = enable_O3 ? D : 1'bz;
    
endmodule

`timescale 1ns / 1ps
module top_module(
    input [7:0] sw,
    input [3:0] btn,
    output [7:0] led,
    output [6:0] cat,
    output [3:0] an,
    output dp
    );

wire input_d;
wire [1:0] input_s;
wire [3:0] output_o;
 
assign input_d = sw[0];
assign input_s[1:0] = btn[1:0];
assign led[3:0] = output_o[3:0];

DEMUX demux1(
    .D(input_d),
    .S(input_s),
    .O(output_o)
);
    
endmodule 

`timescale 1ns / 1ps
module top_modul_tb();

reg [7:0] sw;
reg [3:0] btn;
wire [7:0] led;


top_module uut(
    .sw(sw),
    .btn(btn),
    .led(led),
    .cat(cat),
    .an(an),
    .dp(dp)
    );

initial begin
    sw = 8'b0000_0000; btn = 2'b00; #10;
    sw = 8'b0000_0001; btn = 2'b00; #10;
    sw = 8'b0000_0000; btn = 2'b01; #10;
    sw = 8'b0000_0001; btn = 2'b01; #10;
    sw = 8'b0000_0000; btn = 2'b10; #10;
    sw = 8'b0000_0001; btn = 2'b10; #10;
    sw = 8'b0000_0000; btn = 2'b11; #10;
    sw = 8'b0000_0001; btn = 2'b11; #10;
    sw = 8'b0000_0000; btn = 2'b00; #10;
    $finish();
end 

endmodule
