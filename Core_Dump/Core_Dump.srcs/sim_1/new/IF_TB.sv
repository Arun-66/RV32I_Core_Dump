`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2024 21:48:35
// Design Name: 
// Module Name: IF_TB
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


module IF_TB;
reg [7:0] jump;
reg clk,reset,PC_Select;
wire [31:0] Inst;

IF_Stage if1(jump,clk,reset,PC_Select,Inst);

initial begin
    #10
    reset = 0;
    PC_Select = 0;
    #1
    $display("Instruction = ",Inst);
    #10
    $stop;
end
endmodule
