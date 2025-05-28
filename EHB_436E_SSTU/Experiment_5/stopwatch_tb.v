`timescale 1ns / 1ps


module stopwatch_tb();

    reg  clk_in = 0; 
    reg  rst    = 0;
    wire [7:0]  AN;        // Anode  : select 7-segment displays
    wire [6:0]  CAT;       // Catode : select 7-segment LEDs

    stopwatch STW(
        .clk_in(clk_in),
        .rst(rst),
        .AN(AN),
        .CAT(CAT)
    );

    always #5 clk_in = ~clk_in;
    
    initial
    begin
        repeat(100) @(posedge clk_in);
		
        rst = 1;
        repeat(100) @(posedge clk_in);
        rst = 0;
        repeat(100) @(posedge clk_in);
    end

endmodule
