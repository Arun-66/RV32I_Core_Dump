`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 14:00:47
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control(
    input [6:0] func7,
    input [2:0] func3,
    input [6:0] opcode,
    output reg [3:0] ALU_Ctrl
    );
always @(*)begin
if(opcode == 7'b0110011 | opcode == 7'b0010011)begin
    case(func3)
        3'b000:begin    //ADD_SUB
            if(func7 == 7'b0100000)
                ALU_Ctrl= 4'b0001;
            else
                ALU_Ctrl = 4'b0000;
        end
        3'b100:    //XOR
            ALU_Ctrl = 4'b0100;
        3'b110:    //or
            ALU_Ctrl = 4'b0011;
        3'b111:    //and
            ALU_Ctrl = 4'b0010;
        3'b001:    //SLL
            ALU_Ctrl = 4'b0111;
        3'b101:begin    //SR
            if(func7 == 7'b0100000)
                ALU_Ctrl= 4'b0110;
            else
                ALU_Ctrl = 4'b0101;
        end
        3'b010:    //SLT
            ALU_Ctrl = 4'b1000;
        3'b011:    //SLTU
            ALU_Ctrl = 4'b1001;
        default:
            ALU_Ctrl = 0;
    endcase
end
else if(opcode == 7'b0000011 | opcode == 7'b0100011)
    ALU_Ctrl = 4'b0000;
else if(opcode == 7'b1100011)begin
    case(func3)
        3'b000:begin    //BEQ
            ALU_Ctrl = 4'b1010;        
        end
        3'b001:begin    //BNE
            ALU_Ctrl = 4'b1011;        
        end
        3'b100:begin    //BLT
            ALU_Ctrl = 4'b1100;        
        end
        3'b101:begin    //BGE
            ALU_Ctrl = 4'b1110;        
        end
        3'b110:begin    //BLTU
            ALU_Ctrl = 4'b1101;        
        end
        3'b111:begin    //BGEU
            ALU_Ctrl = 4'b1111;        
        end
        default:
            ALU_Ctrl = 0;
    endcase    
end
else 
    ALU_Ctrl = 0;
end
endmodule
