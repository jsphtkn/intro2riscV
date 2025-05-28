`timescale 1ns / 1ps


module stopwatch(
    input 			  clk_in,
    input 			  rst,
    output reg [7:0]  AN,       // Anode  : select 7-segment displays
    output reg [6:0]  CAT       // Catode : select 7-segment LEDs
);

    wire 		clk_out1;              // 1sec clk
    wire 		clk_out100;            // 10msec clk (100Hz)
    
    reg  [13:0] cnt;            		// 1sec timer
    wire [15:0] cnt_bcd;       	   	    // BCD converted
    reg  [3:0]  display;        		// display number
    reg  [1:0]  refresh_cnt;    		// refresh counter
    
	
	///////////////////////////////////////////////
	////**** INSTANTIATE YOUR CLK_DIVIDERs ****////
	///////////////////////////////////////////////
     
	/*// CLK DIVIDER 1Hz 
	clk_divider #( .CLK_DIV( ) ) 
    CLKDIV1(
        .clk_in	(clk_in),
        .rst	(rst),
        .clk_out(clk_out1)
    );
    
	   // CLK DIVIDER 100Hz
    clk_divider #( .CLK_DIV(  ) ) 
    CLKDIV100(
        .clk_in	(clk_in),
        .rst	(rst),
        .clk_out(clk_out100)
    );
	*/
	////////////////////////////////////////////////
	////////////////////////////////////////////////
    
    // Binary to Decimal Conversion
    bin2bcd BIN2BCD(
        .bin(cnt),
        .bcd(cnt_bcd)
    );

    // Timer 1sec
    always @(posedge clk_out1, posedge rst)
    begin
        if( rst )
        begin
            cnt     <= 0;
        end
        else
        begin
            if( cnt == 9999 )
                cnt <= 0;
            else
                cnt <= cnt + 1;
        end
    end

    // Refresh 7-segment displays
    always @(posedge clk_out100, posedge rst)
    begin
        if( rst )
        begin
            AN          <= 8'b1111_0000;
            display     <= 4'b0000;
            refresh_cnt <= 0;
        end
        else
        begin    
            case( refresh_cnt )
                2'b00: begin
                    AN          <= 8'b1111_1110;
                    display     <= cnt_bcd[3:0];       
                    refresh_cnt <= refresh_cnt + 1;         
                end
                2'b01: begin
                    AN = 8'b1111_1101;
                    display     <= cnt_bcd[7:4]; 
                    refresh_cnt <= refresh_cnt + 1;                        
                end   
                2'b10: begin
                    AN = 8'b1111_1011;
                    display     <= cnt_bcd[11:8]; 
                    refresh_cnt <= refresh_cnt + 1;                        
                end  
                2'b11: begin
                    AN = 8'b1111_0111;
                    display     <= cnt_bcd[15:12]; 
                    refresh_cnt <= refresh_cnt + 1;                        
                end   
            endcase 
       end
    end
    
    // Select 7-segment LEDs   
    always @(*)
    begin
         case(display)
             4'b0000: CAT = 7'b0000001; // "0"  
             4'b0001: CAT = 7'b1001111; // "1" 
             4'b0010: CAT = 7'b0010010; // "2" 
             4'b0011: CAT = 7'b0000110; // "3" 
             4'b0100: CAT = 7'b1001100; // "4" 
             4'b0101: CAT = 7'b0100100; // "5" 
             4'b0110: CAT = 7'b0100000; // "6" 
             4'b0111: CAT = 7'b0001111; // "7" 
             4'b1000: CAT = 7'b0000000; // "8"  
             4'b1001: CAT = 7'b0000100; // "9" 
             default: CAT = 7'b0000001; // "0"
         endcase
    end


endmodule
