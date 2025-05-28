`timescale 1ns / 1ps
module FSM1(
    input clk,
    input rst,
    input x,
    output z
    );
    
    reg q0, q1, q2;
    
    assign z = (~x & q1 & ~q0) | (x & q2 & q0);	
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin 
            q0 <= 1'b0;
            q1 <= 1'b0;
            q2 <= 1'b0;
        end else begin
            q2 <= (x & q1 & q0) | (x & q2);                       
            q1 <= (~q2 & ~q1 & q0) | (q1 & ~q0) | (x & ~q2 & ~q1);
            q0 <= (~q2 & ~q1 & ~q0) | (x & ~q1) | (x & ~q0);
        end    
    end  
endmodule


`timescale 1ns / 1ps
module FSM1_tb();

    reg   clk = 0;
    reg   rst = 0;
    reg   x   = 0;
    wire  z;
    
    FSM1 dut(
        .clk(clk),
        .rst(rst),
        .x(x),
        .z(z));

    always #5 clk = ~clk;
 
    reg [41:0] test = 42'b01_0011_0001_1100_0011_1100_0001_1111_0000_0011_1111;
    integer i;
    
    initial begin
        repeat(80) @(posedge clk);
        rst = 1;
        repeat(20) @(posedge clk);
        rst = 0;        
    
        for(i=41; i>=0; i=i-1) begin
            x = test[i];
            @(posedge clk);
        end
    end
endmodule


`timescale 1ns / 1ps
module FSM1(
    input clk,
    input rst,
    input x,
    output reg z
    );
    
    reg q0, q1, q2;
    
    always @(posedge clk or posedge rst) begin
        if(rst) z <= 1'b0;
        else z <= (~x & q1 & ~q0) | (x & q2 & q0);
    end
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin 
            q0 <= 1'b0;
            q1 <= 1'b0;
            q2 <= 1'b0;
        end else begin
            q2 <= (x & q1 & q0) | (x & q2);                       
            q1 <= (~q2 & ~q1 & q0) | (q1 & ~q0) | (x & ~q2 & ~q1);
            q0 <= (~q2 & ~q1 & ~q0) | (x & ~q1) | (x & ~q0);
        end    
    end  
endmodule


assign z = (a & q1);
assign Q0_1 = (a & ~q1 & ~q0);
assign Q1_1 = (a & q0) | (a & q1);
assign Q2_1 = 0;

assign Q2_2 = (~x);
assign Q1_2 = (x);
assign Q0_2 = (x);
assign a = (~x & ~q1) | (x & ~q2);

assign Q0 = (a & ~q1 & ~q0) | x;
assign Q1 = (a & q0) | (a & q1) | x;
assign Q2 = (~x);
assign a = (~x & ~q1) | (x & ~q2);
assign z = (a & q1);


`timescale 1ns / 1ps
module FSM2(
    input clk,
    input rst,
    input x,
    output reg z
    );
    
    reg q0, q1, q2;
    wire a, Z;
    wire Q0, Q1, Q2, Q3;
    
    assign a = x ^ q0; 
    assign Q0 = !x;
    assign Q1 = a & (!q1) & (!q2);
    assign Q2 = (q1 & a) | (a & q2);
    assign Z = a & q2;
    
  
    always @(posedge clk or rst)begin 
        q2 <= Q2;
        q1 <= Q1;
        q0 <= Q0;
        z <= Z;
        if(rst) begin
            q2 <= 1'b0;
            q1 <= 1'b0;
            q0 <= 1'b0;
            z  <= 1'b0;
        end
    end
endmodule

`timescale 1ns / 1ps
module FSM2_tb();

    reg   clk = 0;
    reg   rst = 0;
    reg   x   = 0;
    wire  z;
    
    FSM2 dUT(
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


`timescale 1ns / 1ps
module FSM2(
    input clk,
    input rst,
    input x,
    output reg z
    );
    
    reg q0, q1, q2;
    wire a, Z;
    wire Q0, Q1, Q2, Q3;
    
    assign a = x ^ q0; 
    assign Q0 = !x;
    assign Q1 = a & (!q1) & (!q2);
    assign Q2 = (q1 & a) | (a & q2);
    assign Z = a & q2;
    
  
    always @(posedge clk)begin 
        q2 <= Q2;
        q1 <= Q1;
        q0 <= Q0;
        z <= Z;
    end
    
    always @(posedge rst) begin
        if(rst) begin
            q2 <= 1'b0;
            q1 <= 1'b0;
            q0 <= 1'b0;
            z  <= 1'b0;
        end
    end
endmodule

`timescale 1ns / 1ps
module FSM2_behav(
    input clk,
    input rst,
    input x,
    output reg z
    );
    
    parameter A = 2'b00, B = 2'b01, C = 2'b10,
              M = 1'b0, N = 1'b1;
              
    reg [1:0] state1;
    reg state2;
    reg a;
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state1 <= A;
            z <= 1'b0;
        end else begin
            case(state1)
                A: begin
                    if(a) begin
                        state1 <= B;
                        z <= 1'b0;
                    end else begin
                        state1 <= A;
                        z <= 1'b0;
                    end
                end    
                B: begin
                    if(a) begin
                        state1 <= C;
                        z <= 1'b0;
                    end else begin
                        state1 <= A;
                        z <= 1'b0;
                    end
                end
                C: begin
                    if(a) begin
                        state1 <= C;
                        z <= 1'b1;
                    end else begin
                        state1 <= A;
                        z <= 1'b0;
                    end
                 end
                 default: begin
                    state1 <= A;
                    z <= 1'b0;
                 end      
            endcase
        end
    end
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state2 <= 1'b0;
            a <= 1'b0;
        end else begin
            case(state2)
                M: begin
                    if(x) begin
                        state2 <= M;
                        a <= 1'b1;
                    end else begin
                        state2 <= N;
                        a <= 1'b0;
                    end
                end
                
                N: begin
                    if(x) begin
                        state2 <= M;
                        a <= 1'b0;
                    end else begin
                        state2 <= N;
                        a <= 1'b1;
                    end
                end
                default: begin
                    state2 <= M;
                    a <= 1'b0;
                end
            endcase 
        end
    end
endmodule


`timescale 1ns / 1ps
module FSM2_behav_tb();

    reg   clk = 0;
    reg   rst = 0;
    reg   x   = 0;
    wire  z;
    
    FSM2_behav DUT(
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

`timescale 1ns / 1ps
module FSM2(
    input clk,
    input rst,
    input x,
    output reg z
    );
    
    reg q0, q1, q2;
    wire a, Z;
    wire Q0, Q1, Q2;
    
    assign a  = x ^ q0; 
    assign Q0 = !x;
    assign Q1 = a & (!q1) & (!q2);
    assign Q2 = (q1 & a) | (a & q2);
    assign Z  = a & q2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q2 <= 1'b0;
            q1 <= 1'b0;
            q0 <= 1'b0;
            z  <= 1'b0;
        end else begin
            q2 <= Q2;
            q1 <= Q1;
            q0 <= Q0;
            z  <= Z;
        end
    end
endmodule


module FSM1(
    input clk,
    input rst,
    input x,
    output  z
    );
    
    reg q0, q1, q2;
    wire Q0, Q1, Q2;
    
    assign z = (~x & q1 & ~q0) | (x & q2 & q0);
    assign Q2 = (x & q1 & q0) | (x & q2);                       
    assign Q1 = (~q2 & ~q1 & q0) | (q1 & ~q0) | (x & ~q2 & ~q1);
    assign Q0 = (~q2 & ~q1 & ~q0) | (x & ~q1) | (x & ~q0);
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin 
            q0 <= 1'b0;
            q1 <= 1'b0;
            q2 <= 1'b0;
            
        end else begin
            q2 <= Q2;
            q1 <= Q1;
            q0 <= Q0;
        end    
    end  
endmodule