`timescale 1ns / 1ps
module baud_gen_tb();
    
    wire clk_Rx, clk_Tx;
    reg rst, clk, BR_mode; 
        
    baud_gen #(.Rx_resolution(8)) uut(
        .clk(clk),
        .rst(rst),
        .BR_mode(BR_mode),
        .clk_Tx(clk_Tx),
        .clk_Rx(clk_Rx)
        );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0; rst = 1'b1; BR_mode = 1'b0;
        #10; rst = 1'b0;
        #1000000;
        rst = 1'b1; BR_mode = 1'b1;
        #10; rst = 1'b0;
        #1000000;
        $finish();  
    end
endmodule
