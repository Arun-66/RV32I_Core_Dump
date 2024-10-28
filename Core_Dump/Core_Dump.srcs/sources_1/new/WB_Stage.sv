`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 20:52:18
// Design Name: 
// Module Name: WB_Stage
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


module WB_Stage#(parameter Size = 32)(
    input [Size-1:0] ALU_Data,Mem_Data,
    input Data_wb_control,
    output [Size-1:0] Data_to_reg
    );
MUX #(32) wb_mux(ALU_Data,Mem_Data,Data_wb_control,Data_to_reg);
endmodule
