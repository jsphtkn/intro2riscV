	`timescale 1ns / 1ps


module fsm1_behav_tb();

    reg   clk = 0;
    reg   rst = 0;
    reg   x   = 0;
    wire  z;
    
    fsm1_behav UUT(
        .clk(clk),
        .rst(rst),
        .x(x),
        .z(z)
    );

    always #5 clk = ~clk;
 
    reg [41:0] test = 42'b0100_1100_0111_0000_1111_0000_0111_1100_0000_1111_11;
    integer i;
    
    initial
    begin
        repeat(80) @(posedge clk);
        rst = 1;
        repeat(20) @(posedge clk);
        rst = 0;        
    
        for(i=41; i>=0; i=i-1)
        begin
            x = test[i];
            @(posedge clk);
        end
    end
endmodule
