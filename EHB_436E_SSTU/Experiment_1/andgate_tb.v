`timescale 1ns / 1ps

module andgate_tb();

    reg  X = 0;
    reg  Y = 0;
    wire Z;  

    andgate DUT(
        .x(X),
        .y(Y),
        .z(Z)
    );

    initial
    begin
        X=0; Y=0;
        #10;
        X=0; Y=1;
        #10;
        X=1; Y=0;
        #10;
        X=1; Y=1;
        #10;
    end

endmodule
