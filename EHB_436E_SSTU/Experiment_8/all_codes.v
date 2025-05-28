`timescale 1ns / 1ps
module conv_unit(
    input pixel_clk,
    input rst,
    input enable,
    input [11:0] pixel1,
    input [11:0] pixel2,
    input [11:0] pixel3,
    input [11:0] kernel1,
    input [11:0] kernel2,
    input [11:0] kernel3,
    output reg [3:0] pixel_out
    );
    
    wire signed [8:0] mult1_1, mult1_2, mult1_3, mult2_1, mult2_2, mult2_3, mult3_1, mult3_2, mult3_3;
    wire [12:0] product;
    wire signed [4:0] pixel11, pixel12, pixel13, pixel21, pixel22, pixel23, pixel31, pixel32, pixel33;
    wire signed [3:0] kernel11, kernel12, kernel13, kernel21, kernel22, kernel23, kernel31, kernel32, kernel33;
    
    assign pixel11 = {1'b0, pixel1[3:0]};
    assign pixel12 = {1'b0, pixel1[7:4]};
    assign pixel13 = {1'b0, pixel1[11:8]};
    assign pixel21 = {1'b0, pixel2[3:0]};
    assign pixel22 = {1'b0, pixel2[7:4]};
    assign pixel23 = {1'b0, pixel2[11:8]};
    assign pixel31 = {1'b0, pixel3[3:0]};
    assign pixel32 = {1'b0, pixel3[7:4]};
    assign pixel33 = {1'b0, pixel3[11:8]};
    
    assign kernel11 = kernel1[3:0];
    assign kernel12 = kernel1[7:4];
    assign kernel13 = kernel1[11:8];
    assign kernel21 = kernel2[3:0];
    assign kernel22 = kernel2[7:4];
    assign kernel23 = kernel2[11:8];
    assign kernel31 = kernel3[3:0];
    assign kernel32 = kernel3[7:4];
    assign kernel33 = kernel3[11:8];
    
    
    
    assign mult1_1 = pixel13 * kernel13;
    assign mult1_2 = pixel12 * kernel12;
    assign mult1_3 = pixel11 * kernel11;
    
    assign mult2_1 = pixel23 * kernel23;
    assign mult2_2 = pixel22 * kernel22;
    assign mult2_3 = pixel21 * kernel21;
    
    assign mult3_1 = pixel33 * kernel33;
    assign mult3_2 = pixel32 * kernel32;
    assign mult3_3 = pixel31 * kernel31;
    
    assign product = (((mult1_1 + mult1_2) + (mult1_3 + mult2_1)) + ((mult2_2 + mult2_3) + (mult3_1 + mult3_2))) + mult3_3;
    
    always @(posedge pixel_clk or posedge rst) begin
        if(rst) begin
            pixel_out <= 4'b0000;
        end else if(enable) begin
            if(product < 0) begin
                pixel_out <= 4'b0000;    
            end else if(product > 15) begin
                pixel_out <= 4'b1111;
            end else begin
                pixel_out <= product[3:0];
            end
        end else begin
            pixel_out <= 4'b0000;
        end
        
    end
    
endmodule

`timescale 1ns / 1ps
module controller(
    input pixel_clk,
    input rst,
    input enable,
    input [11:0] data_in,
    output reg done,
    output reg [16:0] address,
    output reg [11:0] kernel1, 
    output reg [11:0] kernel2, 
    output reg [11:0] kernel3, 
    output reg [11:0] pixel1, 
    output reg [11:0] pixel2, 
    output reg [11:0] pixel3 
    );
    
    parameter FIRST_LINE = 3'b000, SECOND_LINE = 3'b001,
              PROC1 = 3'b010, PROC2 = 3'b011, PROC3 = 3'b100, 
              DONE = 3'b101;
	
	reg [2:0] state;
	reg [3:0] buffer1 [641:0];
    reg [3:0] buffer2 [641:0];
	reg [9:0] index;
	reg [11:0] previous_data;
	integer i;
	
	always @(posedge pixel_clk or posedge rst) begin
		if(rst) begin
			state <= FIRST_LINE;
			address <= 17'b0;
			done <= 1'b0;
			pixel1 <= 12'b0;
			pixel2 <= 12'b0;
			pixel3 <= 12'b0;
			index <= 10'b0;
			kernel1 <= 12'b1111_1111_1111; // -1
			kernel2 <= 12'b1111_1000_1111; // -1, 8, -1 (-113)
			kernel3 <= 12'b1111_1111_1111; // -1
			previous_data <= 12'b0;
			for (i=0; i<642; i = i +1) begin
                buffer1[i] <= 4'b0;
                buffer2[i] <= 4'b0;
            end
		end else if(enable) begin
			if(address == 103148) begin
			     state <= DONE;
			end
			case(state)
				FIRST_LINE: begin
					if(index < 640) begin
						buffer1[index] <= data_in[3:0];
						buffer1[index + 1] <= data_in[7:4];
						buffer1[index + 2] <= data_in[11:8];
						index <= index + 3;
						address <= address + 1;
						state <= FIRST_LINE;
					end else begin
						index <= 10'b0;
						state <= SECOND_LINE;
					end
				end
				SECOND_LINE: begin
					if(index < 640) begin
						buffer2[index] <= data_in[3:0];
						buffer2[index + 1] <= data_in[7:4];
						buffer2[index + 2] <= data_in[11:8];
						index <= index + 3;
						address <= address + 1;
						state <= SECOND_LINE;
					end else begin
						index <= 10'b0;
						state <= PROC1;
					end
				end
				PROC1: begin
					pixel1 <= {buffer1[index],buffer1[index+1],buffer1[index+2]};
					pixel2 <= {buffer2[index],buffer2[index+1],buffer2[index+2]};
					pixel3 <= data_in;
					buffer1[index] <= buffer2[index];
					buffer2[index] <= data_in[3:0];
					previous_data <= data_in;
					index <= index +1;
					
					if(index == 639) begin
					   state <= PROC1;
					   index <= 0;
					   address <= address + 1;
					end else begin
					   address <= address + 1;
					   state <= PROC2;
					end
				end
				PROC2: begin
				    
				    pixel1 <= {buffer1[index],buffer1[index+1],buffer1[index+2]};
					pixel2 <= {buffer2[index],buffer2[index+1],buffer2[index+2]};
					pixel3 <= {previous_data[7:4],previous_data[11:8], data_in[3:0]};
					buffer1[index] <= buffer2[index];
					buffer2[index] <= previous_data[7:4];
					index <= index +1;
					
					if(index == 639) begin
					   state <= PROC1;
					   index <= 0;
					   address <= address + 1;
					end else begin
					   state <= PROC3;
					end
				end
				PROC3: begin
					pixel1 <= {buffer1[index],buffer1[index+1],buffer1[index+2]};
					pixel2 <= {buffer2[index],buffer2[index+1],buffer2[index+2]};
					pixel3 <= {previous_data[11:8], data_in[3:0], data_in[7:4]};
					buffer1[index] <= buffer2[index];
					buffer2[index] <= previous_data[11:8];
					index <= index + 1;
					
					if(index == 639) begin
					   address <= address + 1;
					   state <= PROC1;
					   index <= 0;
					   
					end else begin
					   state <= PROC1;
					end
				end
				DONE: begin
				    state <= DONE;
				    done <= 1;
				end
			endcase
		end
	end
endmodule

`timescale 1ns / 1ps
module top_module(
    input wire clk,
    input wire rst,
    output wire VGA_HS,
    output wire VGA_VS,
    output wire [3:0] VGA_R,
    output wire [3:0] VGA_G,
    output wire [3:0] VGA_B
    );
    
    wire clk_25MHz, data_en;
    reg [1:0] counter=0;
    assign clk_25MHz = counter[1];
    
    always @(posedge clk) begin
        counter <= counter + 1;
    end
    
    vga_driver VGA(
        .pixel_clk(clk_25MHz),
        .rst(rst),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .data_en(data_en)                                  
        );
 
 
 //------------------------------------RED--------------------------------
    
    wire [11:0] R_K1, R_K2, R_K3, R_P1, R_P2, R_P3;
    wire [16:0] R_addr;
    wire [11:0] R_data;
    
    blk_mem_red RAM_R(
        .clka(clk_25MHz),    // input wire clka
        .ena(data_en),      // input wire ena
        .wea(1'b0),      // input wire [0 : 0] wea
        .addra(R_addr),  // input wire [16 : 0] addra
        .dina(1'b0),    // input wire [11 : 0] dina
        .douta(R_data)
        );
    
    controller controller_R(
        .pixel_clk(clk_25MHz),                 
        .rst(rst),                       
        .enable(data_en),                    
        .data_in(R_data),            
        .done(),                 
        .address(R_addr),       
        .kernel1(R_K1),
        .kernel2(R_K2),
        .kernel3(R_K3),
        .pixel1(R_P1),        
        .pixel2(R_P2),        
        .pixel3(R_P3)
        );
    
    conv_unit conv_R(
        .pixel_clk(clk_25MHz),
        .rst(rst),
        .enable(data_en),
        .kernel1(R_K1),
        .kernel2(R_K2),
        .kernel3(R_K3),
        .pixel1(R_P1),        
        .pixel2(R_P2),        
        .pixel3(R_P3),
        .pixel_out(VGA_R)
        );
    
  //------------------------------------GREEN--------------------------------
    
    wire [11:0] G_K1, G_K2, G_K3, G_P1, G_P2, G_P3;
    wire [16:0] G_addr;
    wire [11:0] G_data;
    
    blk_mem_green RAM_G(
        .clka(clk_25MHz),    // input wire clka
        .ena(data_en),      // input wire ena
        .wea(1'b0),      // input wire [0 : 0] wea
        .addra(G_addr),  // input wire [16 : 0] addra
        .dina(1'b0),    // input wire [11 : 0] dina
        .douta(G_data)
        );
    
    controller controller_G(
        .pixel_clk(clk_25MHz),                 
        .rst(rst),                       
        .enable(data_en),                    
        .data_in(G_data),            
        .done(),                 
        .address(G_addr),       
        .kernel1(G_K1),
        .kernel2(G_K2),
        .kernel3(G_K3),
        .pixel1(G_P1),        
        .pixel2(G_P2),        
        .pixel3(G_P3)
        );
    
    conv_unit conv_G(
        .pixel_clk(clk_25MHz),
        .rst(rst),
        .enable(data_en),
        .kernel1(G_K1),
        .kernel2(G_K2),
        .kernel3(G_K3),
        .pixel1(G_P1),        
        .pixel2(G_P2),        
        .pixel3(G_P3),
        .pixel_out(VGA_G)
        );
    
 //------------------------------------BLUE--------------------------------
    
    wire [11:0] B_K1, B_K2, B_K3, B_P1, B_P2, B_P3;
    wire [16:0] B_addr;
    wire [11:0] B_data;
    
    blk_mem_blue RAM_B(
        .clka(clk_25MHz),    // input wire clka
        .ena(data_en),      // input wire ena
        .wea(1'b0),      // input wire [0 : 0] wea
        .addra(B_addr),  // input wire [16 : 0] addra
        .dina(1'b0),    // input wire [11 : 0] dina
        .douta(B_data)
        );
    
    controller controller_B(
        .pixel_clk(clk_25MHz),                 
        .rst(rst),                       
        .enable(data_en),                    
        .data_in(B_data),            
        .done(),                 
        .address(B_addr),       
        .kernel1(B_K1),
        .kernel2(B_K2),
        .kernel3(B_K3),
        .pixel1(B_P1),        
        .pixel2(B_P2),        
        .pixel3(B_P3)
        );
    
    conv_unit conv_B(
        .pixel_clk(clk_25MHz),
        .rst(rst),
        .enable(data_en),
        .kernel1(B_K1),
        .kernel2(B_K2),
        .kernel3(B_K3),
        .pixel1(B_P1),        
        .pixel2(B_P2),        
        .pixel3(B_P3),
        .pixel_out(VGA_B)
        );
    
endmodule

`timescale 1ns / 1ns

module top_module_tb;

    // Clock and reset signals
    reg clk;
    reg rst;
    reg slw_clk;
    // Outputs from the DUT
    wire VGA_HS;
    wire VGA_VS;
    wire [3:0] VGA_R;
    wire [3:0] VGA_G;
    wire [3:0] VGA_B;

    // Instantiate the top_module
    top_module dut (
        .clk(clk),
        .rst(rst),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B)
    );

    // Clock generation (100 MHz)
    always #5 clk = ~clk;
    
    
    // File handling
    integer red_file, green_file, blue_file;
    integer i;

    // Test procedure
    initial begin
        // Initialize signals
        clk = 1'b0;
        rst = 1'b1;
        
        // Open output files
        red_file = $fopen("output_red.txt", "w");
        green_file = $fopen("output_green.txt", "w");
        blue_file = $fopen("output_blue.txt", "w");

        if (red_file == 0 || green_file == 0 || blue_file == 0) begin
            $display("ERROR: Could not open output files.");
            
        end

        // Apply reset
        #50 rst = 0;

        // Wait for some time to let the system run and process data
        //repeat (480 * 640) begin // Simulate 640x480 image
        for(i = 0; i <307200; i = i +1) begin
            $fwrite(red_file, "%d\n", VGA_R);    // Write Red channel to file
            $fwrite(green_file, "%d\n", VGA_G);  // Write Green channel to file
            $fwrite(blue_file, "%d\n", VGA_B);   // Write Blue channel to file
            #10;
        end
        
        $fclose(red_file);
        $fclose(green_file);
        $fclose(blue_file);

        $display("Simulation completed. Output files are ready.");

        // End simulation
        $finish();
    end 
endmodule
