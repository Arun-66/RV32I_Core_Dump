`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2024 15:16:45
// Design Name: 
// Module Name: Sign_Extender
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


module Sign_Extender#(parameter Inst_Size =32 )(
input logic [11:0] Imm,
output logic [Inst_Size-1:0] Ext_Imm
//input logic [19:0]
    );

//MUX #(32) m12({20'b0,Imm},{20'b1,Imm},Imm[11],Ext_Imm);
assign Ext_Imm = {{20{Imm[11]}},Imm};
endmodule
