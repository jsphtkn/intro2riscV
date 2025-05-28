`timescale 1ns / 1ns
module uart_top_tb();

wire [7:0] data_out;
reg rst, clk, Tx_en, Rx_en;
reg [7:0] data_in;
reg [1:0] BR_mode; // 0 -> 9600 and 1 -> 115200

uart_top uut(
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .Tx_en(Tx_en),
    .Rx_en(Rx_en),
    .BR_mode(BR_mode),
    .data_out(data_out)
    );

    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0; BR_mode = 1'b0;  //9600
        Tx_en = 1'b0; Rx_en = 1'b0;
        data_in = 8'b0000_0000;
        rst = 1'b1; #10; rst = 1'b0; 
        Tx_en = 1'b1; Rx_en = 1'b1;
        
        data_in = 8'b1100_0011; Tx_en = 1'b1;
        #1000000;
        data_in = 8'b1111_1111; Tx_en = 1'b1;
        #1100000;
        data_in = 8'b0000_0000; Tx_en = 1'b1;
        #1200000;
        data_in = 8'b1010_1010; Tx_en = 1'b1;
        #750000; Tx_en = 1'b0;
        #1500000;
        
        BR_mode = 1'b1;  //115200
        Tx_en = 1'b0; Rx_en = 1'b0;
        data_in = 8'b0000_0000;
        rst = 1'b1; #10; rst = 1'b0; 
        Tx_en = 1'b1; Rx_en = 1'b1;
        
        data_in = 8'b1100_0011;
        #100000;
        data_in = 8'b1111_1111;
        #150000;
        data_in = 8'b0000_0000;
        #160000;
        data_in = 8'b1010_1010;
        #200000;
        Tx_en = 1'b0; Rx_en = 1'b0; 
        #10000;
        $finish();
    end
endmodule
