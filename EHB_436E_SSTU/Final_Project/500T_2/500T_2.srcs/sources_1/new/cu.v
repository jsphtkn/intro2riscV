`timescale 1ns / 1ps

module cu(
input clk,rst,Start,
input C0,Z,
output reg WE,Busy,
output reg [7:0] CUconst,
output reg [2:0] InMuxAdd, // which input
output reg [3:0] RegAdd, // which register
output reg [3:0] OutMuxAdd, 
output reg [1:0] InsSel // ALU opcode
    );
// we have to use many states because the document only allows state regs and output regs not counter and stuff
localparam idle = 4'b0000;
localparam initial0 = 4'b0001;
localparam initial1 = 4'b0010;
localparam initial2 = 4'b0011;
localparam negativeB0 = 4'b0100; // xor(b,const) = k
localparam negativeB1 = 4'b0101; // b <= k
localparam negativeB2 = 4'b0110; // const <= const << 1; branch if const<<1 [0] == 1
localparam negativeB3 = 4'b0111; // loading A to reg1

localparam A_minus_B0 = 4'b1000;
localparam A_minus_B1 = 4'b1001;
localparam A_minus_B2 = 4'b1010;
localparam out0 = 4'b1011;
localparam out1 = 4'b1100;
reg [3:0] state;

parameter a = 3'b000 ;
parameter b = 3'b001 ;
parameter const = 3'b010;
parameter aluout = 3'b011;
parameter regout = 3'b111;

// and is not used
parameter exor = 2'b01;
parameter add = 2'b10;
parameter shift = 2'b11;
always @(posedge clk, posedge rst) begin
    if(rst == 1) begin
        WE <= 0;
        Busy <= 0;
        CUconst <= 8'b00000001;
        InMuxAdd <= 3'b000;
        RegAdd <= 4'b0011;
        OutMuxAdd <= 4'b0000;
        InsSel <= 0;
        state <= 0;
    end else begin
        case (state)
            idle: begin
            if (Start == 1) begin // it says on the document that we should only use C0 and Z but we have to use start signal to ensure correct behaviour
                Busy <= 1;
                RegAdd <= 4'b0001; // on reg2 (aka registers[1])
                InMuxAdd <= const; // write Const
                WE <= 1;
                state <= initial0;
            end else begin
                Busy <= 0;
                state <= idle;
            end
            end
            initial0 : begin
                RegAdd <= 4'b0010; // on reg3
                InMuxAdd <= b; // write B
                WE <= 1; // on the next clock edge (when we transition to initial2) the register will be updated
                state <= initial1;
            end
            initial1 : begin
                RegAdd <= 4'b0011; // on reg4
                InMuxAdd <= a; // write A
                WE <= 1;
                state <= initial2;
            end
            initial2 : begin // to make memory: 0 , const , B , A , B
                RegAdd <= 4'b0100; // on reg5
                InMuxAdd <= b; // write B
                WE <= 1;
                state <= negativeB0;
            end

            negativeB0 : begin // to make memory: 0 , const , exor(const,B) , A , B
                InsSel <= exor;
                RegAdd <= 4'b0010; // on reg3 ( in the place of the first B)
                InMuxAdd <= aluout; // write the result of xor operation on B
                WE <= 1;
                state <= negativeB1; 
            end
            negativeB1 : begin // to make memory: 0 , const<<1 , exor(const,B) , A , B
                InsSel <= shift;
                RegAdd <= 4'b0001; // on reg2 where the const is
                InMuxAdd <= aluout; // write the result of xor operation in the place of the const
                WE <= 1;
                state <= negativeB2; 
            end
            negativeB2 : begin // to make memory: 0 , const<<1 , exor(const,B) , A , B
                //C0 == 1 means that we complemented B, now to find minus B we need to add const(+1) to B. 
                if (C0 == 1) begin 
                    state <= negativeB3;
                    InsSel <= add; // we add const (which left shifted 8 times to become 0000_0001 again) to complemented B
                    WE <= 1;
                    InMuxAdd <= aluout; // we place -B in the place of ~B
                    RegAdd <= 4'b0010; // on reg3 (where the ~B is)
                end else begin
                    WE <= 0; // we don't write anything and turn back to xor'in and shifting
                    state <= negativeB0;
                end
            end
            negativeB3 : begin //we don't need const now we load A to its place to make A-B
                OutMuxAdd <= 4'b0011; //from where A is 
                RegAdd <= 4'b0001; // to reg2 where the const is
                InMuxAdd <= regout; //to make A-B
                WE <= 1;
                state <= A_minus_B0; 
            end

            A_minus_B0 : begin 
                InsSel <= add;
                WE <= 1;
                RegAdd <= 4'b0001; // on reg2 ( in the place of the A)
                InMuxAdd <= aluout; // write the result of add operation of A and -B
                state <= A_minus_B1; 
            end
            A_minus_B1 : begin 
                InsSel <= shift;
                WE <= 0; // we don't write the result of the shift operation we only check it in the next state to see if A-B is negative
                state <= A_minus_B2; 
            end
            A_minus_B2 : begin 
                if(C0 == 1) begin // A-B has reach negative 
                    OutMuxAdd <= 4'b0100; //where +B is
                    RegAdd <= 4'b0010; // on reg2 where the -B is
                    InMuxAdd <= regout; 
                    WE <= 1;
                    state <= out0; 
                end else begin
                    WE <= 0;
                    state <= A_minus_B0;
                end
            end
            out0 : begin // memory when commands of this state will be implemented: 0,[(A mod B)-B], A, B
                InsSel <= add;
                WE <= 1;
                RegAdd <= 4'b0000; // on reg0 (the output)
                InMuxAdd <= aluout; // write the result of add operation of A and -B
                state <= out1; 
            end
            out1 : begin 
                Busy <= 0;
                state <=idle;
            end
            default: state <= idle;
        endcase

end
end
endmodule
