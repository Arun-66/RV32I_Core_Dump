`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 15:00:06
// Design Name: 
// Module Name: IF_Stage
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


module IF_Stage#(parameter AddrSize=32,Inst_Size=32)(input [AddrSize-1:0] jump,
input clk,reset,PC_Select,output [31:0] Inst);
wire [AddrSize-1:0]PC_curr,PC_Temp,PC_NEW;
wire [AddrSize-1:0]Jump_Addr;
wire PC_Sel;

HA_Param #(AddrSize) add(.a(PC_curr),.b(4),.sum(PC_Temp));

MUX #(AddrSize) Select_PC(.a(PC_Temp),.b(Jump_Addr),.Sel(PC_Sel),.y(PC_NEW));

Program_Counter #(AddrSize) PC(.PC_NEXT(PC_NEW),.PC_Curr(PC_curr),.clk(clk),.reset(reset));

Inst_Mem #(AddrSize,2**Inst_Size,Inst_Size) Inst_Memory(.addr(PC_curr),.inst(Inst));

endmodule