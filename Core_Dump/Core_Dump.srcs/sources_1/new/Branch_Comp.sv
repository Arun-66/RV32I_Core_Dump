`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2024 20:01:05
// Design Name: 
// Module Name: Branch_Comp
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


module Branch_Comp#(parameter Size=32)(
    input [Size-1:0]rs1_data,rs2_data,
    input [2:0]func3,
    input Branch_Control,
    output reg Branch_Out
    );
wire signed [Size-1:0] rs1_signed=rs1_data;
wire signed [Size-1:0] rs2_signed=rs2_data;

always@(*)begin
if(Branch_Control)begin
    case(func3)
        3'b000:begin    //BEQ
            if(rs1_data == rs2_data)begin
                Branch_Out= 1'b1;
            end
            else 
                Branch_Out= 1'b0;     
        end
        3'b001:begin    //BNE
            if(rs1_data != rs2_data)begin
                Branch_Out= 1'b1;
            end
            else 
                Branch_Out= 1'b0;
        end
        3'b100:begin    //BLT
            if(rs1_signed < rs2_signed)begin
                Branch_Out= 1'b1;
            end
            else 
                Branch_Out= 1'b0;
        end
        3'b101:begin    //BGE
            if(rs1_signed >= rs2_signed)begin
                Branch_Out= 1'b1;
            end
            else 
                Branch_Out= 1'b0;
        end
        3'b110:begin    //BLTU
            if(rs1_data < rs2_data)begin
                Branch_Out= 1'b1;
            end
            else 
                Branch_Out= 1'b0;
        end
        3'b111:begin    //BGEU
            if(rs1_data >= rs2_data)begin
                Branch_Out= 1'b1;
            end
            else 
                Branch_Out= 1'b0;
        end
        default:
            Branch_Out = 1'b0;
    endcase
end
else
    Branch_Out = 1'b0;
end
endmodule
