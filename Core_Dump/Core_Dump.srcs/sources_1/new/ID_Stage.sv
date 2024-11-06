`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2024 14:06:39
// Design Name: 
// Module Name: ID_Stage
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


module ID_Stage#(parameter Inst_Size= 32) (
input logic [Inst_Size-1:0]Inst,
input logic wr_en,
input logic Imm_Sel,
input logic[Inst_Size-1:0] write_data,
output logic [Inst_Size-1:0] rs1_data,rs2_data,
output logic [Inst_Size-1:0]Ext_Imm,
output logic[6:0] func7,
output logic[2:0]func3,
output logic[6:0] opcode
);

wire[4:0] rs1,rs2,rd;
wire[11:0] Imm;
wire[19:0] Imm20;

Inst_Decoder Decoder(Inst,rs1,rs2,rd,Imm,Imm20,func7,func3,opcode);
Sign_Extender #(32) Ext(Imm,Imm20,Imm_Sel,Ext_Imm);
Reg_File#(32)Reg_file(rs1,rs2,rd,wr_en,write_data,rs1_data,rs2_data);

endmodule
