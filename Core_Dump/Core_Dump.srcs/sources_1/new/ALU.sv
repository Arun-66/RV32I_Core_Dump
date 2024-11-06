`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 11:55:29
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU#(parameter Size = 32)(
input [Size-1:0] a,b,
input [3:0]Control,
output reg [Size-1:0] out,
output reg Zero_Flag
    );
wire signed [Size-1:0] as=a;
wire signed [Size-1:0] bs=b;

always@(*)begin
    Zero_Flag = 0;
    out = 0;
    case(Control)
        4'b0000: begin   //Add
            out = a + b;
            Zero_Flag = 0;
        end
        4'b0001:begin    //Sub
            out = a - b;
            Zero_Flag = 1'b0;
        end
        4'b0010:begin    //AND
            out = a & b;
            Zero_Flag = 1'b0;
        end
        4'b0011:begin    //OR
            out = a | b;
            Zero_Flag = 1'b0;
        end
        4'b0100:begin    //XOR
            out = a ^ b;
            Zero_Flag = 1'b0;
        end
        4'b0101:begin    //Shift Right Logical SRL
            out = a >> b;
            Zero_Flag = 1'b0;
        end
        4'b0110:begin    //Shift Right Arith  SRA
            out = a >>> b;
            Zero_Flag = 1'b0;
        end
        4'b0111: begin   //Shift Left Logical SLL
            out = a << b;
            Zero_Flag = 0;
        end
        4'b1000:begin    //Set less than
            out = (as < bs) ? {Size{1'b0}} | 1 : {Size{1'b1}};
            Zero_Flag = 1'b0;
        end
        4'b1001:begin    //Set less than Unsigned
            out = (a < b) ? {Size{1'b0}} | 1 : {Size{1'b1}};
            Zero_Flag = 1'b0;
        end
        4'b1010:begin    //BEQ
            if(a == b)begin
                Zero_Flag = 1'b1;
            end
            else 
                Zero_Flag = 1'b0;     
        end
        4'b1011:begin    //BNE
            if(a != b)begin
                Zero_Flag = 1'b1;
            end
            else 
                Zero_Flag = 1'b0;
        end
        4'b1100:begin    //BLT
            if(as < bs)begin
                Zero_Flag = 1'b1;
            end
            else 
                Zero_Flag = 1'b0;
        end
        4'b1101:begin    //BLTU
            if(a < b)begin
                Zero_Flag = 1'b1;
            end
            else 
                Zero_Flag = 1'b0;
        end
        4'b1110:begin    //BGE
            if(as >= bs)begin
                Zero_Flag = 1'b1;
            end
            else 
                Zero_Flag = 1'b0;
        end
        4'b1111:begin    //BGEU
            if(a >= b)begin
                Zero_Flag = 1'b1;
            end
            else 
                Zero_Flag = 1'b0;
        end
    endcase
end    
endmodule
