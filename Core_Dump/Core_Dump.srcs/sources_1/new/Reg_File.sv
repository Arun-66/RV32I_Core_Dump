`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2024 14:51:01
// Design Name: 
// Module Name: Reg_File
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


module Reg_File#(parameter Inst_Size = 32)(
input logic [4:0] rs1,rs2,rd,
input logic wr_en,
input logic [Inst_Size-1:0] write_data,
output logic [Inst_Size-1:0] rs1_data,rs2_data
    );
    
logic [31:0]register[0:31];

always@(*)begin
    rs1_data = register[rs1];
    rs2_data = register[rs2];
end

always @(posedge wr_en) begin
    if (wr_en) begin
        register[rd] <= write_data;
    end
end
endmodule
