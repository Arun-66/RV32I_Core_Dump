`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2024 19:28:38
// Design Name: 
// Module Name: sign_extender_20b
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


module sign_extender_20b#(parameter N = 32)(
    input logic [19:0] Imm,
    output logic [Inst_Size-1:0] Ext_Imm
    );

assign Ext_Imm = {{12{Imm[19]}},Imm};

endmodule
