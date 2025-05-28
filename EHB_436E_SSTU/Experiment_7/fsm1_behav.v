`timescale 1ns / 1ps

module fsm1_behav(
    input       clk,
    input       rst,
    input       x,
    output reg  z
);

    parameter A = 3'b000, B = 3'b001, C = 3'b010,
              D = 3'b011, E = 3'b100, F = 3'b101;
              
    reg [2:0] state;

    always @(posedge clk, posedge rst)
    begin
        if(rst)
        begin
            state <= A;
        end
        else
        begin
            case(state)
                A : begin
                    if( x )
                        state <= D;
                    else
                        state <= B;                        
						z <= 0;
                end
                B : begin
                    if( x )
                        state <= D;
                    else
                        state <= C;                        
						z <= 0;                
                end
                C : begin
                    if( x )
                    begin
                        state <= D;
                        z     <= 0;       
                    end             
                    else
                    begin
                        state <= C;  
                        z     <= 1;                    
                    end                     
                end
                D : begin
                    if( x )
                        state <= E;
                    else
                        state <= A;                        
						z <= 0;                  
                end
                E : begin
                    if( x )
                        state <= F;
                    else
                        state <= A;                        
						z <= 0;                     
                end
                F : begin
                    if( x )
                    begin
                        state <= F;
                        z     <= 1;
                    end
                    else
                    begin
                        state <= A;                        
                        z     <= 0;
                    end                 
                end
                default: begin
                    state <= A;                        
                    z     <= 0;                         
                end
            endcase
        end
    end
endmodule
